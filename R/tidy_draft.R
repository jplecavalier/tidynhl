#' Get a tidy dataset of the NHL entry drafts
#'
#' The function `tidy_draft()` is meant to be a user-friendly way of getting data about the NHL entry drafts.
#'
#' @param draft_year Integer vector indicating which entry drafts will be returned. The first NHL entry draft was held in 1963.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be returned. Default to `TRUE` if the `data.table` package is
#'   attached in the active session.
#'
#' @export
tidy_draft <- function(drafts_year, keep_id=FALSE, return_datatable=NULL) {

  if (is.null(return_datatable)) {
    return_datatable <- "data.table"%in%.packages()
  }

  # TO DO: Add more complete parameters check

  drafts <- rbindlist(lapply(drafts_year, function(year) {

    Sys.sleep(runif(1, 1, 2))

    url <- paste0(api_url, "draft/", year)
    draft <- jsonlite::fromJSON(httr::content(httr::GET(url), "text"), flatten=TRUE)$drafts$rounds[[1]]$picks %>%
      create_data_table() %>%
      rbindlist(fill=TRUE)

    if (!"year" %in% colnames(draft)) {
      draft[, year:=NA_integer_]
    }
    if (!"round" %in% colnames(draft)) {
      draft[, round:=NA_character_]
    }
    if (!"pickInRound" %in% colnames(draft)) {
      draft[, pickInRound:=NA_integer_]
    }
    if (!"pickOverall" %in% colnames(draft)) {
      draft[, pickOverall:=NA_integer_]
    }
    if (!"team.id" %in% colnames(draft)) {
      draft[, team.id:=NA_integer_]
    }
    if (!"prospect.id" %in% colnames(draft)) {
      draft[, prospect.id:=NA_integer_]
    }
    if (!"prospect.fullName" %in% colnames(draft)) {
      draft[, prospect.fullName:=NA_character_]
    }

    draft[, .(
      draft_year = year,
      draft_round = as.integer(round),
      draft_pick = pickInRound,
      draft_overall = pickOverall,
      team_id = team.id,
      prospect_id = prospect.id,
      prospect_fullname = prospect.fullName
    )]

  }))

  drafts[teams_info, team_abbreviation:=team_abbreviation, on=.(team_id)]

  # TO DO: Add the link between prospects and players in tidynhl:::prospects_info and merge it with drafts
  # drafts[, player_id:=NA_integer_]

  setcolorder(drafts, c("draft_year", "draft_round", "draft_pick", "draft_overall", "team_id", "team_abbreviation", "prospect_id", "prospect_fullname"))
  # setcolorder(drafts, c("draft_year", "draft_round", "draft_pick", "draft_overall", "team_id", "team_abbreviation", "prospect_id", "prospect_fullname", "player_id"))

  if (!keep_id) {
    drafts[, colnames(drafts)[grep("_id$", colnames(drafts))]:=NULL]
  }

  if (return_datatable) {
    drafts[]
  } else {
    as.data.frame(drafts)
  }

}
