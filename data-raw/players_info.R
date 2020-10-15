# Input
players_id <- unique(c(tidynhl:::seasons_info[, unlist(players_id)], tidynhl:::prospects_info[, player_id]))

# Get players_info
players_info <- rbindlist(lapply(players_id, function(id) {

  print(id)

  Sys.sleep(runif(1, 1, 2))

  url <- paste0(tidynhl:::api_url, "people/", id)
  player <- fromJSON(content(GET(url), "text"), flatten=TRUE)$people %>%
    tidynhl:::create_data_table()

  if (!is.data.table(player)) {
    player <- data.table()
  }

  if (!"fullName" %in% colnames(player)) {
    player[, fullName:=NA_character_]
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
  if (!"shootsCatches" %in% colnames(player)) {
    player[, shootsCatches:=NA_character_]
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
    as.integer(str_sub(height, 1L, 1L))*12L+as.integer(str_trim(str_sub(height, -3L, -2L)))
  }

  data.table(
    player_id = id,
    player_name =  stringi::stri_trans_general(player$fullName, "Latin-ASCII"),
    player_birth_date = as.Date(player$birthDate),
    player_birth_city = player$birthCity,
    player_birth_stateprovince = player$birthStateProvince,
    player_birth_country = player$birthCountry,
    player_nationality = player$nationality,
    player_inches = height_inch(player$height),
    player_pounds = player$weight,
    player_hand = player$shootsCatches,
    player_position_code = player$primaryPosition.code,
    player_position_type = player$primaryPosition.type
  )

}))

# Set key
setkey(players_info, player_id)
