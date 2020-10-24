#' Get NHL players ID
#'
#' The function `get_players_id()` is meant to be a user-friendly way of getting NHL players ID using their name, date of birth and/or primary position type.
#'
#' @param players_name Character vector representing the name of the players
#' @param players_dob *(optional)* Date vector representing the date of birth of the players
#' @param players_position_type *(optional)* Character vector representing the position type (F, D or G) of the players
#'
#' @examples
#' # Get the NHL ID of Vincent Lecavalier
#' get_players_id("Vincent Lecavalier")
#'
#' # Get the NHL ID of Vincent Lecavalier and Josh Anderson
#' get_players_id(c("Vincent Lecavalier", "Josh Anderson"))
#'
#' # Get the NHL ID of Vincent Lecavalier and Josh Anderson (born May 7, 1994)
#' get_players_id(
#'   players_name = c("Vincent Lecavalier", "Josh Anderson"),
#'   players_dob = as.Date(c(NA, "1994-05-07"))
#' )
#'
#' @export
get_players_id <- function(players_name, players_dob=NULL, players_position_type=NULL) {

  if (is.null(players_dob)) {
    players_dob <- rep(as.Date(NA), length(players_name))
  }

  if (is.null(players_position_type)) {
    players_position_type <- rep(NA_character_, length(players_name))
  }

  players_info <- copy(players_info[, .(
    name = tolower(gsub("[^a-zA-Z]", "", stringi::stri_trans_general(player_name, "Latin-ASCII"))),
    dob = gsub("-", "", as.character(player_birth_date)),
    position = player_position_type,
    id = player_id
  )])

  mapply(function(player_name, player_dob, player_position_type) {

    player_name_key <- tolower(gsub("[^a-zA-Z]", "", stringi::stri_trans_general(player_name, "Latin-ASCII")))
    player_dob_key <- gsub("-", "", as.character(player_dob))

    if (is.na(player_dob) & is.na(player_position_type)) {
      player_id <- players_info[name==player_name_key, id]
    } else if (!is.na(player_dob) & is.na(player_position_type)) {
      player_id <- players_info[name==player_name_key & dob==player_dob_key, id]
    } else if (is.na(player_dob) & !is.na(player_position_type)) {
      player_id <- players_info[name==player_name_key & position==player_position_type, id]
    } else {
      player_id <- players_info[name==player_name_key & dob==player_dob_key & position==player_position_type, id]
    }

    if (length(player_id)==0L) {

      warning(paste0(
        "no ID matching for ",
        player_name,
        ", NA returned"
      ))

      player_id <- NA_character_

    } else if (length(player_id)>1L) {

      warning(paste0(
        "multiple IDs matching for ",
        player_name,
        " (",
        paste(player_id, collapse = ", "),
        "), highest (most recent) was returned"
      ))

      player_id <- player_id[length(player_id)]

    }

    player_id

  }, player_name=players_name, player_dob=players_dob, player_position_type=players_position_type, USE.NAMES=FALSE)

}
