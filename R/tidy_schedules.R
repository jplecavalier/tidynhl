#' Get a tidy dataset of NHL schedules
#'
#' The function `tidy_schedules()` is meant to be a user-friendly way of getting NHL schedules,
#' including the final score and shot counts of completed games.
#'
#' @param seasons_id Character vector of the seasons ID for which the schedule will be returned. The
#'   required format is 'xxxxyyyy'.
#' @param expand_periods *(optional)* Logical indicating if data should be expanded at the period
#'   level. Default to `FALSE`.
#' @param regular *(optional)* Logical indicating if the regular season schedules should be
#'   returned. Default to `TRUE`.
#' @param playoffs *(optional)* Logical indicating if the playoffs schedules should be returned.
#'   Default to `TRUE`.
#' @param tz *(optional)* Character specifying the timezone that should be used for datetime.
#'   Default to the user system time zone.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get the schedule of the 2019-2020 regular season and playoffs
#' tidy_schedules("20192020")
#'
#' # Get the regular season periods of both the 2018-2019 and 2019-2020 seasons, keeping the IDs
#' # and indicating game datetime with Los Angeles local time
#' tidy_schedules(
#'   seasons_id = c("20182019", "20192020"),
#'   expand_periods = TRUE,
#'   playoffs = FALSE,
#'   tz = "America/Los_Angeles",
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_schedules <- function(
  seasons_id,
  expand_periods = FALSE,
  regular = TRUE,
  playoffs = TRUE,
  tz = Sys.timezone(),
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  seasons_id <- assert_seasons_id(seasons_id)

  assert_expand_periods(expand_periods)
  assert_regular_playoffs(regular, playoffs)
  assert_tz(tz)
  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

  schedules <- data.table(
    season_id = seasons_id
  )

  seasons_meta <- get("seasons_meta", envir = data)
  schedules[seasons_meta, `:=` (
    start_date = season_regular_start,
    end_date = season_playoffs_end
  ), on = .(season_id)]

  schedules[, `:=`(
    url_season = paste0("schedule?season=", season_id, "&expand=schedule.linescore"),
    url_dates = paste0(
      "schedule?startDate=", start_date,
      "&endDate=", end_date,
      "&expand=schedule.linescore"
    )
  )]

  schedules[, api_return := get_stats_api(url_season)]
  if (schedules[, .N] > 0L) {
    schedules[which(sapply(api_return, function(api_return) {
      !is.null(api_return$messageNumber)
    })), api_return := get_stats_api(url_dates)]
  }

  schedules <- schedules[, rbindlist(lapply(api_return, function(api_return) {

    season_games <- create_data_table(rbindlist(api_return$dates$games, fill = TRUE))

    season_games[substr(gamePk, 5L, 6L) == "02", season_type := "regular"]
    season_games[substr(gamePk, 5L, 6L) == "03", season_type := "playoffs"]

    if (regular & playoffs) {
      season_games[!is.na(season_type)]
    } else if (regular & !playoffs) {
      season_games[season_type == "regular"]
    } else {
      season_games[season_type == "playoffs"]
    }

  }), fill = TRUE)]

  validate_columns(schedules, list(
    season = NA_character_,
    gamePk = NA_integer_,
    season_type = NA_character_,
    gameType = NA_character_,
    gameDate = NA_character_,
    status.detailedState = NA_character_,
    venue.name = NA_character_,
    teams.away.team.id = NA_integer_,
    teams.home.team.id = NA_integer_,
    linescore.teams.away.goals = NA_integer_,
    linescore.teams.home.goals = NA_integer_,
    linescore.teams.away.shotsOnGoal = NA_integer_,
    linescore.teams.home.shotsOnGoal = NA_integer_,
    linescore.currentPeriod = NA_integer_,
    linescore.hasShootout = NA,
    linescore.periods = list(),
    linescore.shootoutInfo.home.scores = NA_integer_,
    linescore.shootoutInfo.away.scores = NA_integer_,
    linescore.shootoutInfo.home.attempts = NA_integer_,
    linescore.shootoutInfo.away.attempts = NA_integer_
  ))

  games <- schedules[, .(
    season_id = season,
    season_years = season_years(season),
    season_type = season_type,
    game_id = gamePk,
    game_datetime = suppressMessages(lubridate::as_datetime(gameDate, tz = tz)),
    game_status = tolower(status.detailedState),
    venue_name = venue.name,
    away_id = teams.away.team.id,
    home_id = teams.home.team.id,
    away_score = linescore.teams.away.goals,
    home_score = linescore.teams.home.goals,
    away_shots = linescore.teams.away.shotsOnGoal,
    home_shots = linescore.teams.home.shotsOnGoal,
    game_nbot = linescore.currentPeriod - linescore.hasShootout - 3L,
    game_shootout = linescore.hasShootout
  )]

  teams_meta <- tidy_teams_meta(active_only = FALSE, keep_id = TRUE, return_datatable = TRUE)
  games[teams_meta, away_abbreviation := team_abbreviation, on = c(away_id = "team_id")]
  games[teams_meta, home_abbreviation := team_abbreviation, on = c(home_id = "team_id")]

  if (expand_periods) {

    schedules_complete <- schedules[tolower(status.detailedState) == "final"]

    periods <- schedules_complete[, rbindlist(linescore.periods, fill = TRUE)]
    periods[, game_id := schedules_complete[, rep(gamePk, sapply(linescore.periods, nrow))]]

    validate_columns(periods, list(
      game_id = NA_integer_,
      num = NA_integer_,
      ordinalNum = NA_character_,
      periodType = NA_character_,
      away.goals = NA_integer_,
      home.goals = NA_integer_,
      away.shotsOnGoal = NA_integer_,
      home.shotsOnGoal = NA_integer_
    ))

    periods <- periods[, .(
      game_id = game_id,
      period_number = num,
      period_label = ordinalNum,
      period_ot = periodType == "OVERTIME",
      period_so = rep(FALSE, .N),
      away_score = away.goals,
      home_score = home.goals,
      away_shots = away.shotsOnGoal,
      home_shots = home.shotsOnGoal
    )]

    shootouts <- schedules[linescore.hasShootout == TRUE][, .(
      game_id = gamePk,
      period_number = linescore.currentPeriod,
      period_label = rep("SO", .N),
      period_ot = rep(FALSE, .N),
      period_so = rep(TRUE, .N),
      away_score = linescore.shootoutInfo.away.scores,
      home_score = linescore.shootoutInfo.home.scores,
      away_shots = linescore.shootoutInfo.away.attempts,
      home_shots = linescore.shootoutInfo.home.attempts
    )]

    games_incomplete <- schedules[tolower(status.detailedState) != "final"][, .(
      game_id = gamePk,
      period_number = rep(NA_integer_, .N),
      period_label = rep(NA_character_, .N),
      period_ot = rep(NA, .N),
      period_so = rep(NA, .N),
      away_score = rep(NA_integer_, .N),
      home_score = rep(NA_integer_, .N),
      away_shots = rep(NA_integer_, .N),
      home_shots = rep(NA_integer_, .N)
    )]

    periods <- rbindlist(list(periods, shootouts, games_incomplete))

    cols <- setdiff(setdiff(colnames(games), c("game_nbot", "game_shootout")), colnames(periods))
    periods[games, (cols) := mget(cols), on = .(game_id)]

    setcolorder(periods, c("season_id", "season_years", "season_type", "game_id", "game_datetime",
                           "game_status", "venue_name", "period_number", "period_label",
                           "period_ot", "period_so", "away_id", "away_abbreviation", "away_shots",
                           "away_score", "home_score", "home_shots", "home_abbreviation",
                           "home_id"))
    setorder(periods, game_datetime, game_id, period_number)

    schedules <- periods

  } else {

    setcolorder(games, c("season_id", "season_years", "season_type", "game_id", "game_datetime",
                         "game_status", "venue_name", "away_id", "away_abbreviation", "away_shots",
                         "away_score", "home_score", "home_shots", "home_abbreviation", "home_id",
                         "game_nbot", "game_shootout"))
    setorder(games, game_datetime, game_id)

    games[game_status != "final", `:=`(
      away_score = NA_integer_,
      home_score = NA_integer_,
      away_shots = NA_integer_,
      home_shots = NA_integer_,
      game_nbot = NA_integer_,
      game_shootout = NA
    )]

    schedules <- games

  }

  if (!keep_id) {
    drop_ids(schedules)
  }

  add_copyright(schedules)

  if (return_datatable) {
    schedules[]
  } else {
    as.data.frame(schedules)
  }

}
