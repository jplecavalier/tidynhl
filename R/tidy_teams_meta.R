#' Get a tidy dataset of NHL teams metadata
#'
#' The function `tidy_teams_meta()` is meant to be a user-friendly way of getting metadata about NHL
#' teams.
#'
#' @param active_only *(optional)* Logical indicating if only active teams should be returned.
#'   Default to `TRUE`.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get metadata of active teams
#' tidy_teams_meta()
#'
#' # Get metadata of active and historical teams keeping the IDs
#' tidy_teams_meta(active_only = FALSE, keep_id = TRUE)
#'
#' @export
tidy_teams_meta <- function(
  active_only = TRUE,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  if (!is.logical(active_only) | is.na(active_only) | length(active_only) != 1L) {
    stop("argument 'active_only' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(keep_id) | is.na(keep_id) | length(keep_id) != 1L) {
    stop("argument 'keep_id' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(return_datatable) | is.na(return_datatable) | length(return_datatable) != 1L) {
    stop("argument 'return_datatable' should be one of 'TRUE' or 'FALSE'")
  }

  if (!exists("teams_meta", envir = data)) {
    load_teams_meta()
  }
  teams_meta <- copy(get("teams_meta", envir = data))

  if (!keep_id) {
    drop_ids(teams_meta)
  }

  if (active_only) {
    drop_columns <- c("team_active", "season_last_id", "season_last_years")
    drop_columns <- drop_columns[which(drop_columns %in% colnames(teams_meta))]
    teams_meta <- teams_meta[team_active == TRUE, .SD, .SDcols = !drop_columns]
  }

  if (!return_datatable) {
    teams_meta <- as.data.frame(teams_meta)
  }

  add_copyright(teams_meta)

}

load_teams_meta <- function() {

  includes <- paste0("include=", paste0("teams.", c(
    "id", "active", "commonName", "fullName", "logos", "placeName", "triCode",
    paste0("conference.", c(
      "id", "abbreviation", "name"
    )),
    paste0("division.", c(
      "id", "abbreviation", "name"
    )),
    paste0("franchiseTeam.", c(
      "firstSeason.id", "lastSeason.id"
    ))
  )), collapse = "&")

  franchise <- create_data_table(get_records_api(paste0("franchise?", includes))[[1]][["data"]])

  teams_meta <- franchise[, rbindlist(mapply(function(franchise_id, teams) {

    franchiseTeam <- teams[, rbindlist(franchiseTeam, fill = TRUE)]
    if (!("lastSeason.id" %in% colnames(franchiseTeam))) {
      franchiseTeam[, lastSeason.id := NA_character_]
    }

    teams[, shortName := placeName]
    teams[id==3L, shortName := "NY Rangers"]
    teams[id==2L, shortName := "NY Islanders"]
    teams[id==19L, shortName := "St Louis"]

    teams[active != "Y", `:=`(
      conference.id = NA_integer_,
      conference.abbreviation = NA_character_,
      conference.name = NA_character_,
      division.id = NA_integer_,
      division.abbreviation = NA_character_,
      division.name = NA_character_
    )]

    logo_last_url <- teams[, rbindlist(logos)][background == "light"][
      , .(logo_last_url = secureUrl[which.max(endSeason)]), .(teamId)][, logo_last_url]

    list(
      franchise_id = franchise_id,
      team_id = teams[, id],
      team_abbreviation = teams[, triCode],
      team_active = teams[, active == "Y"],
      team_place = teams[, placeName],
      team_name = teams[, commonName],
      team_fullname = teams[, fullName],
      team_shortname = teams[, shortName],
      season_first_id = franchiseTeam[, firstSeason.id],
      season_first_years = franchiseTeam[, season_years(firstSeason.id)],
      season_last_id = franchiseTeam[, lastSeason.id],
      season_last_years = franchiseTeam[, season_years(lastSeason.id)],
      conference_active_id = teams[, conference.id],
      conference_active_abbreviation = teams[, conference.abbreviation],
      conference_active_name = teams[, conference.name],
      division_active_id = teams[, division.id],
      division_active_abbreviation = teams[, division.abbreviation],
      division_active_name = teams[, division.name],
      logo_last_url = logo_last_url
    )

  }, franchise_id = id, teams = teams, SIMPLIFY = FALSE), fill = TRUE)]

  venues_active <- rbindlist(list(
    list(
      team_id = 24L,
      venue_active_name = "Honda Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "CA",
      venue_active_city = "Anaheim",
      venue_active_tz = "America/Los_Angeles",
      venue_active_lat = 33.807778,
      venue_active_long = -117.876667
    ),
    list(
      team_id = 53L,
      venue_active_name = "Gila River Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "AZ",
      venue_active_city = "Glendale",
      venue_active_tz = "America/Phoenix",
      venue_active_lat = 33.531944,
      venue_active_long = -112.261111
    ),
    list(
      team_id = 6L,
      venue_active_name = "TD Garden",
      venue_active_country = "USA",
      venue_active_stateprovince = "MA",
      venue_active_city = "Boston",
      venue_active_tz = "America/New_York",
      venue_active_lat = 42.366303,
      venue_active_long = -71.062228
    ),
    list(
      team_id = 7L,
      venue_active_name = "KeyBank Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "NY",
      venue_active_city = "Buffalo",
      venue_active_tz = "America/New_York",
      venue_active_lat = 42.875,
      venue_active_long = -78.876389
    ),
    list(
      team_id = 12L,
      venue_active_name = "PNC Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "NC",
      venue_active_city = "Raleigh",
      venue_active_tz = "America/New_York",
      venue_active_lat = 35.803333,
      venue_active_long = -78.721944
    ),
    list(
      team_id = 29L,
      venue_active_name = "Nationwide Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "OH",
      venue_active_city = "Columbus",
      venue_active_tz = "America/New_York",
      venue_active_lat = 39.969283,
      venue_active_long = -83.006111
    ),
    list(
      team_id = 20L,
      venue_active_name = "Scotiabank Saddledome",
      venue_active_country = "Canada",
      venue_active_stateprovince = "AB",
      venue_active_city = "Calgary",
      venue_active_tz = "America/Denver",
      venue_active_lat = 51.0375,
      venue_active_long = -114.051944
    ),
    list(
      team_id = 16L,
      venue_active_name = "United Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "IL",
      venue_active_city = "Chicago",
      venue_active_tz = "America/Chicago",
      venue_active_lat = 41.880556,
      venue_active_long = -87.674167
    ),
    list(
      team_id = 21L,
      venue_active_name = "Ball Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "CO",
      venue_active_city = "Denver",
      venue_active_tz = "America/Denver",
      venue_active_lat = 39.748611,
      venue_active_long = -105.0075
    ),
    list(
      team_id = 25L,
      venue_active_name = "American Airlines Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "TX",
      venue_active_city = "Dallas",
      venue_active_tz = "America/Chicago",
      venue_active_lat = 32.790556,
      venue_active_long = -96.810278
    ),
    list(
      team_id = 17L,
      venue_active_name = "Little Caesars Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "MI",
      venue_active_city = "Detroit",
      venue_active_tz = "America/Detroit",
      venue_active_lat = 42.341111,
      venue_active_long = -83.055
    ),
    list(
      team_id = 22L,
      venue_active_name = "Rogers Place",
      venue_active_country = "Canada",
      venue_active_stateprovince = "AB",
      venue_active_city = "Edmonton",
      venue_active_tz = "America/Edmonton",
      venue_active_lat = 53.546944,
      venue_active_long = -113.497778
    ),
    list(
      team_id = 13L,
      venue_active_name = "BB&T Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "FL",
      venue_active_city = "Sunrise",
      venue_active_tz = "America/New_York",
      venue_active_lat = 26.158333,
      venue_active_long = -80.325556
    ),
    list(
      team_id = 26L,
      venue_active_name = "STAPLES Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "CA",
      venue_active_city = "Los Angeles",
      venue_active_tz = "America/Los_Angeles",
      venue_active_lat = 34.043056,
      venue_active_long = -118.267222
    ),
    list(
      team_id = 30L,
      venue_active_name = "Xcel Energy Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "MN",
      venue_active_city = "St Paul",
      venue_active_tz = "America/Chicago",
      venue_active_lat = 44.944722,
      venue_active_long = -93.101111
    ),
    list(
      team_id = 8L,
      venue_active_name = "Bell Centre",
      venue_active_country = "Canada",
      venue_active_stateprovince = "QC",
      venue_active_city = "Montreal",
      venue_active_tz = "America/Montreal",
      venue_active_lat = 45.496111,
      venue_active_long = -73.569444
    ),
    list(
      team_id = 1L,
      venue_active_name = "Prudential Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "NJ",
      venue_active_city = "Newark",
      venue_active_tz = "America/New_York",
      venue_active_lat = 40.733611,
      venue_active_long = -74.171111
    ),
    list(
      team_id = 18L,
      venue_active_name = "Bridgestone Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "TN",
      venue_active_city = "Nashville",
      venue_active_tz = "America/Chicago",
      venue_active_lat = 36.159167,
      venue_active_long = -86.778611
    ),
    list(
      team_id = 2L,
      venue_active_name = "Nassau Coliseum",
      venue_active_country = "USA",
      venue_active_stateprovince = "NY",
      venue_active_city = "Uniondale",
      venue_active_tz = "America/New_York",
      venue_active_lat = 40.722778,
      venue_active_long = -73.590556
    ),
    list(
      team_id = 3L,
      venue_active_name = "Madison Square Garden",
      venue_active_country = "USA",
      venue_active_stateprovince = "NY",
      venue_active_city = "New York",
      venue_active_tz = "America/New_York",
      venue_active_lat = 40.750556,
      venue_active_long = -73.993611
    ),
    list(
      team_id = 9L,
      venue_active_name = "Canadian Tire Centre",
      venue_active_country = "Canada",
      venue_active_stateprovince = "ON",
      venue_active_city = "Ottawa",
      venue_active_tz = "America/New_York",
      venue_active_lat = 45.296944,
      venue_active_long = -75.927222
    ),
    list(
      team_id = 4L,
      venue_active_name = "Wells Fargo Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "PA",
      venue_active_city = "Philadelphia",
      venue_active_tz = "America/New_York",
      venue_active_lat = 39.901111,
      venue_active_long = -75.171944
    ),
    list(
      team_id = 5L,
      venue_active_name = "PPG Paints Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "PA",
      venue_active_city = "Pittsburgh",
      venue_active_tz = "America/New_York",
      venue_active_lat = 40.439444,
      venue_active_long = -79.989167
    ),
    list(
      team_id = 28L,
      venue_active_name = "SAP Center at San Jose",
      venue_active_country = "USA",
      venue_active_stateprovince = "CA",
      venue_active_city = "San Jose",
      venue_active_tz = "America/Los_Angeles",
      venue_active_lat = 37.332778,
      venue_active_long = -121.901111
    ),
    list(
      team_id = 19L,
      venue_active_name = "Enterprise Center",
      venue_active_country = "USA",
      venue_active_stateprovince = "MO",
      venue_active_city = "St. Louis",
      venue_active_tz = "America/Chicago",
      venue_active_lat = 38.626667,
      venue_active_long = -90.2025
    ),
    list(
      team_id = 14L,
      venue_active_name = "AMALIE Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "FL",
      venue_active_city = "Tampa",
      venue_active_tz = "America/New_York",
      venue_active_lat = 27.942778,
      venue_active_long = -82.451944
    ),
    list(
      team_id = 10L,
      venue_active_name = "Scotiabank Arena",
      venue_active_country = "Canada",
      venue_active_stateprovince = "ON",
      venue_active_city = "Toronto",
      venue_active_tz = "America/Toronto",
      venue_active_lat = 43.643333,
      venue_active_long = -79.379167
    ),
    list(
      team_id = 23L,
      venue_active_name = "Rogers Arena",
      venue_active_country = "Canada",
      venue_active_stateprovince = "BC",
      venue_active_city = "Vancouver",
      venue_active_tz = "America/Vancouver",
      venue_active_lat = 49.277778,
      venue_active_long = -123.108889
    ),
    list(
      team_id = 54L,
      venue_active_name = "T-Mobile Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "NV",
      venue_active_city = "Las Vegas",
      venue_active_tz = "America/Los_Angeles",
      venue_active_lat = 36.102778,
      venue_active_long = -115.178333
    ),
    list(
      team_id = 52L,
      venue_active_name = "Bell MTS Place",
      venue_active_country = "Canada",
      venue_active_stateprovince = "MB",
      venue_active_city = "Winnipeg",
      venue_active_tz = "America/Winnipeg",
      venue_active_lat = 49.892778,
      venue_active_long = -97.143611
    ),
    list(
      team_id = 15L,
      venue_active_name = "Capital One Arena",
      venue_active_country = "USA",
      venue_active_stateprovince = "DC",
      venue_active_city = "Washington",
      venue_active_tz = "America/New_York",
      venue_active_lat = 38.898056,
      venue_active_long = -77.020833
    )
  ))

  cols <- setdiff(colnames(venues_active), "team_id")
  teams_meta[venues_active, (cols) := mget(cols), on = .(team_id)]

  setcolorder(teams_meta, c(setdiff(colnames(teams_meta), "logo_last_url"), "logo_last_url"))
  setorder(teams_meta, season_last_id, team_abbreviation)

  assign("teams_meta", teams_meta, data)

}
