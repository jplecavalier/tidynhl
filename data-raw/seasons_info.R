# Get seasons_info
seasons_info <- fromJSON(content(GET(paste0(tidynhl:::api_url, "seasons")), "text"), flatten=TRUE)$seasons %>%
  tidynhl:::create_data_table()

# Clean seasons_info
setnames(seasons_info, "seasonId", "season_id")
setnames(seasons_info, "regularSeasonStartDate", "season_regular_start")
seasons_info[, season_regular_start:=as.Date(season_regular_start)]
setnames(seasons_info, "regularSeasonEndDate", "season_regular_end")
seasons_info[, season_regular_end:=as.Date(season_regular_end)]
setnames(seasons_info, "seasonEndDate", "season_playoffs_end")
seasons_info[, season_playoffs_end:=as.Date(season_playoffs_end)]
setnames(seasons_info, "numberOfGames", "season_nbgames")
setnames(seasons_info, "tiesInUse", "season_ties")
setnames(seasons_info, "olympicsParticipation", "season_olympics")
setnames(seasons_info, "conferencesInUse", "season_conferences")
setnames(seasons_info, "divisionsInUse", "season_divisions")
setnames(seasons_info, "wildCardInUse", "season_wildcards")

# Get players_id by season
seasons_info[, players_id:=lapply(season_id, function(season_id) {

  schedule <- tidy_schedule(season_id, keep_id=TRUE)

  sort(unique(unlist(lapply(schedule[, game_id], function(game_id) {

    Sys.sleep(runif(1, 1, 2))

    url <- paste0(tidynhl:::api_url, "game/", game_id, "/boxscore")
    teams <- fromJSON(content(GET(url), "text"), flatten=TRUE)$teams %>%
      tidynhl:::create_data_table()

    lapply(teams, function(team) {
      setdiff(c(team$skaters, team$goalies), team$scratches)
    })

  }))))

})]

# Add missing games
seasons_info[season_id==19891990, games_missing_id:=.(list(1989020027L))]
seasons_info[season_id==19901991, games_missing_id:=.(c(1990020681L, 1990020526L, 1990020465L, 1990020407L, 1990020269L))]

# Set key
setkey(seasons_info, season_id)
