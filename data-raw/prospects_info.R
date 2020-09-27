# Get drafts
drafts <- tidy_draft(1963:2019, keep_id=TRUE)

# Get prospects_info
prospects_info <- rbindlist(lapply(drafts[!is.na(prospect_id), unique(prospect_id)], function(id) {

  Sys.sleep(runif(1, 1, 2))

  url <- paste0(tidynhl:::api_url, "draft/prospects/", id)
  prospect <- fromJSON(content(GET(url), "text"), flatten=TRUE)$prospects %>%
    tidynhl:::create_data_table()

  if (!"nhlPlayerId" %in% colnames(prospect)) {
    prospect[, nhlPlayerId:=NA_integer_]
  }

  prospect[, .(
    prospect_id = id,
    player_id = nhlPlayerId
  )]

}))
rm(drafts)

# Set key
setkey(prospects_info, prospect_id)
