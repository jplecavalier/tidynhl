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
#' @param time_elapsed *(optional)* Logical indicating if the time sould be indicated as elapsed
#'   (`TRUE`) or remaining (`FALSE`). Default to `TRUE`.
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
#' # instead of time elapsed, and keeping the IDs
#' tidy_games_events(
#'   games_id = c(2020020003L, 2020020007L),
#'   time_elapsed = FALSE,
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_games_events <- function(
  games_id,
  time_elapsed = TRUE,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  games_id <- assert_games_id(games_id)

  assert_time_elapsed(time_elapsed)
  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

  to_load <- !sapply(paste0("game-events-", games_id), exists, envir = data, USE.NAMES = FALSE)
  load_games_events(games_id[which(to_load)])

  events <- rbindlist(mget(paste0("game-events-", games_id), envir = data))

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

load_games_events <- function(games_id) {

  games <- data.table(game_id = games_id)
  games[, url := paste0("game/", game_id, "/feed/live")]
  games[, api_return := get_stats_api(url)]

  games[, rbindlist(mapply(function(game_id, api_return) {

    plays <- create_data_table(api_return$liveData$plays$allPlays)
    plays[, game_id := game_id]

    validate_columns(plays, list(
      game_id = NA_integer_,
      about.eventIdx = NA_integer_,
      result.eventTypeId = NA_character_,
      about.period = NA_integer_,
      about.ordinalNum = NA_character_,
      about.periodType = NA_character_,
      about.periodTime = NA_character_,
      about.periodTimeRemaining = NA_character_
    ))

    events <- plays[
      result.eventTypeId %in% c("BLOCKED_SHOT", "FACEOFF", "GIVEAWAY", "GOAL", "HIT", "MISSED_SHOT",
                                "PENALTY", "SHOT", "TAKEAWAY"),
      .(
        game_id = game_id,
        event_id = about.eventIdx,
        event_type = factor_event_types(tolower(result.eventTypeId)),
        period_id = about.period,
        period_label = about.ordinalNum,
        period_type = factor_period_types(tolower(about.periodType)),
        period_time_elapsed = about.periodTime,
        period_time_remaining = about.periodTimeRemaining
      )
    ]

    assign(paste0("game-events-", game_id), events, data)

    NULL

  }, game_id = game_id, api_return = api_return, SIMPLIFY = FALSE), fill = TRUE)]

}
