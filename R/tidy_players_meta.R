#' Get a tidy dataset of NHL players metadata
#'
#' The function `tidy_players_meta()` is meant to be a user-friendly way of getting metadata about the selected players.
#'
#' @param players_id Integer vector indicating the NHL ID of players for whom the game logs will be returned.
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
#' # Print an excerpt of the data
#' metadata_lecavalier[, .(player_name, player_birth_date, player_nationality, player_hand)]
#'
#' # Print an excerpt of the data
#' gamelogs_lecavalier[, .(season_years, season_type, skater_goals, skater_assists, skater_shots)]
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
tidy_players_meta <- function(players_id, keep_id=FALSE, return_datatable=NULL) {

  if (is.null(return_datatable)) {
    return_datatable <- "data.table"%in%.packages()
  }

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

  if (!keep_id) {
    meta[, colnames(meta)[grep("_id$", colnames(meta))]:=NULL]
  }

  if (return_datatable) {
    meta[]
  } else {
    as.data.frame(meta)
  }

}
