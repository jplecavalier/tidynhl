#' Get a tidy dataset of the NHL schedule including final score of completed games
#'
#' The function `tidy_schedule()` is meant to be a user-friendly way of getting the NHL schedule, including the final score of completed games.
#'
#' @param seasons_id Character vector of the seasons ID for which the schedule will be returned. The required format is 'xxxxyyyy'.
#' @param season *(optional)* Logical indicating if the season schedule should be returned. Default to `TRUE`.
#' @param playoffs *(optional)* Logical indicating if the playoffs schedule should be returned. Default to `TRUE`.
#' @param tz *(optional)* Character specifying the timezone that should be used for datetime. Default to the user system timezone.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be returned. Default to `TRUE` if the `data.table` package is
#'   attached in the active session.
#'
#' @examples
#' # Get the schedule of the 2019-2020 season and playoffs
#' tidy_schedule("20192020")
#'
#' # Get the regular season schedule of both the 2018-2019 and 2019-2020 seasons,
#' # keeping the IDs and indicating game datetime with Los Angeles local time
#' tidy_schedule(
#'   seasons_id = c("20182019", "20192020"),
#'   playoffs   = FALSE,
#'   tz         = "America/Los_Angeles",
#'   keep_id    = TRUE
#' )
#'
#' @export
tidy_schedule <- function(seasons_id, season=TRUE, playoffs=TRUE, tz=Sys.timezone(), keep_id=FALSE, return_datatable=NULL) {

  check_seasons_id <- seasons_id%in%seasons_info[, season_id]
  if (sum(!check_seasons_id)>0) {
    stop(paste("the following values are invalid for parameter 'seasons_id':", paste(seasons_id[!check_seasons_id], collapse = ", ")))
  }

  if (is.null(return_datatable)) {
    return_datatable <- "data.table"%in%.packages()
  }

  # TO DO: Add more complete parameters check

  games <- rbindlist(lapply(seasons_id, function(id) {

    Sys.sleep(runif(1, 1, 2))

    start <- seasons_info[season_id==id, as.character(season_regular_start)]
    end <- seasons_info[season_id==id, as.character(season_playoffs_end)]

    url <- paste0(api_url, "schedule?startDate=", start, "&endDate=", end, "&expand=schedule.linescore")
    schedule <- jsonlite::fromJSON(httr::content(httr::GET(url), "text"), flatten=TRUE)$dates %>%
      create_data_table()

    games <- rbindlist(schedule[, games], fill=TRUE)

    if (!"season" %in% colnames(games)) {
      games[, season:=NA_character_]
    }
    if (!"gamePk" %in% colnames(games)) {
      games[, gamePk:=NA_integer_]
    }
    if (!"gameType" %in% colnames(games)) {
      games[, gameType:=NA_character_]
    }
    if (!"gameDate" %in% colnames(games)) {
      games[, gameDate:=NA]
    }
    if (!"status.detailedState" %in% colnames(games)) {
      games[, status.detailedState:=NA_character_]
    }
    if (!"venue.name" %in% colnames(games)) {
      games[, venue.name:=NA_character_]
    }
    if (!"teams.away.team.id" %in% colnames(games)) {
      games[, teams.away.team.id:=NA_integer_]
    }
    if (!"teams.home.team.id" %in% colnames(games)) {
      games[, teams.home.team.id:=NA_integer_]
    }
    if (!"linescore.teams.away.goals" %in% colnames(games)) {
      games[, linescore.teams.away.goals:=NA_integer_]
    }
    if (!"linescore.teams.home.goals" %in% colnames(games)) {
      games[, linescore.teams.home.goals:=NA_integer_]
    }
    if (!"linescore.currentPeriod" %in% colnames(games)) {
      games[, linescore.currentPeriod:=NA_integer_]
    }
    if (!"linescore.hasShootout" %in% colnames(games)) {
      games[, linescore.hasShootout:=NA]
    }

    games[gameType%in%c("R", "P"), .(
      season_id = season,
      game_id = gamePk,
      game_type = gameType,
      game_datetime = suppressMessages(lubridate::as_datetime(gameDate, tz=tz)),
      game_status = status.detailedState,
      venue_name = venue.name,
      away_id = teams.away.team.id,
      home_id = teams.home.team.id,
      away_score = linescore.teams.away.goals,
      home_score = linescore.teams.home.goals,
      game_nbot = linescore.currentPeriod-linescore.hasShootout-3L,
      game_shootout = linescore.hasShootout
    )]

  }))

  games[teams_info, away_team:=team_abbreviation, on=c(away_id="team_id")]
  games[teams_info, home_team:=team_abbreviation, on=c(home_id="team_id")]

  games[game_status!="Final", `:=`(
    away_score = NA_integer_,
    home_score = NA_integer_,
    game_nbot = NA_integer_,
    game_shootout = NA
  )]

  setcolorder(games, c("season_id", "game_id", "game_type", "game_datetime", "game_status", "venue_name", "away_id", "away_team", "away_score", "home_score",
                       "home_team", "home_id", "game_nbot", "game_shootout"))

  if (!season) {
    games <- games[game_type!="R"]
  }

  if (!playoffs) {
    games <- games[game_type!="P"]
  }

  if (!keep_id) {
    games[, colnames(games)[grep("_id$", colnames(games))]:=NULL]
  }

  if (return_datatable) {
    games[]
  } else {
    as.data.frame(games)
  }

}
