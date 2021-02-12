#' Get a tidy dataset of NHL entry drafts
#'
#' The function `tidy_drafts()` is meant to be a user-friendly way of getting data about the NHL
#' entry drafts.
#'
#' @param drafts_year *(optional)*  Integer vector indicating which entry drafts will be returned.
#'   The first NHL entry draft was held in 1963. Default to `NULL` which will return every entry
#'   drafts in NHL history.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get every drafts in NHL history
#' tidy_drafts()
#'
#' # Get both the 2019 and 2020 NHL entry drafts, keeping  the IDs
#' tidy_drafts(drafts_year = 2019:2020, keep_id = TRUE)
#'
#' @export
tidy_drafts <- function(
  drafts_year = NULL,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  if (!is.null(drafts_year)) {
    drafts_year <- assert_drafts_year(drafts_year)
  }

  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

  if (!exists("drafts", envir = data)) {
    load_drafts()
  }
  drafts <- copy(get("drafts", envir = data))

  if (!is.null(drafts_year)) {
    drafts <- drafts[draft_year %in% drafts_year]
  }

  if (!keep_id) {
    drop_ids(drafts)
  }

  add_copyright(drafts)

  if (return_datatable) {
    drafts[]
  } else {
    as.data.frame(drafts)
  }

}

load_drafts <- function() {

  drafts <- create_data_table(get_records_api("draft")[[1]]$data)

  validate_columns(drafts, list(
    draftYear = NA_integer_,
    roundNumber = NA_integer_,
    pickInRound = NA_integer_,
    overallPickNumber = NA_integer_,
    draftedByTeamId = NA_integer_,
    triCode = NA_character_,
    playerId = NA_integer_,
    playerName = NA_character_,
    amateurLeague = NA_character_,
    amateurClubName = NA_character_
  ))

  drafts <- drafts[, .(
    draft_year = draftYear,
    draft_round = roundNumber,
    draft_pick = pickInRound,
    draft_overall = overallPickNumber,
    team_id = draftedByTeamId,
    team_abbreviation = triCode,
    player_id = playerId,
    player_name = playerName,
    amateur_league_name = amateurLeague,
    amateur_team_name = amateurClubName
  )]

  setorder(drafts, draft_year, draft_overall)

  assign("drafts", drafts, data)

}
