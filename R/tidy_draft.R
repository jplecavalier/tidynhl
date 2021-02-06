#' Get a tidy dataset of the NHL entry drafts
#'
#' The function `tidy_draft()` is meant to be a user-friendly way of getting data about the NHL
#' entry drafts.
#'
#' @param drafts_year Integer vector indicating which entry drafts will be returned. The first NHL
#'   entry draft was held in 1963.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get the 2020 NHL entry draft
#' tidy_draft(2020L)
#'
#' # Get both the 2019 and 2020 NHL entry drafts, keeping  the IDs
#' tidy_draft(drafts_year = 2019:2020, keep_id = TRUE)
#'
#' @export
tidy_draft <- function(
  drafts_year,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  error <- FALSE
  if (!is.numeric(drafts_year) | sum(is.na(drafts_year)) > 0L | length(drafts_year) == 0L) {
    error <- TRUE
  } else {
    if (sum(as.integer(drafts_year) != drafts_year) > 0L) {
      error <- TRUE
    } else {
      if (sum(drafts_year < 1963L) > 0L) {
        error <- TRUE
      }
    }
  }
  if (error) {
    stop("argument 'drafts_year' should be a vector of integers greater than or equal to 1963L")
  }

  if (!is.logical(keep_id) | is.na(keep_id) | length(keep_id) != 1L) {
    stop("argument 'keep_id' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(return_datatable) | is.na(return_datatable) | length(return_datatable) != 1L) {
    stop("argument 'return_datatable' should be one of 'TRUE' or 'FALSE'")
  }

  api_returns <- get_stats_api(paste0("draft/", drafts_year))

  drafts <- rbindlist(lapply(api_returns, function(api_return) {

    draft <- rbindlist(api_return$drafts$rounds[[1]]$picks, fill = TRUE)

    if (length(draft) == 0L) {
      stop(paste0("no NHL draft found for ", api_return$drafts$draftYear))
    }

    draft[]

  }), fill = TRUE)

  validate_columns(drafts, list(
    year = NA_integer_,
    round = NA_character_,
    pickInRound = NA_integer_,
    pickOverall = NA_integer_,
    team.id = NA_integer_,
    prospect.id = NA_integer_,
    prospect.fullName = NA_character_
  ))

  drafts <- drafts[, .(
    draft_year = year,
    draft_round = as.integer(round),
    draft_pick = pickInRound,
    draft_overall = pickOverall,
    team_id = team.id,
    prospect_id = prospect.id,
    prospect_fullname = prospect.fullName
  )]

  teams_meta <- tidy_teams_meta(active_only = FALSE, keep_id = TRUE, return_datatable = TRUE)
  drafts[teams_meta, team_abbreviation := team_abbreviation, on = .(team_id)]
  drafts[prospects_info, player_id := player_id, on = .(prospect_id)]

  setcolorder(drafts, c("draft_year", "draft_round", "draft_pick", "draft_overall", "team_id",
                        "team_abbreviation", "prospect_id", "prospect_fullname", "player_id"))
  setorder(drafts, draft_year, draft_overall)

  if (!keep_id) {
    drop_ids(drafts)
  }

  if (!return_datatable) {
    drafts <- as.data.frame(drafts)
  }

  add_copyright(drafts)

}
