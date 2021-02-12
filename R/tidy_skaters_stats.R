#' Get a tidy dataset of NHL skaters statistics
#'
#' The function `tidy_skaters_stats()` is meant to be a user-friendly way of getting the NHL
#' year-by-year statistics of selected skaters.
#'
#' @param players_id Integer vector indicating the NHL ID of skaters for whom the statistics will be
#'   returned.
#' @param regular *(optional)* Logical indicating if the regular season statistics should be
#'   returned. Default to `TRUE`.
#' @param playoffs *(optional)* Logical indicating if the playoffs statistics should be returned.
#'   Default to `TRUE`.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get the NHL career statistics of Vincent Lecavalier
#' tidy_skaters_stats(8467329L)
#'
#' # Get the NHL career playoffs statistics of both Vincent Lecavalier and Martin St. Louis, keeping
#' # the IDs
#' tidy_skaters_stats(c(8467329L, 8466378L), regular = FALSE, keep_id = TRUE)
#'
#' @export
tidy_skaters_stats <- function(
  players_id,
  regular = TRUE,
  playoffs = TRUE,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  players_id <- assert_skaters_id(players_id)

  assert_regular_playoffs(regular, playoffs)
  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

  if (length(players_id) == 0L) {
    skaters_stats <- data.table(
      player_id = integer(),
      season_type = character()
    )
  } else {
    skaters_stats <- data.table(
      player_id = rep(players_id, each = 2L),
      season_type = c(ifelse(regular, "regular", NA_character_),
                      ifelse(playoffs, "playoffs", NA_character_))
    )[!is.na(season_type)]
  }

  skaters_stats[, url := paste0(
    "people/", player_id,
    "/stats?stats=", ifelse(season_type == "regular", "yearByYear", "yearByYearPlayoffs")
  )]

  skaters_stats[, api_return := get_stats_api(url)]

  skaters_stats <- skaters_stats[, rbindlist(mapply(
    FUN = function(player_id, season_type, api_return) {

      splits <- create_data_table(api_return$stats$splits[[1]])
      splits[, `:=`(
        player_id = player_id,
        season_type = season_type
      )]

      splits[]

    },
    player_id = player_id,
    season_type = season_type,
    api_return = api_return,
    SIMPLIFY = FALSE
  ), fill = TRUE)]

  validate_columns(skaters_stats, list(
    player_id = NA_integer_,
    season_type = NA_character_,
    league.id = NA_integer_,
    season = NA_character_,
    sequenceNumber = NA_integer_,
    team.id = NA_integer_,
    stat.games = NA_integer_,
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

  skaters_stats <- skaters_stats[league.id == 133L, .(
    player_id = player_id,
    season_id = season,
    season_years = season_years(season),
    sequence = sequenceNumber,
    season_type = season_type,
    team_id = team.id,
    skater_games = stat.games,
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

  teams_meta <- get("teams_meta", envir = data)
  skaters_stats[teams_meta, team_abbreviation := team_abbreviation, on = .(team_id)]

  players_meta <- get("players_meta", envir = data)
  skaters_stats[players_meta, player_name := player_name, on = .(player_id)]

  setcolorder(skaters_stats, c("player_id", "player_name", "season_id", "season_years",
                               "season_type", "team_id", "team_abbreviation"))
  setorder(skaters_stats, player_id, season_id, -season_type, sequence)
  skaters_stats[, sequence := NULL]

  if (!keep_id) {
    drop_ids(skaters_stats)
  }

  add_copyright(skaters_stats)

  if (return_datatable) {
    skaters_stats[]
  } else {
    as.data.frame(skaters_stats)
  }

}
