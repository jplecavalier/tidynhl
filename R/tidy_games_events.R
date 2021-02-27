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
    plays[, away_id := api_return$gameData$teams$away$id]
    plays[, home_id := api_return$gameData$teams$home$id]
    validate_columns(plays, list(
      game_id = NA_integer_,
      away_id = NA_integer_,
      home_id = NA_integer_,
      about.eventIdx = NA_integer_,
      result.eventTypeId = NA_character_,
      players = list(),
      about.period = NA_integer_,
      about.ordinalNum = NA_character_,
      about.periodType = NA_character_,
      about.periodTime = NA_character_,
      about.periodTimeRemaining = NA_character_,
      team.id = NA_integer_,
      coordinates.x = NA_real_,
      coordinates.y = NA_real_,
      result.secondaryType = NA_character_,
      result.gameWinningGoal = NA,
      result.emptyNet = NA,
      result.strength.code = NA_character_
    ))

    periods <- create_data_table(api_return$liveData$linescore$periods)
    validate_columns(periods, list(
      away.rinkSide = NA_character_,
      home.rinkSide = NA_character_
    ))
    asis_periods <- periods[away.rinkSide == "left" & home.rinkSide == "right", num]
    mirror_periods <- periods[away.rinkSide == "right" & home.rinkSide == "left", num]

    plays[, mirror := NA]
    plays[about.period %in% asis_periods, mirror := FALSE]
    plays[about.period %in% mirror_periods, mirror := TRUE]

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

    goals <- plays[result.eventTypeId == "GOAL", .(
      game_id = game_id,
      event_id = about.eventIdx,
      team_id = team.id,
      away_id = away_id,
      home_id = home_id,
      players = players,
      period_id = about.period,
      period_label = about.ordinalNum,
      period_type = factor_period_types(tolower(about.periodType)),
      period_time_elapsed = about.periodTime,
      period_time_remaining = about.periodTimeRemaining,
      shot_x = coordinates.x,
      shot_y = coordinates.y,
      shot_type = factor_shot_types(result.secondaryType),
      goal_gwg = result.gameWinningGoal,
      goal_en = result.emptyNet,
      goal_strength = factor_goal_strengths(tolower(result.strength.code)),
      mirror = mirror
    )]

    players_bind <- goals[, rbindlist(players, fill = TRUE)]
    validate_columns(players_bind, list(
      playerType = NA_character_,
      player.id = NA_integer_
    ))
    players_bind[, event_id := goals[, rep(event_id, sapply(players, nrow))]]
    goals_summary <- players_bind[, .(
      for_goal_id = .SD[playerType == "Scorer", player.id],
      for_assist_1_id = .SD[playerType == "Assist", player.id[1L]],
      for_assist_2_id = .SD[playerType == "Assist", player.id[2L]],
      against_goalie_id = .SD[playerType == "Goalie", player.id]
    ), .(event_id)]

    cols <- c("for_goal_id", "for_assist_1_id", "for_assist_2_id", "against_goalie_id")
    goals[goals_summary, (cols) := mget(cols), on = .(event_id)]
    goals[, for_team_id := team_id]
    goals[team_id == home_id, against_team_id := away_id]
    goals[team_id == away_id, against_team_id := home_id]

    goals[period_type == "shootout", `:=`(
      goal_gwg = FALSE,
      goal_en = FALSE,
      goal_strength = factor_goal_strengths("so"),
      period_time_elapsed = "00:00",
      period_time_remaining = "00:00"
    )]

    goals[period_type == "shootout" & for_team_id == away_id, mirror := shot_x < 0]
    goals[period_type == "shootout" & for_team_id == home_id, mirror := shot_x > 0]

    goals[, `:=`(
      team_id = NULL,
      home_id = NULL,
      away_id = NULL,
      players = NULL
    )]

    assign(paste0("game-events-", game_id), events, data)
    assign(paste0("game-goals-", game_id), goals, data)

    NULL

  }, game_id = game_id, api_return = api_return, SIMPLIFY = FALSE), fill = TRUE)]

}
