#' Get a tidy dataset of NHL games events
#'
#' The function `tidy_games_events()` is meant to be a user-friendly way of connecting events of
#' different types in selected NHL games.
#'
#' @param games_id Integer vector indicating the NHL ID of selected games for which the events will
#'   be returned. The required format is 'xxxxyyzzzz' where
#'   - 'xxxx' is the first 4 digits of a valid NHL season ID,
#'   - 'yy' is one of "02" (regular) or "03" (playoffs),
#'   - 'zzzz' is a 4-digit number attributed to a single game.
#' @param include_shootout *(optional)* Logical indicating if shootout events should be returned in
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
#' # Get events of the 2021-01-13 MTL @ TOR game
#' tidy_games_events(2020020003L)
#'
#' # Get events of both the 2021-01-13 MTL @ TOR and 2021-01-14 BOS @ NJD games with time remaining
#' # instead of time elapsed, as is coordinates instead of normalized, including shootout events,
#' # and keeping the IDs
#' tidy_games_events(
#'   games_id = c(2020020003L, 2020020007L),
#'   include_shootout = TRUE,
#'   time_elapsed = FALSE,
#'   standardized_coordinates = FALSE,
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_games_events <- function(
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

  events <- games[, rbindlist(lapply(api_return, function(api_return) {

    plays <- create_data_table(api_return$liveData$plays$allPlays)
    plays[, game_id := api_return$gameData$game$pk]

    plays[result.eventTypeId %in% c("BLOCKED_SHOT", "FACEOFF", "GIVEAWAY", "GOAL", "HIT",
                                    "MISSED_SHOT", "PENALTY", "SHOT", "TAKEAWAY")]

  }), fill = TRUE)]

  validate_columns(events, list(
    game_id = NA_integer_,
    about.eventIdx = NA_integer_,
    result.eventTypeId = NA_character_,
    about.period = NA_integer_,
    about.ordinalNum = NA_character_,
    about.periodType = NA_character_,
    about.periodTime = NA_character_,
    about.periodTimeRemaining = NA_character_
  ))

  if (!include_shootout) {
    events <- events[about.periodType != "SHOOTOUT"]
  }

  events <- events[, .(
    game_id = game_id,
    event_id = about.eventIdx,
    event_type = tolower(result.eventTypeId),
    period_id = about.period,
    period_label = about.ordinalNum,
    period_type = tolower(about.periodType),
    period_time_elapsed = about.periodTime,
    period_time_remaining = about.periodTimeRemaining
  )]

  setorder(events, game_id, event_id)

  if (time_elapsed) {
    events[, period_time_remaining := NULL]
  } else {
    events[, period_time_elapsed := NULL]
  }

  if (!keep_id) {
    drop_ids(events, "game_id")
  }

  add_copyright(events)

  if (return_datatable) {
    events[]
  } else {
    as.data.frame(events)
  }

}
