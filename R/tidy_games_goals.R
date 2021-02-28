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

  to_load <- !sapply(paste0("game-events-", games_id), exists, envir = data, USE.NAMES = FALSE)
  load_games_events(games_id[which(to_load)])

  goals <- rbindlist(mget(paste0("game-goals-", games_id), envir = data))
  facs <- colnames(goals)[which(sapply(goals, is.factor))]
  goals[, (facs) := lapply(mget(facs), as.character)]

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

  if (!include_shootout) {
    goals <- goals[period_type != "shootout"]
  }

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
  setcolorder(goals, c(
    "game_id", "event_id", "period_id", "period_label", "period_type", "period_time_elapsed",
    "period_time_remaining", "shot_x", "shot_y", "shot_type", "goal_gwg", "goal_en",
    "goal_strength", "for_team_id", "for_team_abbreviation", "for_goal_id", "for_goal_name",
    "for_assist_1_id", "for_assist_1_name", "for_assist_2_id", "for_assist_2_name",
    "against_goalie_id", "against_goalie_name", "against_team_abbreviation", "against_team_id"
  ))

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
