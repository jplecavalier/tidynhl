#' @export
tidy_schedule <- function(seasons_id, tz=Sys.timezone(), keep_id=FALSE) {

  games <- rbindlist(lapply(seasons_id, function(id) {

    Sys.sleep(runif(1, 1, 2))

    start <- seasons_info[season_id==id, as.character(season_regular_start)]
    end <- seasons_info[season_id==id, as.character(season_playoffs_end)]

    url <- paste0(api_url, "schedule?startDate=", start, "&endDate=", end)
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

    games[gameType%in%c("R", "P"), .(
      season_id = season,
      game_id = gamePk,
      game_type = gameType,
      game_datetime = suppressMessages(lubridate::as_datetime(gameDate, tz=tz)),
      game_status = status.detailedState,
      venue_name = venue.name,
      team_away_id = teams.away.team.id,
      team_home_id = teams.home.team.id
    )]

  }))

  games[teams_info, away_team:=team_abbreviation, on=c(team_away_id="team_id")]
  games[teams_info, home_team:=team_abbreviation, on=c(team_home_id="team_id")]

  if (!keep_id) {
    games[, colnames(games)[which(str_detect(colnames(games), "_id$"))]:=NULL]
  }

  games[]

}
