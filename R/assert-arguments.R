assert_drafts_year <- function(drafts_year) {

  if (is.numeric(drafts_year)) {

    drafts_year <- unique(drafts_year)

    if (all(as.integer(drafts_year) == drafts_year, na.rm = TRUE)) {

      drafts_year_na <- which(is.na(drafts_year))
      if (length(drafts_year_na) > 0L) {
        warning("NAs were detected and dropped in the 'drafts_year' argument")
        drafts_year <- drafts_year[-drafts_year_na]
      }

      if (!exists("drafts", envir = data)) {
        load_drafts()
      }
      drafts <- get("drafts", envir = data)

      missing_drafts <- drafts[, setdiff(drafts_year, unique(draft_year))]
      if (length(missing_drafts) > 0L) {
        warning(paste(
          "the following elements of the argument 'drafts_year' were dropped since not found:",
          paste(missing_drafts, collapse = ", ")
        ))
      }
      drafts_year <- setdiff(drafts_year, missing_drafts)

      return(as.integer(drafts_year))

    }

  }

  stop("argument 'drafts_year' should be a vector of integers")

}

assert_seasons_id <- function(seasons_id) {

  if (is.character(seasons_id)) {

    seasons_id <- unique(seasons_id)

    seasons_id_na <- which(is.na(seasons_id))
    if (length(seasons_id_na) > 0L) {
      warning("NAs were detected and dropped in the 'seasons_id' argument")
      seasons_id <- seasons_id[-seasons_id_na]
    }

    if (!exists("seasons_meta", envir = data)) {
      load_seasons_meta()
    }
    seasons_meta <- get("seasons_meta", envir = data)

    missing_seasons <- seasons_meta[, setdiff(seasons_id, season_id)]
    if (length(missing_seasons) > 0L) {
      warning(paste(
        "the following elements of the argument 'seasons_id' were dropped since not identified as",
        "valid NHL season IDs:",
        paste(missing_seasons, collapse = ", ")
      ))
      seasons_id <- setdiff(seasons_id, missing_seasons)
    }

    return(seasons_id)

  }

  stop("argument 'seasons_id' should be a vector of characters")

}

assert_players_id <- function(players_id) {

  if (is.numeric(players_id)) {

    players_id <- unique(players_id)

    if (all(as.integer(players_id) == players_id, na.rm = TRUE)) {

      players_id_na <- which(is.na(players_id))
      if (length(players_id_na) > 0L) {
        warning("NAs were detected and dropped in the 'players_id' argument")
        players_id <- players_id[-players_id_na]
      }

      if (!exists("players_meta", envir = data)) {
        load_players_meta()
      }
      players_meta <- get("players_meta", envir = data)

      missing_players <- players_meta[, setdiff(players_id, player_id)]
      if (length(missing_players) > 0L) {
        warning(paste(
          "the following elements of the argument 'players_id' were dropped since not identified",
          "as valid NHL player IDs:",
          paste(missing_players, collapse = ", ")
        ))
      }
      players_id <- setdiff(players_id, missing_players)

      return(as.integer(players_id))

    }

  }

  stop("argument 'players_id' should be a vector of integers")

}

assert_skaters_id <- function(players_id) {

  players_id <- assert_players_id(players_id)
  players_meta <- get("players_meta", envir = data)

  non_skaters_id <- players_meta[player_id %in% players_id & player_position_type == "G", player_id]
  if (length(non_skaters_id) > 0L) {
    warning(paste(
      "the following elements of the argument 'players_id' were dropped since not identified as",
      "skaters:",
      paste(non_skaters_id, collapse = ", ")
    ))
    players_id <- setdiff(players_id, non_skaters_id)
  }

  players_id

}

assert_goalies_id <- function(players_id) {

  players_id <- assert_players_id(players_id)
  players_meta <- get("players_meta", envir = data)

  non_goalies_id <- players_meta[player_id %in% players_id & player_position_type != "G", player_id]
  if (length(non_goalies_id) > 0L) {
    warning(paste(
      "the following elements of the argument 'players_id' were dropped since not identified as",
      "goalies:",
      paste(non_goalies_id, collapse = ", ")
    ))
    players_id <- setdiff(players_id, non_goalies_id)
  }

  players_id

}

assert_active_only <- function(active_only) {

  if (is.logical(active_only) & !anyNA(active_only) & length(active_only) == 1L) {
    return(NULL)
  }

  stop("argument 'active_only' should be one of 'TRUE' or 'FALSE'")

}

assert_expand_periods <- function(expand_periods) {

  if (is.logical(expand_periods) & !anyNA(expand_periods) & length(expand_periods) == 1L) {
    return(NULL)
  }

  stop("argument 'expand_periods' should be one of 'TRUE' or 'FALSE'")

}

assert_regular <- function(regular) {

  if (is.logical(regular) & !anyNA(regular) & length(regular) == 1L) {
    return(NULL)
  }

  stop("argument 'regular' should be one of 'TRUE' or 'FALSE'")

}

assert_playoffs <- function(playoffs) {

  if (is.logical(playoffs) & !anyNA(playoffs) & length(playoffs) == 1L) {
    return(NULL)
  }

  stop("argument 'playoffs' should be one of 'TRUE' or 'FALSE'")

}

assert_regular_playoffs <- function(regular, playoffs) {

  assert_regular(regular)
  assert_playoffs(playoffs)

  if (regular | playoffs) {
    return(NULL)
  }

  stop("at least one of arguments 'regular' or 'playoffs' should be 'TRUE'")

}

assert_tz <- function(tz) {

  if (is.character(tz) & !anyNA(tz) & length(tz) == 1L) {

    if (!(tz %in% OlsonNames())) {
      stop("argument 'tz' should be a valid time zone, see OlsonNames() for valid entries")
    }

    return(NULL)

  }

  stop("argument 'tz' should be a character of length 1")

}

assert_keep_id <- function(keep_id) {

  if (is.logical(keep_id) & !anyNA(keep_id) & length(keep_id) == 1L) {
    return(NULL)
  }

  stop("argument 'keep_id' should be one of 'TRUE' or 'FALSE'")

}

assert_return_datatable <- function(return_datatable) {

  if (is.logical(return_datatable) & !anyNA(return_datatable) & length(return_datatable) == 1L) {
    return(NULL)
  }

  stop("argument 'return_datatable' should be one of 'TRUE' or 'FALSE'")

}

assert_players_name <- function(players_name) {

  if (is.character(players_name) & !anyNA(players_name)) {
    return(NULL)
  }

  stop("argument 'players_name' should be a vector of characters")

}

assert_players_dob <- function(players_dob, length) {

  if (class(players_dob) == "Date" & !anyNA(players_dob) & length(players_dob) == length) {
    return(NULL)
  }

  stop(paste(
    "argument 'players_dob' should be a vector of dates having the same length as parameter",
    "'players_name' and containing no NA"
  ))

}

assert_players_position_type <- function(players_position_type, length) {

  if (is.character(players_position_type) & !anyNA(players_position_type) &
      length(players_position_type) == length) {
    if (all(players_position_type %in% c("F", "D", "G"))) {
      return(NULL)
    }
  }

  stop(paste(
    "argument 'players_position_type' should be a vector of characters (F, D, or G) having the",
    "same length as parameter 'players_name' and containing no NA"
  ))

}
