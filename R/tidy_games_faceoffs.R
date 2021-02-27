#' Get a tidy dataset of NHL games faceoffs
#'
#' The function `tidy_games_faceoffs()` is meant to be a user-friendly way of getting data about
#' faceoffs in selected NHL games.
#'
#' @param games_id Integer vector indicating the NHL ID of selected games for which the faceoff data
#'   will be returned. The required format is 'xxxxyyzzzz' where
#'   - 'xxxx' is the first 4 digits of a valid NHL season ID,
#'   - 'yy' is one of "02" (regular) or "03" (playoffs),
#'   - 'zzzz' is a 4-digit number attributed to a single game.
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
#' # Get faceoffs data of the 2021-01-13 MTL @ TOR game
#' tidy_games_faceoffs(2020020003L)
#'
#' # Get faceoffs data of both the 2021-01-13 MTL @ TOR and 2021-01-14 BOS @ NJD games with time
#' # remaining instead of time elapsed, as is coordinates instead of normalized, and keeping the IDs
#' tidy_games_faceoffs(
#'   games_id = c(2020020003L, 2020020007L),
#'   time_elapsed = FALSE,
#'   standardized_coordinates = FALSE,
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_games_faceoffs <- function(
  games_id,
  time_elapsed = TRUE,
  standardized_coordinates = TRUE,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  games_id <- assert_games_id(games_id, min_season = "20102011")

  assert_time_elapsed(time_elapsed)
  assert_standardized_coordinates(standardized_coordinates)
  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

  to_load <- !sapply(paste0("game-events-", games_id), exists, envir = data, USE.NAMES = FALSE)
  load_games_events(games_id[which(to_load)])

  faceoffs <- rbindlist(mget(paste0("game-faceoffs-", games_id), envir = data))

  if (!exists("players_meta", envir = data)) {
    load_players_meta()
  }
  players_meta <- get("players_meta", envir = data)
  faceoffs[players_meta, winner_player_name := player_name, on = c(winner_player_id = "player_id")]
  faceoffs[players_meta, loser_player_name := player_name, on = c(loser_player_id = "player_id")]

  if (!exists("teams_meta", envir = data)) {
    load_teams_meta()
  }
  teams_meta <- get("teams_meta", envir = data)
  faceoffs[teams_meta, winner_team_abbreviation := team_abbreviation,
           on = c(winner_team_id = "team_id")]
  faceoffs[teams_meta, loser_team_abbreviation := team_abbreviation,
           on = c(loser_team_id = "team_id")]

  if (standardized_coordinates) {

    # TODO: Create a patch for outdoor games, standardized coordinates are not straightforward
    #       For more informations: https://en.wikipedia.org/wiki/NHL_Winter_Classic

    games_sides_na <- faceoffs[is.na(mirror), unique(game_id)]
    if (length(games_sides_na) > 0L) {
      warning(paste(
        "the coordinates of the following games were not standardized since the rink side",
        "information was unavailable:",
        paste(sort(games_sides_na), collapse = ", ")
      ))
    }

    faceoffs[mirror == TRUE, `:=`(
      faceoff_x = -faceoff_x,
      faceoff_y = -faceoff_y
    )]

  }

  setorder(faceoffs, game_id, event_id)
  setcolorder(faceoffs, c(
    "game_id", "event_id", "period_id", "period_label", "period_type", "period_time_elapsed",
    "period_time_remaining", "faceoff_x", "faceoff_y", "winner_team_id", "winner_team_abbreviation",
    "winner_player_id", "winner_player_name", "loser_player_name", "loser_player_id",
    "loser_team_abbreviation", "loser_team_id"
  ))

  if (time_elapsed) {
    faceoffs[, period_time_remaining := NULL]
  } else {
    faceoffs[, period_time_elapsed := NULL]
  }

  faceoffs[, mirror := NULL]

  if (!keep_id) {
    drop_ids(faceoffs, "game_id")
  }

  add_copyright(faceoffs)

  if (return_datatable) {
    faceoffs[]
  } else {
    as.data.frame(faceoffs)
  }

}
