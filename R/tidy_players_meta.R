#' Get a tidy dataset of NHL players metadata
#'
#' The function `tidy_players_meta()` is meant to be a user-friendly way of getting metadata about
#' the selected players.
#'
#' @param players_id *(optional)* Integer vector indicating the NHL ID of players for whom the
#'   metadata will be returned. Default to `NULL` which will return every players in the NHL
#'   database.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get metadata of every players in the NHL database
#' tidy_players_meta()
#'
#' # Get metadata about both Vincent Lecavalier and Carey Price, keeping the IDs
#' tidy_players_meta(players_id = c(8467329L, 8471679L), keep_id = TRUE)
#'
#' @export
tidy_players_meta <- function(
  players_id = NULL,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  if (!is.null(players_id)) {
    error <- FALSE
    if (!is.numeric(players_id) | sum(is.na(players_id)) > 0L | length(players_id) == 0L) {
      error <- TRUE
    } else {
      if (sum(as.integer(players_id) != players_id) > 0L) {
        error <- TRUE
      }
    }
    if (error) {
      stop("argument 'players_id' should be a vector of integers")
    }
  }

  if (!is.logical(keep_id) | is.na(keep_id) | length(keep_id) != 1L) {
    stop("argument 'keep_id' should be one of 'TRUE' or 'FALSE'")
  }

  if (!is.logical(return_datatable) | is.na(return_datatable) | length(return_datatable) != 1L) {
    stop("argument 'return_datatable' should be one of 'TRUE' or 'FALSE'")
  }

  if (!exists("players_meta", envir = data)) {
    load_players_meta()
  }
  players_meta <- copy(get("players_meta", envir = data))

  if (!is.null(players_id)) {
    players_meta <- players_meta[player_id %in% players_id]
  }

  missing_ids <- setdiff(players_id, players_meta[, player_id])
  if (length(missing_ids) > 0L) {

    warning(paste0(
      "the following IDs are unknown: ",
      paste(missing_ids, collapse = ", ")
    ))

  }

  if (!keep_id) {
    drop_ids(players_meta)
  }

  add_copyright(players_meta)

  if (return_datatable) {
    players_meta[]
  } else {
    as.data.frame(players_meta)
  }

}

load_players_meta <- function() {

  players_meta <- create_data_table(get_records_api("player")[[1]]$data)

  validate_columns(players_meta, list(
    id = NA_integer_,
    fullName = NA_character_,
    sweaterNumber = NA_integer_,
    birthDate = NA_character_,
    birthCity = NA_character_,
    birthStateProvince = NA_character_,
    birthCountry = NA_character_,
    nationality = NA_character_,
    deceased = NA,
    dateOfDeath = NA_character_,
    height = NA_integer_,
    weight = NA_integer_,
    isRookie = NA_character_,
    inHockeyHof = NA,
    hofInductionYear = NA_integer_,
    inTop100Alltime = NA_integer_,
    shootsCatches = NA_character_,
    onRoster = NA_character_,
    currentTeamId = NA_integer_,
    position = NA_character_
  ))

  players_meta <- players_meta[, .(
    player_id = id,
    player_name = fullName,
    player_number = sweaterNumber,
    player_birth_date = as.Date(birthDate),
    player_birth_city = birthCity,
    player_birth_stateprovince = birthStateProvince,
    player_birth_country = birthCountry,
    player_nationality = nationality,
    player_dead = deceased,
    player_death_date = as.Date(dateOfDeath),
    player_inches = height,
    player_pounds = weight,
    player_rookie = isRookie == "Y",
    player_hof = inHockeyHof,
    player_hof_year = hofInductionYear,
    player_nhl_100 = inTop100Alltime == 1L,
    player_hand = shootsCatches,
    player_roster_status = onRoster,
    team_id = currentTeamId,
    player_position = position
  )]

  players_meta[, player_active := FALSE]
  players_meta[!is.na(team_id), player_active := TRUE]

  players_meta[, player_position_type := player_position]
  players_meta[player_position %in% c("L", "C", "R"), player_position_type := "F"]

  teams_meta <- tidy_teams_meta(active_only = FALSE, keep_id = TRUE, return_datatable = TRUE)
  players_meta[teams_meta, team_abbreviation := team_abbreviation, on = .(team_id)]

  setcolorder(players_meta, c(
    "player_id", "player_name", "player_active", "player_roster_status", "player_number",
    "player_position", "player_position_type", "player_nationality", "player_birth_country",
    "player_birth_stateprovince", "player_birth_city", "player_birth_date", "player_dead",
    "player_death_date", "player_inches", "player_pounds", "player_hand", "player_rookie",
    "player_hof", "player_hof_year", "player_nhl_100", "team_id", "team_abbreviation"
  ))
  setorder(players_meta, player_id)

  assign("players_meta", players_meta, data)

}
