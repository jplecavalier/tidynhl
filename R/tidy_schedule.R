#' Get a tidy dataset of the NHL schedule
#'
#' The function `tidy_schedule()` is meant to be a user-friendly way of getting the NHL schedule,
#' including the final score of completed games.
#'
#' @param seasons_id Character vector of the seasons ID for which the schedule will be returned. The
#'   required format is 'xxxxyyyy'.
#' @param regular *(optional)* Logical indicating if the regular season schedule should be returned.
#'   Default to `TRUE`.
#' @param playoffs *(optional)* Logical indicating if the playoffs schedule should be returned.
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
#' # Get the schedule of the 2019-2020 regular season and playoffs
#' tidy_schedule("20192020")
#'
#' # Get the regular season schedule of both the 2018-2019 and 2019-2020 seasons, keeping the IDs
#' # and indicating game datetime with Los Angeles local time
#' tidy_schedule(
#'   seasons_id = c("20182019", "20192020"),
#'   playoffs = FALSE,
#'   tz = "America/Los_Angeles",
#'   keep_id = TRUE
#' )
#'
#' @export
tidy_schedule <- function(
  seasons_id,
  regular = TRUE,
  playoffs = TRUE,
  tz = Sys.timezone(),
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  # TODO: Replace this when tidy_seasons_meta() will be developed

  check_seasons_id <- seasons_id%in%seasons_info[, season_id]
  if (sum(!check_seasons_id)>0) {
    stop(paste("the following values are invalid for parameter 'seasons_id':", paste(seasons_id[!check_seasons_id], collapse = ", ")))
  }

  # TODO: Add more complete parameters check

  api_returns <- get_stats_api(paste0("schedule?season=", seasons_id, "&expand=schedule.linescore"))

  seasons_games <- rbindlist(lapply(api_returns, function(api_return) {

    season_games <- create_data_table(rbindlist(api_return$dates$games, fill = TRUE))

    if (regular & playoffs) {
      season_games[gameType %in% c("R", "P")]
    } else if (regular & !playoffs) {
      season_games[gameType == "R"]
    } else {
      season_games[gameType == "P"]
    }

  }), fill = TRUE)

  validate_columns(seasons_games, list(
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

  seasons_games <- seasons_games[, .(
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

  # TODO: Make a patch for the missing games, making sure not to duplicate them when the API will be
  #       fixed

  teams_meta <- tidy_teams_meta(active_only = FALSE, keep_id = TRUE, return_datatable = TRUE)
  seasons_games[teams_meta, away_team:=team_abbreviation, on=c(away_id="team_id")]
  seasons_games[teams_meta, home_team:=team_abbreviation, on=c(home_id="team_id")]

  seasons_games[game_status!="final", `:=`(
    away_score = NA_integer_,
    home_score = NA_integer_,
    game_nbot = NA_integer_,
    game_shootout = NA
  )]

  setcolorder(seasons_games, c("season_id", "season_years", "season_type", "game_id",
                               "game_datetime", "game_status", "venue_name", "away_id", "away_team",
                               "away_score", "home_score", "home_team", "home_id", "game_nbot",
                               "game_shootout"))

  if (!keep_id) {
    drop_ids(seasons_games)
  }

  if (!return_datatable) {
    seasons_games <- as.data.frame(seasons_games)
  }

  add_copyright(seasons_games)

}
