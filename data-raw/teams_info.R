library(data.table)
library(jsonlite)
library(httr)
library(magrittr)
library(stringr)
library(tidynhl)

teams_id_range <- 1:59

# Get teams_info
active_teams <- fromJSON(content(GET(paste0(tidynhl:::api_url, "teams")), "text"), flatten=TRUE)$teams %>%
  tidynhl:::create_data_table()
inactive_teams <- rbindlist(lapply(setdiff(teams_id_range, active_teams[, id]), function(team_id) {
  Sys.sleep(runif(1L, 1L, 2L))
  fromJSON(content(GET(paste0(tidynhl:::api_url, "teams/", team_id)), "text"), flatten=TRUE)$teams %>%
    tidynhl:::create_data_table()
}), fill=TRUE)
teams_info <- rbindlist(list(active_teams, inactive_teams), fill=TRUE)
rm(active_teams, inactive_teams)

# Clean teams_info
teams_info[, colnames(teams_info)[which(str_detect(colnames(teams_info), "link"))]:=NULL]
setnames(teams_info, "id", "team_id")
setnames(teams_info, "name", "team_fullname")
setnames(teams_info, "abbreviation", "team_abbreviation")
setnames(teams_info, "teamName", "team_name")
setnames(teams_info, "locationName", "team_location")
setnames(teams_info, "firstYearOfPlay", "team_firstyear")
teams_info[, team_firstyear:=as.integer(team_firstyear)]
setnames(teams_info, "shortName", "team_shortname")
setnames(teams_info, "officialSiteUrl", "team_siteurl")
setnames(teams_info, "franchiseId", "franchise_id")
setnames(teams_info, "active", "team_active")
setnames(teams_info, "venue.name", "venue_name")
setnames(teams_info, "venue.city", "venue_city")
teams_info[, venue.id:=NULL]
setnames(teams_info, "venue.timeZone.id", "venue_tz")
teams_info[, venue.timeZone.offset:=NULL]
teams_info[, venue.timeZone.tz:=NULL]
setnames(teams_info, "division.id", "division_id")
teams_info[, division.name:=NULL]
teams_info[, division.nameShort:=NULL]
teams_info[, division.abbreviation:=NULL]
setnames(teams_info, "conference.id", "conference_id")
teams_info[, conference.name:=NULL]
teams_info[, franchise.franchiseId:=NULL]
teams_info[, franchise.teamName:=NULL]

# Set key
setkey(teams_info, team_id)

usethis::use_data(teams_info, overwrite=TRUE, internal=TRUE)
