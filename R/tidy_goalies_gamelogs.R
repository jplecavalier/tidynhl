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

  players_id <- assert_goalies_id(players_id)
  if (!is.null(seasons_id)) {
    seasons_id <- assert_seasons_id(seasons_id)
  }

  assert_regular_playoffs(regular, playoffs)
  assert_tz(tz)
  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

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

      if (!is.null(api_return$messageNumber)) {
        warning(paste(
          "some game logs are missing since the API returned an error for the following keys:",
          paste0("{player_id=", player_id, ","),
          paste0("season_id=", season_id, ","),
          paste0("season_type=", season_type, "}")
        ))
        return(NULL)
      }

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
    expand_periods = FALSE,
    regular = regular,
    playoffs = playoffs,
    tz = tz,
    keep_id = TRUE,
    return_datatable = TRUE
  )
  schedules_away <- copy(schedules_home)

  team_cols <- c("id", "abbreviation", "score", "shots")
  old <- c(outer(c("home", "away"), team_cols, paste, sep = "_"))
  new_home <- c(outer(c("team", "opponent"), team_cols, paste, sep = "_"))
  new_away <- c(outer(c("opponent", "team"), team_cols, paste, sep = "_"))

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

  players_meta <- get("players_meta", envir = data)
  goalies_gamelogs[players_meta, player_name := player_name, on = .(player_id)]

  setcolorder(goalies_gamelogs, c(
    "player_id", "player_name", "season_id", "season_years", "season_type", "game_id",
    "game_datetime", "venue_name", "team_status", "team_id", "team_abbreviation", "team_shots",
    "team_score", "opponent_score", "opponent_shots", "opponent_abbreviation", "opponent_id",
    "game_status", "game_nbot", "game_shootout"))
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
