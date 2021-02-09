#' Get a tidy dataset of NHL goalies game logs
#'
#' The function `tidy_goalies_gamelogs()` is meant to be a user-friendly way of getting the NHL game
#' logs of selected goalies.
#'
#' @param players_id Integer vector indicating the NHL ID of goalies for whom the game logs will be
#'   returned.
#' @param seasons_id *(optional)* Character vector indicating the seasons for which the game logs
#'   will be returned. The required format for each character is 'xxxxyyyy'. Default to `NULL` which
#'   will return the full career game logs for each player.
#' @param regular *(optional)* Logical indicating if the regular season game logs should be
#'   returned. Default to `TRUE`.
#' @param playoffs *(optional)* Logical indicating if the playoffs game logs should be returned.
#'   Default to `TRUE`.
#' @param tz *(optional)* Character specifying the timezone that should be used for datetime.
#'   Default to the user system timezone.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get the NHL career game logs of Roberto Luongo
#' tidy_goalies_gamelogs(8466141L)
#'
#' # Get the 2010-11 NHL playoffs game logs of both Roberto Luongo and Corey Crawford, keeping the
#' # IDs
#' tidy_goalies_gamelogs(
#'   players_id = c(8466141L, 8470645L),
#'   seasons_id = "20102011",
#'   regular = FALSE,
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_goalies_gamelogs <- function(
  players_id,
  seasons_id = NULL,
  regular = TRUE,
  playoffs = TRUE,
  tz = Sys.timezone(),
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  players_meta <- tidy_players_meta(keep_id = TRUE, return_datatable = TRUE)

  error <- FALSE
  if (!is.numeric(players_id) | sum(is.na(players_id)) > 0L | length(players_id) == 0L) {
    error <- TRUE
  } else {
    if (sum(as.integer(players_id) != players_id) > 0L) {
      error <- TRUE
    } else {
      players_id <- as.integer(players_id)
    }
  }
  if (error) {
    stop("argument 'players_id' should be a vector of integers")
  }

  non_goalies_id <- players_meta[player_id %in% players_id & player_position_type != "G", player_id]
  if (length(non_goalies_id) > 0L) {
    stop(paste(
      "every elements of the argument 'players_id' must be identified as goalies,",
      "the following are not:",
      paste(non_goalies_id, collapse = ", ")
    ))
  }

  if (!is.null(seasons_id)) {
    # TODO: Add parameters check when tidy_seasons_meta() will be available
  }

  if (!is.logical(regular) | is.na(regular) | length(regular) != 1L) {
    stop("argument 'regular' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(playoffs) | is.na(playoffs) | length(playoffs) != 1L) {
    stop("argument 'playoffs' should be one of 'TRUE' or 'FALSE'")
  }

  if (!regular & !playoffs) {
    stop("at least one of arguments 'regular' or 'playoffs' should be 'TRUE'")
  }

  if (!is.logical(keep_id) | is.na(keep_id) | length(keep_id) != 1L) {
    stop("argument 'keep_id' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(return_datatable) | is.na(return_datatable) | length(return_datatable) != 1L) {
    stop("argument 'return_datatable' should be one of 'TRUE' or 'FALSE'")
  }

  goalies_stats <- tidy_goalies_stats(
    players_id = players_id,
    regular = regular,
    playoffs = playoffs,
    keep_id = TRUE,
    return_datatable = TRUE
  )

  if (!is.null(seasons_id)) {
    goalies_stats <- goalies_stats[season_id %in% seasons_id]
  }

  goalies_seasons <- goalies_stats[, .(
    url = paste0(
      "people/", player_id,
      "/stats?stats=", ifelse(season_type == "regular", "gameLog", "playoffGameLog"),
      "&season=", season_id
    )
  ), .(player_id, season_id, season_type)]

  goalies_seasons[, api_return := get_stats_api(url)]

  goalies_gamelogs <- goalies_seasons[, rbindlist(mapply(
    FUN = function(player_id, season_id, season_type, api_return) {

      splits <- create_data_table(api_return$stats$splits[[1]])
      splits[, `:=`(
        player_id = player_id,
        season_id = season_id,
        season_type = season_type
      )]

      splits[]

    },
    player_id = player_id,
    season_id = season_id,
    season_type = season_type,
    api_return = api_return,
    SIMPLIFY = FALSE
  ), fill = TRUE)]

  validate_columns(goalies_gamelogs, list(
    player_id = NA_integer_,
    season_id = NA_character_,
    season_type = NA_character_,
    game.gamePk = NA_integer_,
    team.id = NA_integer_,
    opponent.id = NA_integer_,
    stat.gamesStarted = NA_integer_,
    stat.decision = NA_character_,
    stat.shutouts = NA_integer_,
    stat.shotsAgainst = NA_integer_,
    stat.goalsAgainst = NA_integer_,
    stat.timeOnIce = NA_character_,
    stat.evenShots = NA_integer_,
    stat.evenSaves = NA_integer_,
    stat.powerPlayShots = NA_integer_,
    stat.powerPlaySaves = NA_integer_,
    stat.shortHandedShots = NA_integer_,
    stat.shortHandedSaves = NA_integer_
  ))

  goalies_gamelogs <- goalies_gamelogs[, .(
    player_id = player_id,
    season_id = season_id,
    season_type = season_type,
    game_id = game.gamePk,
    team_id = team.id,
    opponent_id = opponent.id,
    goalie_games = rep(1L, .N),
    goalie_started = stat.gamesStarted,
    goalie_wins = as.integer(stat.decision == "W"),
    goalie_losses = as.integer(stat.decision == "L"),
    goalie_ties = as.integer(stat.decision == "T"),
    goalie_ot = as.integer(stat.decision == "O"),
    goalie_shutouts = stat.shutouts,
    goalie_shotagainst = stat.shotsAgainst,
    goalie_goalagainst = stat.goalsAgainst,
    goalie_savepct = (stat.shotsAgainst - stat.goalsAgainst) / stat.shotsAgainst,
    goalie_gaa = stat.goalsAgainst / (convert_toi(stat.timeOnIce) / 60),
    goalie_toi = convert_toi(stat.timeOnIce),
    goalie_ev_shotagainst = stat.evenShots,
    goalie_ev_goalagainst = stat.evenShots - stat.evenSaves,
    goalie_ev_savepct = stat.evenSaves / stat.evenShots,
    goalie_pp_shotagainst = stat.powerPlayShots,
    goalie_pp_goalagainst = stat.powerPlayShots - stat.powerPlaySaves,
    goalie_pp_savepct = stat.powerPlaySaves / stat.powerPlayShots,
    goalie_pk_shotagainst = stat.shortHandedShots,
    goalie_pk_goalagainst = stat.shortHandedShots - stat.shortHandedSaves,
    goalie_pk_savepct = stat.shortHandedSaves / stat.shortHandedShots
  )]

  goalies_gamelogs[is.na(goalie_started), goalie_started := 0L]
  goalies_gamelogs[is.na(goalie_wins), `:=`(
    goalie_wins = 0L,
    goalie_losses = 0L,
    goalie_ties = 0L,
    goalie_ot = 0L
  )]

  schedules_home <- tidy_schedules(
    seasons_id = goalies_seasons[, unique(season_id)],
    regular = regular,
    playoffs = playoffs,
    tz = tz,
    keep_id = TRUE,
    return_datatable = TRUE
  )
  schedules_away <- copy(schedules_home)

  old <- c(outer(c("home", "away"), c("score", "abbreviation", "id"), paste, sep = "_"))
  new_home <- c(outer(c("team", "opponent"), c("score", "abbreviation", "id"), paste, sep = "_"))
  new_away <- c(outer(c("opponent", "team"), c("score", "abbreviation", "id"), paste, sep = "_"))

  setnames(schedules_home, old, new_home)
  setnames(schedules_away, old, new_away)
  schedules_home[, team_status := "home"]
  schedules_away[, team_status := "away"]
  schedule_mirrored <- rbindlist(list(schedules_home, schedules_away), use.names = TRUE)

  cols <- setdiff(colnames(schedule_mirrored), c("season_id", "season_type", "game_id", "team_id",
                                                 "opponent_id"))
  goalies_gamelogs[schedule_mirrored,
                   (cols) := mget(cols),
                   on = .(season_id, season_type, game_id, team_id, opponent_id)]

  goalies_gamelogs[players_meta, player_name := player_name, on = .(player_id)]

  setcolorder(goalies_gamelogs, c(
    "player_id", "player_name", "season_id", "season_years", "season_type", "game_id",
    "game_datetime", "venue_name", "team_status", "team_id", "team_abbreviation", "team_score",
    "opponent_score", "opponent_abbreviation", "opponent_id", "game_status", "game_nbot",
    "game_shootout"))
  setorder(goalies_gamelogs, player_id, game_datetime)

  if (!keep_id) {
    drop_ids(goalies_gamelogs)
  }

  add_copyright(goalies_gamelogs)

  if (return_datatable) {
    goalies_gamelogs[]
  } else {
    as.data.frame(goalies_gamelogs)
  }

}
