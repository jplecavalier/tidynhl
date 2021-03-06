#' Get a tidy dataset of NHL goalies statistics
#'
#' The function `tidy_goalies_stats()` is meant to be a user-friendly way of getting the NHL
#' year-by-year statistics of selected goalies
#'
#' @param players_id Integer vector indicating the NHL ID of goalies for whom the statistics will be
#'   returned.
#' @param regular *(optional)* Logical indicating if the regular season statistics should be
#'   returned. Default to `TRUE`.
#' @param playoffs *(optional)* Logical indicating if the playoffs statistics should be returned.
#'   Default to `TRUE`.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be
#'   returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be
#'   returned. Default can be set globally with `options("tidynhl.data.table")`.
#'
#' @examples
#' # Allowing large outputs for the pkgdown website
#' options(width = 1000L)
#'
#' # Get the NHL career statistics of Roberto Luongo
#' tidy_goalies_stats(8466141L)
#'
#' # Get the NHL career playoffs statistics of both Roberto Luongo and Corey Crawford, keeping the
#' # IDs
#' tidy_goalies_stats(c(8466141L, 8470645L), regular = FALSE, keep_id = TRUE)
#'
#' @export
tidy_goalies_stats <- function(
  players_id,
  regular = TRUE,
  playoffs = TRUE,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
) {

  players_id <- assert_goalies_id(players_id)

  assert_regular_playoffs(regular, playoffs)
  assert_keep_id(keep_id)
  assert_return_datatable(return_datatable)

  if (length(players_id) == 0L) {
    goalies_stats <- data.table(
      player_id = integer(),
      season_type = character()
    )
  } else {
    goalies_stats <- data.table(
      player_id = rep(players_id, each = 2L),
      season_type = c(ifelse(regular, "regular", NA_character_),
                      ifelse(playoffs, "playoffs", NA_character_))
    )[!is.na(season_type)]
  }

  goalies_stats[, url := paste0(
    "people/", player_id,
    "/stats?stats=", ifelse(season_type == "regular", "yearByYear", "yearByYearPlayoffs")
  )]

  goalies_stats[, api_return := get_stats_api(url)]

  goalies_stats <- goalies_stats[, rbindlist(mapply(
    FUN = function(player_id, season_type, api_return) {

      splits <- create_data_table(api_return$stats$splits[[1]])
      splits[, `:=`(
        player_id = player_id,
        season_type = season_type
      )]

      splits[]

    },
    player_id = player_id,
    season_type = season_type,
    api_return = api_return,
    SIMPLIFY = FALSE
  ), fill = TRUE)]

  validate_columns(goalies_stats, list(
    player_id = NA_integer_,
    season_type = NA_character_,
    league.id = NA_integer_,
    season = NA_character_,
    sequenceNumber = NA_integer_,
    team.id = NA_integer_,
    stat.games = NA_integer_,
    stat.gamesStarted = NA_integer_,
    stat.wins = NA_integer_,
    stat.losses = NA_integer_,
    stat.ties = NA_integer_,
    stat.ot = NA_integer_,
    stat.shutouts = NA_integer_,
    stat.shotsAgainst = NA_integer_,
    stat.goalsAgainst = NA_integer_,
    stat.timeOnIce = NA_character_,
    stat.evenShots = NA_integer_,
    stat.evenSaves = NA_integer_,
    stat.powerPlayShots = NA_integer_,
    stat.powerPlaySaves = NA_integer_,
    stat.shortHandedShots = NA_integer_,
    stat.shortHandedSaves = NA_integer_
  ))

  goalies_stats <- goalies_stats[league.id == 133L, .(
    player_id = player_id,
    season_id = season,
    season_years = season_years(season),
    sequence = sequenceNumber,
    season_type = season_type,
    team_id = team.id,
    goalie_games = stat.games,
    goalie_started = stat.gamesStarted,
    goalie_wins = stat.wins,
    goalie_losses = stat.losses,
    goalie_ties = stat.ties,
    goalie_ot = stat.ot,
    goalie_shutouts = stat.shutouts,
    goalie_shotagainst = stat.shotsAgainst,
    goalie_goalagainst = stat.goalsAgainst,
    goalie_savepct = (stat.shotsAgainst - stat.goalsAgainst) / stat.shotsAgainst,
    goalie_gaa = stat.goalsAgainst / (convert_toi(stat.timeOnIce) / 60),
    goalie_toi = convert_toi(stat.timeOnIce),
    goalie_ev_shotagainst = stat.evenShots,
    goalie_ev_goalagainst = stat.evenShots - stat.evenSaves,
    goalie_ev_savepct = stat.evenSaves / stat.evenShots,
    goalie_pp_shotagainst = stat.powerPlayShots,
    goalie_pp_goalagainst = stat.powerPlayShots - stat.powerPlaySaves,
    goalie_pp_savepct = stat.powerPlaySaves / stat.powerPlayShots,
    goalie_pk_shotagainst = stat.shortHandedShots,
    goalie_pk_goalagainst = stat.shortHandedShots - stat.shortHandedSaves,
    goalie_pk_savepct = stat.shortHandedSaves / stat.shortHandedShots
  )]

  goalies_stats[is.na(goalie_ties), goalie_ties := 0L]
  goalies_stats[is.na(goalie_ot), goalie_ot := 0L]

  teams_meta <- get("teams_meta", envir = data)
  goalies_stats[teams_meta, team_abbreviation := team_abbreviation, on = .(team_id)]

  players_meta <- get("players_meta", envir = data)
  goalies_stats[players_meta, player_name := player_name, on = .(player_id)]

  setcolorder(goalies_stats, c("player_id", "player_name", "season_id", "season_years",
                               "season_type", "team_id", "team_abbreviation"))
  setorder(goalies_stats, player_id, season_id, -season_type, sequence)
  goalies_stats[, sequence := NULL]

  if (!keep_id) {
    drop_ids(goalies_stats)
  }

  add_copyright(goalies_stats)

  if (return_datatable) {
    goalies_stats[]
  } else {
    as.data.frame(goalies_stats)
  }

}
