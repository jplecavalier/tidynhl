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

  setcolorder(seasons_meta)
  setorder(seasons_meta)

  assign("seasons_meta", seasons_meta, data)

}
