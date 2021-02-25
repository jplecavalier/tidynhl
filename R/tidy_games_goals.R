#' Get a tidy dataset of NHL games goals
#'
#' The function `tidy_games_goals()` is meant to be a user-friendly way of getting data about goals
#' in selected NHL games.
#'
#' @param games_id Integer vector indicating the NHL ID of selected games for which the goal data
#'   will be returned. The required format is 'xxxxyyzzzz' where
#'   - 'xxxx' is the first 4 digits of a valid NHL season ID,
#'   - 'yy' is one of "02" (regular) or "03" (playoffs),
#'   - 'zzzz' is a 4-digit number attributed to a single game.
#' @param include_shootout *(optional)* Logical indicating if shootout goals should be returned in
#'   the data. Default to `FALSE`.
#' @param time_elapsed *(optional)* Logical indicating if the time sould be indicated as elapsed
#'   (`TRUE`) or remaining (`FALSE`). Default to `TRUE`.
#' @param standardized_coordinates *(optional)* Logical indicating if the ice coordinates should be
#'   standardized (away team zone negative on the x-axis) or kept as is. Default to `TRUE`.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. However, note that `game_id` will always be returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get goal data of the 2021-01-13 MTL @ TOR game
#' tidy_games_goals(2020020003L)
#'
#' # Get goal data of both the 2021-01-13 MTL @ TOR and 2021-01-14 BOS @ NJD games with time
#' # remaining instead of time elapsed, as is coordinates instead of normalized, including shootout
#' # goals, and keeping the IDs
#' tidy_games_goals(
#'   games_id = c(2020020003L, 2020020007L),
#'   include_shootout = TRUE,
#'   time_elapsed = FALSE,
#'   standardized_coordinates = FALSE,
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_games_goals <- function(
  games_id,
  include_shootout = FALSE,
  time_elapsed = TRUE,
  standardized_coordinates = TRUE,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  games_id <- assert_games_id(games_id)

  assert_include_shootout(include_shootout)
  assert_time_elapsed(time_elapsed)
  assert_standardized_coordinates(standardized_coordinates)
  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

  games <- data.table(game_id = games_id)
  games[, url := paste0("game/", game_id, "/feed/live")]
  games[, api_return := get_stats_api(url)]

  goals <- games[, rbindlist(lapply(api_return, function(api_return) {

    plays <- create_data_table(api_return$liveData$plays$allPlays)
    plays[, game_id := api_return$gameData$game$pk]
    plays[, away_id := api_return$gameData$teams$away$id]
    plays[, home_id := api_return$gameData$teams$home$id]

    periods <- create_data_table(api_return$liveData$linescore$periods)
    asis_periods <- periods[away.rinkSide == "left" & home.rinkSide == "right", num]
    mirror_periods <- periods[away.rinkSide == "right" & home.rinkSide == "left", num]

    plays[, mirror := NA]
    plays[about.period %in% asis_periods, mirror := FALSE]
    plays[about.period %in% mirror_periods, mirror := TRUE]

    plays[result.eventTypeId %in% c("GOAL")]

  }), fill = TRUE)]

  validate_columns(goals, list(
    players = list(),
    game_id = NA_integer_,
    away_id = NA_integer_,
    home_id = NA_integer_,
    mirror = NA,
    team.id = NA_integer_,
    about.eventIdx = NA_integer_,
    about.period = NA_integer_,
    about.ordinalNum = NA_character_,
    about.periodType = NA_character_,
    about.periodTime = NA_character_,
    about.periodTimeRemaining = NA_character_,
    coordinates.x = NA_real_,
    coordinates.y = NA_real_,
    result.secondaryType = NA_character_,
    result.gameWinningGoal = NA,
    result.emptyNet = NA,
    result.strength.code = NA_character_
  ))

  players_bind <- goals[, rbindlist(players, fill = TRUE)]
  validate_columns(players_bind, list(
    playerType = NA_character_,
    player.id = NA_integer_
  ))
  players_bind[, game_id := goals[, rep(game_id, sapply(players, nrow))]]
  players_bind[, about.eventIdx := goals[, rep(about.eventIdx, sapply(players, nrow))]]
  goals_summary <- players_bind[, .(
    for_goal_id = .SD[playerType == "Scorer", player.id],
    for_assist_1_id = .SD[playerType == "Assist", player.id[1L]],
    for_assist_2_id = .SD[playerType == "Assist", player.id[2L]],
    against_goalie_id = .SD[playerType == "Goalie", player.id]
  ), .(game_id, about.eventIdx)]

  cols <- c("for_goal_id", "for_assist_1_id", "for_assist_2_id", "against_goalie_id")
  goals[goals_summary, (cols) := mget(cols), on = .(game_id, about.eventIdx)]
  goals[, for_team_id := team.id]
  goals[team.id == home_id, against_team_id := away_id]
  goals[team.id == away_id, against_team_id := home_id]

  if (!exists("players_meta", envir = data)) {
    load_players_meta()
  }
  players_meta <- get("players_meta", envir = data)
  goals[players_meta, for_goal_name := player_name, on = c(for_goal_id = "player_id")]
  goals[players_meta, for_assist_1_name := player_name, on = c(for_assist_1_id = "player_id")]
  goals[players_meta, for_assist_2_name := player_name, on = c(for_assist_2_id = "player_id")]
  goals[players_meta, against_goalie_name := player_name, on = c(against_goalie_id = "player_id")]

  if (!exists("teams_meta", envir = data)) {
    load_teams_meta()
  }
  teams_meta <- get("teams_meta", envir = data)
  goals[teams_meta, for_team_abbreviation := team_abbreviation,
           on = c(for_team_id = "team_id")]
  goals[teams_meta, against_team_abbreviation := team_abbreviation,
        on = c(against_team_id = "team_id")]

  if (include_shootout) {

    goals[about.periodType == "SHOOTOUT", `:=`(
      result.gameWinningGoal = FALSE,
      result.emptyNet = FALSE,
      result.strength.code = "SO",
      about.periodTime = "00:00",
      about.periodTimeRemaining = "00:00"
    )]

    goals[about.periodType == "SHOOTOUT" & for_team_id == away_id, mirror := coordinates.x < 0]
    goals[about.periodType == "SHOOTOUT" & for_team_id == home_id, mirror := coordinates.x > 0]

  } else {

    goals <- goals[about.periodType != "SHOOTOUT"]

  }

  goals <- goals[, .(
    game_id = game_id,
    event_id = about.eventIdx,
    period_id = about.period,
    period_label = about.ordinalNum,
    period_type = tolower(about.periodType),
    period_time_elapsed = about.periodTime,
    period_time_remaining = about.periodTimeRemaining,
    shot_x = coordinates.x,
    shot_y = coordinates.y,
    shot_type = result.secondaryType,
    goal_gwg = result.gameWinningGoal,
    goal_en = result.emptyNet,
    goal_strength = tolower(result.strength.code),
    for_team_id = for_team_id,
    for_team_abbreviation = for_team_abbreviation,
    for_goal_id = for_goal_id,
    for_goal_name = for_goal_name,
    for_assist_1_id = for_assist_1_id,
    for_assist_1_name = for_assist_1_name,
    for_assist_2_id = for_assist_2_id,
    for_assist_2_name = for_assist_2_name,
    against_goalie_id = against_goalie_id,
    against_goalie_name = against_goalie_name,
    against_team_abbreviation = against_team_abbreviation,
    against_team_id = against_team_id,
    mirror = mirror
  )]

  if (standardized_coordinates) {

    # TODO: Create a patch for outdoor games, standardized coordinates are not straightforward
    #       For more informations: https://en.wikipedia.org/wiki/NHL_Winter_Classic

    games_sides_na <- goals[is.na(mirror), unique(game_id)]
    if (length(games_sides_na) > 0L) {
      warning(paste(
        "the coordinates of the following games were not standardized since the rink side",
        "information was unavailable:",
        paste(sort(games_sides_na), collapse = ", ")
      ))
    }

    goals[mirror == TRUE, `:=`(
      shot_x = -shot_x,
      shot_y = -shot_y
    )]

  }

  setorder(goals, game_id, event_id)

  if (time_elapsed) {
    goals[, period_time_remaining := NULL]
  } else {
    goals[, period_time_elapsed := NULL]
  }

  goals[, mirror := NULL]

  if (!keep_id) {
    drop_ids(goals, "game_id")
  }

  add_copyright(goals)

  if (return_datatable) {
    goals[]
  } else {
    as.data.frame(goals)
  }

}
