#' Get a tidy dataset of NHL players statistics
#'
#' The function `tidy_players_stats()` is meant to be a user-friendly way of getting the NHL year-by-year statistics of selected players.
#'
#' @param players_id Integer vector indicating the NHL ID of players for whom the statistics will be returned.
#' @param regular *(optional)* Logical indicating if the regular season statistics should be returned. Default to `TRUE`.
#' @param playoffs *(optional)* Logical indicating if the playoffs statistics should be returned. Default to `TRUE`.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be returned. Default to `TRUE` if the `data.table` package is
#'   attached in the active session.
#'
#' @examples
#' # Load the data.table package to easily manipulate the data
#' library(data.table)
#'
#' # Get the NHL career statistics of Vincent Lecavalier
#' stats_lecavalier <- tidy_players_stats(8467329L)
#'
#' # Print the column names
#' colnames(stats_lecavalier)
#'
#' # Print an excerpt of the data
#' stats_lecavalier[, .(season_years, season_type, team_abbreviation, skater_games, skater_points)]
#'
#' # Get the NHL career playoffs statistics of both Vincent Lecavalier and Carey Price, keeping the IDs
#' stats_playoffs_lecavalier_price <- tidy_players_stats(
#'   players_id = c(8467329L, 8471679L),
#'   regular    = FALSE,
#'   keep_id    = TRUE
#' )
#'
#' # Print the column names
#' colnames(stats_playoffs_lecavalier_price)
#'
#' # Print an excerpt of the data
#' stats_playoffs_lecavalier_price[, .(player_id, player_name, season_years, skater_points, goalie_savepct)]
#'
#' @export
tidy_players_stats <- function(players_id, regular=TRUE, playoffs=TRUE, keep_id=FALSE, return_datatable=NULL) {

  if (is.null(return_datatable)) {
    return_datatable <- "data.table"%in%.packages()
  }

  # TO DO: Add more complete parameters check

  stats <- rbindlist(lapply(players_id, function(id) {

    get_player_splits <- function(modifier, type) {

      Sys.sleep(runif(1, 1, 2))

      url <- paste0(api_url, "people/", id, "/stats?stats=", modifier)
      splits <- jsonlite::fromJSON(httr::content(httr::GET(url), "text"), flatten=TRUE)$stats$splits[[1]] %>%
        create_data_table()

      if (length(splits)==0L) {
        splits <- data.table(league.id=NA_integer_, season_type=NA_character_)
      }

      if (!"league.id" %in% colnames(splits)) {
        splits[, league.id:=NA_integer_]
      }

      splits[, season_type:=type]

      splits[]

    }

    if (regular) {
      splits_regular <- get_player_splits("yearByYear", "regular")
    } else {
      splits_regular <- data.table(league.id=NA_integer_, season_type="regular")
    }

    if (playoffs) {
      splits_playoffs <- get_player_splits("yearByYearPlayoffs", "playoffs")
    } else {
      splits_playoffs <- data.table(league.id=NA_integer_, season_type="playoffs")
    }

    splits <- rbindlist(list(splits_regular[league.id==133], splits_playoffs[league.id==133]), fill=TRUE)

    if (!"season" %in% colnames(splits)) {
      splits[, season:=NA_character_]
    }
    if (!"season_type" %in% colnames(splits)) {
      splits[, season_type:=NA_character_]
    }
    if (!"sequenceNumber" %in% colnames(splits)) {
      splits[, sequenceNumber:=NA_integer_]
    }
    if (!"team.id" %in% colnames(splits)) {
      splits[, team.id:=NA_integer_]
    }
    if (!"stat.games" %in% colnames(splits)) {
      splits[, stat.games:=NA_integer_]
    }
    if (!"stat.goals" %in% colnames(splits)) {
      splits[, stat.goals:=NA_integer_]
    }
    if (!"stat.assists" %in% colnames(splits)) {
      splits[, stat.assists:=NA_integer_]
    }
    if (!"stat.points" %in% colnames(splits)) {
      splits[, stat.points:=NA_integer_]
    }
    if (!"stat.plusMinus" %in% colnames(splits)) {
      splits[, stat.plusMinus:=NA_integer_]
    }
    if (!"stat.pim" %in% colnames(splits)) {
      splits[, stat.pim:=NA_integer_]
    }
    if (!"stat.shifts" %in% colnames(splits)) {
      splits[, stat.shifts:=NA_integer_]
    }
    if (!"stat.gameWinningGoals" %in% colnames(splits)) {
      splits[, stat.gameWinningGoals:=NA_integer_]
    }
    if (!"stat.overTimeGoals" %in% colnames(splits)) {
      splits[, stat.overTimeGoals:=NA_integer_]
    }
    if (!"stat.shots" %in% colnames(splits)) {
      splits[, stat.shots:=NA_integer_]
    }
    if (!"stat.blocked" %in% colnames(splits)) {
      splits[, stat.blocked:=NA_integer_]
    }
    if (!"stat.hits" %in% colnames(splits)) {
      splits[, stat.hits:=NA_integer_]
    }
    if (!"stat.evenTimeOnIce" %in% colnames(splits)) {
      splits[, stat.evenTimeOnIce:=NA_character_]
    }
    if (!"stat.powerPlayGoals" %in% colnames(splits)) {
      splits[, stat.powerPlayGoals:=NA_integer_]
    }
    if (!"stat.powerPlayPoints" %in% colnames(splits)) {
      splits[, stat.powerPlayPoints:=NA_integer_]
    }
    if (!"stat.powerPlayTimeOnIce" %in% colnames(splits)) {
      splits[, stat.powerPlayTimeOnIce:=NA_character_]
    }
    if (!"stat.shortHandedGoals" %in% colnames(splits)) {
      splits[, stat.shortHandedGoals:=NA_integer_]
    }
    if (!"stat.shortHandedPoints" %in% colnames(splits)) {
      splits[, stat.shortHandedPoints:=NA_integer_]
    }
    if (!"stat.shortHandedTimeOnIce" %in% colnames(splits)) {
      splits[, stat.shortHandedTimeOnIce:=NA_character_]
    }
    if (!"stat.timeOnIce" %in% colnames(splits)) {
      splits[, stat.timeOnIce:=NA_character_]
    }
    if (!"stat.gamesStarted" %in% colnames(splits)) {
      splits[, stat.gamesStarted:=NA_integer_]
    }
    if (!"stat.wins" %in% colnames(splits)) {
      splits[, stat.wins:=NA_integer_]
    }
    if (!"stat.losses" %in% colnames(splits)) {
      splits[, stat.losses:=NA_integer_]
    }
    if (!"stat.ties" %in% colnames(splits)) {
      splits[, stat.ties:=NA_integer_]
    }
    if (!"stat.ot" %in% colnames(splits)) {
      splits[, stat.ot:=NA_integer_]
    }
    if (!"stat.shutouts" %in% colnames(splits)) {
      splits[, stat.shutouts:=NA_integer_]
    }
    if (!"stat.shotsAgainst" %in% colnames(splits)) {
      splits[, stat.shotsAgainst:=NA_integer_]
    }
    if (!"stat.goalsAgainst" %in% colnames(splits)) {
      splits[, stat.goalsAgainst:=NA_integer_]
    }
    if (!"stat.evenShots" %in% colnames(splits)) {
      splits[, stat.evenShots:=NA_integer_]
    }
    if (!"stat.evenSaves" %in% colnames(splits)) {
      splits[, stat.evenSaves:=NA_integer_]
    }
    if (!"stat.powerPlayShots" %in% colnames(splits)) {
      splits[, stat.powerPlayShots:=NA_integer_]
    }
    if (!"stat.powerPlaySaves" %in% colnames(splits)) {
      splits[, stat.powerPlaySaves:=NA_integer_]
    }
    if (!"stat.shortHandedShots" %in% colnames(splits)) {
      splits[, stat.shortHandedShots:=NA_integer_]
    }
    if (!"stat.shortHandedSaves" %in% colnames(splits)) {
      splits[, stat.shortHandedSaves:=NA_integer_]
    }

    splits[, is_goalie:=!is.na(stat.wins)]

    if (splits[, .N==0L]) {
      id <- integer()
    }

    splits[, .(
      player_id = id,
      season_id = season,
      season_years = season_years(season),
      sequence = sequenceNumber,
      season_type = season_type,
      team_id = team.id,
      skater_games = ifelse(is_goalie, rep(NA_integer_, .N), stat.games),
      skater_goals = stat.goals,
      skater_assists = stat.assists,
      skater_points = stat.points,
      skater_plusminus = stat.plusMinus,
      skater_pim = stat.pim,
      skater_toi = ifelse(is_goalie, rep(NA_real_, .N), convert_toi(stat.timeOnIce)),
      skater_shifts = stat.shifts,
      skater_gwg = stat.gameWinningGoals,
      skater_otg = stat.overTimeGoals,
      skater_shots = stat.shots,
      skater_blocked = stat.blocked,
      skater_hits = stat.hits,
      skater_ev_goals = stat.goals-stat.powerPlayGoals-stat.shortHandedGoals,
      skater_ev_assists = stat.assists-(stat.powerPlayPoints-stat.powerPlayGoals)-(stat.shortHandedPoints-stat.shortHandedGoals),
      skater_ev_points = stat.points-stat.powerPlayPoints-stat.shortHandedPoints,
      skater_ev_toi = convert_toi(stat.evenTimeOnIce),
      skater_pp_goals = stat.powerPlayGoals,
      skater_pp_assists = stat.powerPlayPoints-stat.powerPlayGoals,
      skater_pp_points = stat.powerPlayPoints,
      skater_pp_toi = convert_toi(stat.powerPlayTimeOnIce),
      skater_pk_goals = stat.shortHandedGoals,
      skater_pk_assists = stat.shortHandedPoints-stat.shortHandedGoals,
      skater_pk_points = stat.shortHandedPoints,
      skater_pk_toi = convert_toi(stat.shortHandedTimeOnIce),
      goalie_games = ifelse(is_goalie, stat.games, rep(NA_integer_, .N)),
      goalie_started = stat.gamesStarted,
      goalie_wins = stat.wins,
      goalie_losses = stat.losses,
      goalie_ties = stat.ties,
      goalie_ot = stat.ot,
      goalie_shutouts = stat.shutouts,
      goalie_shotagainst = stat.shotsAgainst,
      goalie_goalagainst = stat.goalsAgainst,
      goalie_savepct = (stat.shotsAgainst-stat.goalsAgainst)/stat.shotsAgainst,
      goalie_gaa = stat.goalsAgainst/(convert_toi(stat.timeOnIce)/60),
      goalie_toi = ifelse(is_goalie, convert_toi(stat.timeOnIce), rep(NA_real_, .N)),
      goalie_ev_shotagainst = stat.evenShots,
      goalie_ev_goalagainst = stat.evenShots-stat.evenSaves,
      goalie_ev_savepct = stat.evenSaves/stat.evenShots,
      goalie_pp_shotagainst = stat.powerPlayShots,
      goalie_pp_goalagainst = stat.powerPlayShots-stat.powerPlaySaves,
      goalie_pp_savepct = stat.powerPlaySaves/stat.powerPlayShots,
      goalie_pk_shotagainst = stat.shortHandedShots,
      goalie_pk_goalagainst = stat.shortHandedShots-stat.shortHandedSaves,
      goalie_pk_savepct = stat.shortHandedSaves/stat.shortHandedShots
    )]

  }))

  teams_meta <- tidy_teams_meta(active_only = FALSE, keep_id = TRUE, return_datatable = TRUE)
  stats[teams_meta, team_abbreviation:=team_abbreviation, on=.(team_id)]
  stats[players_info, player_name:=player_name, on=.(player_id)]

  setcolorder(stats, c("player_id", "player_name", "season_id", "season_years", "season_type", "team_id", "team_abbreviation"))
  setorder(stats, player_id, season_id, -season_type, sequence)
  stats[, sequence:=NULL]

  if (!keep_id) {
    stats[, colnames(stats)[grep("_id$", colnames(stats))]:=NULL]
  }

  if (return_datatable) {
    stats[]
  } else {
    as.data.frame(stats)
  }

}
