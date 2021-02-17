#' Get a tidy dataset of NHL skaters game logs
#'
#' The function `tidy_skaters_gamelogs()` is meant to be a user-friendly way of getting the NHL game
#' logs of selected skaters.
#'
#' @param players_id Integer vector indicating the NHL ID of skaters for whom the game logs will be
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
#' # Get the NHL career game logs of Vincent Lecavalier
#' tidy_skaters_gamelogs(8467329L)
#'
#' # Get the 2010-11 NHL playoffs game logs of both Vincent Lecavalier and Martin St. Louis,
#' # keeping the IDs
#' tidy_skaters_gamelogs(
#'   players_id = c(8467329L, 8466378L),
#'   seasons_id = "20102011",
#'   regular = FALSE,
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_skaters_gamelogs <- function(
  players_id,
  seasons_id = NULL,
  regular = TRUE,
  playoffs = TRUE,
  tz = Sys.timezone(),
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  players_id <- assert_skaters_id(players_id)
  if (!is.null(seasons_id)) {
    seasons_id <- assert_seasons_id(seasons_id)
  }

  assert_regular_playoffs(regular, playoffs)
  assert_tz(tz)
  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

  skaters_stats <- tidy_skaters_stats(
    players_id = players_id,
    regular = regular,
    playoffs = playoffs,
    keep_id = TRUE,
    return_datatable = TRUE
  )

  if (!is.null(seasons_id)) {
    skaters_stats <- skaters_stats[season_id %in% seasons_id]
  }

  skaters_seasons <- skaters_stats[, .(
    url = paste0(
      "people/", player_id,
      "/stats?stats=", ifelse(season_type == "regular", "gameLog", "playoffGameLog"),
      "&season=", season_id
    )
  ), .(player_id, season_id, season_type)]

  skaters_seasons[, api_return := get_stats_api(url)]

  skaters_gamelogs <- skaters_seasons[, rbindlist(mapply(
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

  validate_columns(skaters_gamelogs, list(
    player_id = NA_integer_,
    season_id = NA_character_,
    season_type = NA_character_,
    game.gamePk = NA_integer_,
    team.id = NA_integer_,
    opponent.id = NA_integer_,
    stat.goals = NA_integer_,
    stat.assists = NA_integer_,
    stat.points = NA_integer_,
    stat.plusMinus = NA_integer_,
    stat.pim = NA_integer_,
    stat.timeOnIce = NA_character_,
    stat.shifts = NA_integer_,
    stat.gameWinningGoals = NA_integer_,
    stat.overTimeGoals = NA_integer_,
    stat.shots = NA_integer_,
    stat.blocked = NA_integer_,
    stat.hits = NA_integer_,
    stat.powerPlayGoals = NA_integer_,
    stat.shortHandedGoals = NA_integer_,
    stat.powerPlayPoints = NA_integer_,
    stat.shortHandedPoints = NA_integer_,
    stat.evenTimeOnIce = NA_character_,
    stat.powerPlayTimeOnIce = NA_character_,
    stat.shortHandedTimeOnIce = NA_character_
  ))

  skaters_gamelogs <- skaters_gamelogs[, .(
    player_id = player_id,
    season_id = season_id,
    season_type = season_type,
    game_id = game.gamePk,
    team_id = team.id,
    opponent_id = opponent.id,
    skater_games = rep(1L, .N),
    skater_goals = stat.goals,
    skater_assists = stat.assists,
    skater_points = stat.points,
    skater_plusminus = stat.plusMinus,
    skater_pim = stat.pim,
    skater_toi = convert_toi(stat.timeOnIce),
    skater_shifts = stat.shifts,
    skater_gwg = stat.gameWinningGoals,
    skater_otg = stat.overTimeGoals,
    skater_shots = stat.shots,
    skater_blocked = stat.blocked,
    skater_hits = stat.hits,
    skater_ev_goals = stat.goals - stat.powerPlayGoals - stat.shortHandedGoals,
    skater_ev_assists = stat.assists - (stat.powerPlayPoints - stat.powerPlayGoals) -
      (stat.shortHandedPoints - stat.shortHandedGoals),
    skater_ev_points = stat.points - stat.powerPlayPoints - stat.shortHandedPoints,
    skater_ev_toi = convert_toi(stat.evenTimeOnIce),
    skater_pp_goals = stat.powerPlayGoals,
    skater_pp_assists = stat.powerPlayPoints - stat.powerPlayGoals,
    skater_pp_points = stat.powerPlayPoints,
    skater_pp_toi = convert_toi(stat.powerPlayTimeOnIce),
    skater_pk_goals = stat.shortHandedGoals,
    skater_pk_assists = stat.shortHandedPoints - stat.shortHandedGoals,
    skater_pk_points = stat.shortHandedPoints,
    skater_pk_toi = convert_toi(stat.shortHandedTimeOnIce)
  )]

  schedules_home <- tidy_schedules(
    seasons_id = skaters_seasons[, unique(season_id)],
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
  skaters_gamelogs[schedule_mirrored,
                   (cols) := mget(cols),
                   on = .(season_id, season_type, game_id, team_id, opponent_id)]

  players_meta <- get("players_meta", envir = data)
  skaters_gamelogs[players_meta, player_name := player_name, on = .(player_id)]

  setcolorder(skaters_gamelogs, c(
    "player_id", "player_name", "season_id", "season_years", "season_type", "game_id",
    "game_datetime", "venue_name", "team_status", "team_id", "team_abbreviation", "team_shots",
    "team_score", "opponent_score", "opponent_shots", "opponent_abbreviation", "opponent_id",
    "game_status", "game_nbot", "game_shootout"))
  setorder(skaters_gamelogs, player_id, game_datetime)

  if (!keep_id) {
    drop_ids(skaters_gamelogs)
  }

  add_copyright(skaters_gamelogs)

  if (return_datatable) {
    skaters_gamelogs[]
  } else {
    as.data.frame(skaters_gamelogs)
  }

}
