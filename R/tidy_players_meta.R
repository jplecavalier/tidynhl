#' Get a tidy dataset of NHL players metadata
#'
#' The function `tidy_players_meta()` is meant to be a user-friendly way of getting metadata about the selected players.
#'
#' @param players_id Integer vector indicating the NHL ID of players for whom the game logs will be returned.
#' @param internal Logical indicating whether to use the internal database or the external API. When using the external API, additional columns are available.
#'   Default to `TRUE`.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be returned. Default to `TRUE` if the `data.table` package is
#'   attached in the active session.
#'
#' @examples
#' # Load the data.table package to easily manipulate the data
#' library(data.table)
#'
#' # Get metadata about Vincent Lecavalier
#' metadata_lecavalier <- tidy_players_meta(8467329L)
#'
#' # Print the column names
#' colnames(metadata_lecavalier)
#'
#' # Get metadata about Carey Price using the external API
#' metadata_price <- tidy_players_meta(8471679L, internal=FALSE)
#'
#' # Print the column names
#' colnames(metadata_price)
#'
#' # Print an excerpt of the data
#' metadata_price[, .(player_name, player_number, player_active, team_abbreviation)]
#'
#' # Get metadata about both Vincent Lecavalier and Carey Price, keeping the IDs
#' metadata_lecavalier_price <- tidy_players_meta(
#'   players_id = c(8467329L, 8471679L),
#'   keep_id    = TRUE
#' )
#'
#' # Print the column names
#' colnames(metadata_lecavalier_price)
#'
#' # Print an excerpt of the data
#' metadata_lecavalier_price[, .(player_id, player_name, player_inches, player_pounds, player_position)]
#'
#' @export
tidy_players_meta <- function(players_id, internal=TRUE, keep_id=FALSE, return_datatable=NULL) {

  if (is.null(return_datatable)) {
    return_datatable <- "data.table"%in%.packages()
  }

  if (internal) {

    meta <- data.table(player_id=players_id)

    cols <- colnames(players_info)
    meta[players_info, (cols):=mget(cols), on=.(player_id)]
    rm(cols)

    missing_ids <- meta[is.na(player_name), player_id]
    if (length(missing_ids)>0L) {

      warning(paste0(
        "the following IDs are missing from tidynhl internal database: ",
        paste(missing_ids, collapse=", ")
      ))

    }

    meta <- meta[!is.na(player_name)]

  } else {

    meta <- rbindlist(lapply(players_id, function(id) {

      Sys.sleep(runif(1, 1, 2))

      url <- paste0(api_url, "people/", id)
      player <- jsonlite::fromJSON(httr::content(httr::GET(url), "text"), flatten=TRUE)$people %>%
        create_data_table()

      if (!is.data.table(player)) {
        player <- data.table()
      }

      if (!"fullName" %in% colnames(player)) {
        player[, fullName:=NA_character_]
      }
      if (!"primaryNumber" %in% colnames(player)) {
        player[, primaryNumber:=NA_character_]
      }
      if (!"birthDate" %in% colnames(player)) {
        player[, birthDate:=NA_character_]
      }
      if (!"birthCity" %in% colnames(player)) {
        player[, birthCity:=NA_character_]
      }
      if (!"birthStateProvince" %in% colnames(player)) {
        player[, birthStateProvince:=NA_character_]
      }
      if (!"birthCountry" %in% colnames(player)) {
        player[, birthCountry:=NA_character_]
      }
      if (!"nationality" %in% colnames(player)) {
        player[, nationality:=NA_character_]
      }
      if (!"height" %in% colnames(player)) {
        player[, height:=NA_character_]
      }
      if (!"weight" %in% colnames(player)) {
        player[, weight:=NA_integer_]
      }
      if (!"active" %in% colnames(player)) {
        player[, active:=NA]
      }
      if (!"alternateCaptain" %in% colnames(player)) {
        player[, alternateCaptain:=NA]
      }
      if (!"captain" %in% colnames(player)) {
        player[, captain:=NA]
      }
      if (!"rookie" %in% colnames(player)) {
        player[, rookie:=NA]
      }
      if (!"shootsCatches" %in% colnames(player)) {
        player[, shootsCatches:=NA_character_]
      }
      if (!"rosterStatus" %in% colnames(player)) {
        player[, rosterStatus:=NA_character_]
      }
      if (!"currentTeam.id" %in% colnames(player)) {
        player[, currentTeam.id:=NA_integer_]
      }
      if (!"primaryPosition.code" %in% colnames(player)) {
        player[, primaryPosition.code:=NA_character_]
      }
      if (!"primaryPosition.type" %in% colnames(player)) {
        player[, primaryPosition.type:=NA_character_]
      }

      if (player[, .N==0L]) {
        id <- integer()
      }

      height_inch <- function(height) {
        as.integer(stringr::str_sub(height, 1L, 1L))*12L+as.integer(stringr::str_trim(stringr::str_sub(height, -3L, -2L)))
      }

      data.table(
        player_id = id,
        player_name =  stringi::stri_trans_general(player$fullName, "Latin-ASCII"),
        player_number = as.integer(player$primaryNumber),
        player_birth_date = as.Date(player$birthDate),
        player_birth_city = player$birthCity,
        player_birth_stateprovince = player$birthStateProvince,
        player_birth_country = player$birthCountry,
        player_nationality = player$nationality,
        player_inches = height_inch(player$height),
        player_pounds = player$weight,
        player_active = player$active,
        player_alt_captain = player$alternateCaptain,
        player_captain = player$captain,
        player_rookie = player$rookie,
        player_hand = player$shootsCatches,
        player_roster_status = player$rosterStatus,
        team_id = player$currentTeam.id,
        player_position = player$primaryPosition.code,
        player_position_type = stringr::str_sub(player$primaryPosition.type, 1L, 1L)
      )

    }))

    teams_meta <- tidy_teams_meta(active_only = FALSE, keep_id = TRUE, return_datatable = TRUE)
    meta[teams_meta, team_abbreviation:=team_abbreviation, on=.(team_id)]

    setcolorder(meta, c("player_id", "player_name", "team_id", "team_abbreviation"))

  }

  if (!keep_id) {
    meta[, colnames(meta)[grep("_id$", colnames(meta))]:=NULL]
  }

  if (return_datatable) {
    meta[]
  } else {
    as.data.frame(meta)
  }

}
