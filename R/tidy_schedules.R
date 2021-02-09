#' Get a tidy dataset of NHL schedules
#'
#' The function `tidy_schedules()` is meant to be a user-friendly way of getting NHL schedules,
#' including the final score of completed games.
#'
#' @param seasons_id Character vector of the seasons ID for which the schedule will be returned. The
#'   required format is 'xxxxyyyy'.
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
#' # Get the regular season schedule of both the 2018-2019 and 2019-2020 seasons, keeping the IDs
#' # and indicating game datetime with Los Angeles local time
#' tidy_schedules(
#'   seasons_id = c("20182019", "20192020"),
#'   playoffs = FALSE,
#'   tz = "America/Los_Angeles",
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_schedules <- function(
  seasons_id,
  regular = TRUE,
  playoffs = TRUE,
  tz = Sys.timezone(),
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  seasons_meta <- tidy_seasons_meta(keep_id = TRUE, return_datatable = TRUE)

  seasons_id <- unique(seasons_id)
  missing_seasons <- setdiff(seasons_id, seasons_meta[, season_id])
  if (length(missing_seasons) > 0L) {
    stop(paste(
      "every elements of the argument 'seasons_id' should be a valid NHL season ID,",
      "the following are not:",
      paste(missing_seasons, collapse = ", ")
    ))
  }

  if (!is.logical(regular) | is.na(regular) | length(regular) != 1L) {
    stop("argument 'regular' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(playoffs) | is.na(playoffs) | length(playoffs) != 1L) {
    stop("argument 'playoffs' should be one of 'TRUE' or 'FALSE'")
  }

  if (!regular & !playoffs) {
    stop("at least one of arguments 'regular' or 'playoffs' should be 'TRUE'")
  }

  if (!is.character(tz) | is.na(tz) | length(tz) != 1L) {
    stop("argument 'tz' should be a character of length 1")
  } else {
    if (!(tz %in% OlsonNames())) {
      warning("argument 'tz' is not recognized as a valid time zone, using 'UTC' instead")
      tz <- "UTC"
    }
  }

  if (!is.logical(keep_id) | is.na(keep_id) | length(keep_id) != 1L) {
    stop("argument 'keep_id' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(return_datatable) | is.na(return_datatable) | length(return_datatable) != 1L) {
    stop("argument 'return_datatable' should be one of 'TRUE' or 'FALSE'")
  }

  schedules <- data.table(
    season_id = seasons_id
  )

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
  schedules[which(sapply(api_return, function(api_return) {
    !is.null(api_return$messageNumber)
  })), api_return := get_stats_api(url_dates)]

  schedules <- schedules[, rbindlist(lapply(api_return, function(api_return) {

    season_games <- create_data_table(rbindlist(api_return$dates$games, fill = TRUE))

    if (regular & playoffs) {
      season_games[gameType %in% c("R", "P")]
    } else if (regular & !playoffs) {
      season_games[gameType == "R"]
    } else {
      season_games[gameType == "P"]
    }

  }), fill = TRUE)]

  validate_columns(schedules, list(
    season = NA_character_,
    gamePk = NA_integer_,
    gameType = NA_character_,
    gameDate = NA_character_,
    status.detailedState = NA_character_,
    venue.name = NA_character_,
    teams.away.team.id = NA_integer_,
    teams.home.team.id = NA_integer_,
    linescore.teams.away.goals = NA_integer_,
    linescore.teams.home.goals = NA_integer_,
    linescore.currentPeriod = NA_integer_,
    linescore.hasShootout = NA
  ))

  schedules <- schedules[, .(
    season_id = season,
    season_years = season_years(season),
    season_type = ifelse(substr(gamePk, 5L, 6L) == "02", "regular", "playoffs"),
    game_id = gamePk,
    game_datetime = suppressMessages(lubridate::as_datetime(gameDate, tz = tz)),
    game_status = tolower(status.detailedState),
    venue_name = venue.name,
    away_id = teams.away.team.id,
    home_id = teams.home.team.id,
    away_score = linescore.teams.away.goals,
    home_score = linescore.teams.home.goals,
    game_nbot = linescore.currentPeriod - linescore.hasShootout - 3L,
    game_shootout = linescore.hasShootout
  )]

  teams_meta <- tidy_teams_meta(active_only = FALSE, keep_id = TRUE, return_datatable = TRUE)
  schedules[teams_meta, away_abbreviation := team_abbreviation, on = c(away_id = "team_id")]
  schedules[teams_meta, home_abbreviation := team_abbreviation, on = c(home_id = "team_id")]

  schedules[game_status != "final", `:=`(
    away_score = NA_integer_,
    home_score = NA_integer_,
    game_nbot = NA_integer_,
    game_shootout = NA
  )]

  setcolorder(schedules, c("season_id", "season_years", "season_type", "game_id", "game_datetime",
                           "game_status", "venue_name", "away_id", "away_abbreviation",
                           "away_score", "home_score", "home_abbreviation", "home_id", "game_nbot",
                           "game_shootout"))

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
