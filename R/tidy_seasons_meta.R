#' Get a tidy dataset of NHL seasons metadata
#'
#' The function `tidy_seasons_meta()` is meant to be a user-friendly way of getting metadata about
#' NHL seasons.
#'
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get metadata of NHL seasons
#' tidy_seasons_meta()
#'
#' @export
tidy_seasons_meta <- function(
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  if (!is.logical(keep_id) | is.na(keep_id) | length(keep_id) != 1L) {
    stop("argument 'keep_id' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(return_datatable) | is.na(return_datatable) | length(return_datatable) != 1L) {
    stop("argument 'return_datatable' should be one of 'TRUE' or 'FALSE'")
  }

  if (!exists("seasons_meta", envir = data)) {
    load_seasons_meta()
  }
  seasons_meta <- copy(get("seasons_meta", envir = data))

  if (!keep_id) {
    drop_ids(seasons_meta)
  }

  add_copyright(seasons_meta)

  if (return_datatable) {
    seasons_meta[]
  } else {
    as.data.frame(seasons_meta)
  }

}

load_seasons_meta <- function() {

  seasons_meta <- create_data_table(get_stats_api("seasons")[[1]]$seasons)

  validate_columns(seasons_meta, list(
    seasonId = NA_character_,
    regularSeasonStartDate = NA_character_,
    regularSeasonEndDate = NA_character_,
    seasonEndDate = NA_character_,
    numberOfGames = NA_integer_,
    tiesInUse = NA,
    olympicsParticipation = NA,
    conferencesInUse = NA,
    divisionsInUse = NA,
    wildCardInUse = NA
  ))

  seasons_meta <- seasons_meta[, .(
    season_id = seasonId,
    season_regular_start = as.Date(regularSeasonStartDate),
    season_regular_end = as.Date(regularSeasonEndDate),
    season_playoffs_end = as.Date(seasonEndDate),
    season_games_nb = numberOfGames,
    season_ties = tiesInUse,
    season_olympics = olympicsParticipation,
    season_conferences = conferencesInUse,
    season_divisions = divisionsInUse,
    season_wildcards = wildCardInUse
  )]

  teams_meta <- tidy_teams_meta(active_only = FALSE, keep_id = TRUE, return_datatable = TRUE)
  season_active_id <- seasons_meta[, max(season_id)]
  teams_meta[team_active == TRUE, season_last_id := season_active_id]

  seasons_meta[, season_teams_nb := sapply(season_id, function(season_id) {
    teams_meta[season_first_id <= season_id & season_id <= season_last_id, .N]
  })]
  seasons_meta[season_id == "19311932", season_teams_nb := season_teams_nb -1L]

  setcolorder(seasons_meta, c("season_id", "season_regular_start", "season_regular_end",
                              "season_playoffs_end", "season_teams_nb", "season_games_nb"))

  assign("seasons_meta", seasons_meta, data)

}
