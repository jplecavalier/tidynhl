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

# Set key
setkey(seasons_info, season_id)
