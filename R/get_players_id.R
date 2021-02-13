#' Get NHL players ID
#'
#' The function `get_players_id()` is meant to be a user-friendly way of getting NHL players ID
#' using their name, date of birth and/or primary position type.
#'
#' @param players_name Character vector representing the name of the players
#' @param players_dob *(optional)* Date vector representing the date of birth of the players
#' @param players_position_type *(optional)* Character vector representing the position type (F, D,
#'   or G) of the players
#'
#' @examples
#' # Get the NHL ID of Vincent Lecavalier
#' get_players_id("Vincent Lecavalier")
#'
#' # Get the NHL ID of both Vincent Lecavalier and Josh Anderson
#' get_players_id(c("Vincent Lecavalier", "Josh Anderson"))
#'
#' # Get the NHL ID of Josh Anderson born May 7, 1994
#' get_players_id("Josh Anderson", players_dob = as.Date("1994-05-07"))
#'
#' @export
get_players_id <- function(
  players_name,
  players_dob = NULL,
  players_position_type = NULL
) {

  assert_players_name(players_name)
  if (!is.null(players_dob)) {
    assert_players_dob(players_dob, length(players_name))
  }
  if (!is.null(players_position_type)) {
    assert_players_position_type(players_position_type, length(players_name))
  }

  if (length(players_name) == 0L) {
    return(integer())
  }

  players <- data.table(
    name = players_name,
    key_name = tolower(gsub("[^a-zA-Z]", "",
                            stringi::stri_trans_general(players_name, "Latin-ASCII")))
  )
  if (!is.null(players_dob)) {
    players[, key_dob := gsub("-", "", as.character(players_dob))]
  }
  if (!is.null(players_position_type)) {
    players[, key_position := players_position_type]
  }
  key_cols <- setdiff(colnames(players), "name")

  if (!exists("players_keys", envir = data)) {
    load_players_keys()
  }
  players_keys <- get("players_keys", envir = data)
  players_keys <- players_keys[, .(ids = list(id)), mget(key_cols)]
  players[players_keys, ids := ids, on = key_cols]

  players[, mapply(function(ids, name) {

    if (length(ids) == 0L) {

      warning(paste0("no ID matching for ", name, ", NA returned"))
      NA_integer_

    } else if (length(ids) > 1L) {

      warning(paste0(
        "multiple IDs matching for ", name,
        " (", paste(ids, collapse = ", "), "), highest (most recent) was returned"
      ))
      max(ids)

    } else {

      ids

    }

  }, ids = ids, name = name)]

}

load_players_keys <- function() {

  if (!exists("players_meta", envir = data)) {
    load_players_meta()
  }
  players_meta <- get("players_meta", envir = data)

  players_keys <- players_meta[, .(
    id = player_id,
    key_name = tolower(gsub("[^a-zA-Z]", "",
                            stringi::stri_trans_general(player_name, "Latin-ASCII"))),
    key_dob = gsub("-", "", as.character(player_birth_date)),
    key_position = player_position_type
  )]

  assign("players_keys", players_keys, data)

}
