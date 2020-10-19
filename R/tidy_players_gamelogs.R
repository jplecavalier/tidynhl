#' Get a tidy dataset of players' game logs
#'
#' The function `tidy_players_gamelogs()` is meant to be a user-friendly way of getting the NHL game logs of selected players.
#'
#' @param players_id Integer vector indicating the NHL ID of players for whom the game logs will be returned.
#' @param seasons_id *(optional)* Character vector indicating the season for which the game logs will be returned. The required format for each character is
#'   'xxxxyyyy'. Default to `NULL` which will return the full career game logs for each player.
#' @param regular *(optional)* Logical indicating if the regular season schedule should be returned. Default to `TRUE`.
#' @param playoffs *(optional)* Logical indicating if the playoffs schedule should be returned. Default to `TRUE`.
#' @param tz *(optional)* Character specifying the timezone that should be used for datetime. Default to the user system timezone.
#' @param keep_id *(optional)* Logical indicating if the IDs of different dimensions should be returned. Default to `FALSE`.
#' @param return_datatable *(optional)* Logical indicating whether or not a data.table should be returned. Default to `TRUE` if the `data.table` package is
#'   attached in the active session.
#'
#' @examples
#' # Get the NHL career game logs of Vincent Lecavalier
#' head(tidy_players_gamelogs(8467329L))
#'
#' # Get the NHL 2010-11 playoffs statistics of both Vincent Lecavalier and Carey Price, keeping the IDs
#' tidy_players_gamelogs(
#'   players_id = c(8467329L, 8471679L),
#'   seasons_id = "20102011",
#'   regular    = FALSE,
#'   keep_id    = TRUE
#' )
#'
#' @export
tidy_players_gamelogs <- function(players_id, seasons_id=NULL, regular=TRUE, playoffs=TRUE, tz=Sys.timezone(), keep_id=FALSE, return_datatable=NULL) {

  if (is.null(return_datatable)) {
    return_datatable <- "data.table"%in%.packages()
  }

  # TO DO: Automatic seasons_id using tidy_players_stats()

  if (is.null(seasons_id)) {
    temp <- tidy_players_stats(players_id, regular, playoffs, TRUE, TRUE)[, .(seasons_id=list(unique(season_id))), .(player_id)]
    seasons_id <- data.table(player_id=players_id)[temp, seasons_id:=seasons_id, on=.(player_id)][, seasons_id]
    rm(temp)
  } else {
    seasons_id <- replicate(length(players_id), seasons_id, simplify=FALSE)
  }

  get_player_splits <- function(player_id, season_id, stats_modifier) {

    Sys.sleep(runif(1, 1, 2))

    url <- paste0(api_url, "people/", player_id, "/stats?stats=", stats_modifier, "&season=", season_id)
    splits <- jsonlite::fromJSON(httr::content(httr::GET(url), "text"), flatten=TRUE)$stats$splits[[1]] %>%
      create_data_table()

    splits[]

  }

  # TO DO: Add more complete parameters check

  gamelogs <- rbindlist(mapply(function(player_id, seasons_id) {

    rbindlist(lapply(seasons_id, function(season_id) {

      if (regular) {
        splits_regular <- get_player_splits(player_id, season_id, "gameLog")
      } else {
        splits_regular <- data.table()
      }

      if (playoffs) {
        splits_playoffs <- get_player_splits(player_id, season_id, "playoffGameLog")
      } else {
        splits_playoffs <- data.table()
      }

      splits <- rbindlist(list(splits_regular, splits_playoffs), fill=TRUE)

      if (!"game.gamePk" %in% colnames(splits)) {
        splits[, game.gamePk:=NA_integer_]
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
      if (!"stat.decision" %in% colnames(splits)) {
        splits[, stat.decision:=NA_character_]
      }
      if (!"stat.gamesStarted" %in% colnames(splits)) {
        splits[, stat.gamesStarted:=NA_integer_]
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

      if (splits[, .N==0L]) {
        player_id <- integer()
      }

      splits[, .(
        player_id = player_id,
        game_id = game.gamePk,
        team_id = team.id,
        skater_games = 1L,
        skater_goals = stat.goals,
        skater_assists = stat.assists,
        skater_points = stat.points,
        skater_plusminus = stat.plusMinus,
        skater_pim = stat.pim,
        skater_toi = convert_toi(stat.timeOnIce),
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
        goalie_games = 1L,
        goalie_started = stat.gamesStarted,
        goalie_wins = as.integer(stat.decision=="W"),
        goalie_losses = as.integer(stat.decision=="L"),
        goalie_ties = as.integer(stat.decision=="T"),
        goalie_ot = as.integer(stat.decision=="O"),
        goalie_shutouts = stat.shutouts,
        goalie_shotagainst = stat.shotsAgainst,
        goalie_goalagainst = stat.goalsAgainst,
        goalie_savepct = (stat.shotsAgainst-stat.goalsAgainst)/stat.shotsAgainst,
        goalie_gaa = stat.goalsAgainst/(convert_toi(stat.timeOnIce)/60),
        goalie_toi = convert_toi(stat.timeOnIce),
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

  }, player_id=players_id, seasons_id=seasons_id, SIMPLIFY=FALSE))

  # Split skaters/goalies for common stats
  gamelogs[, is_goalie:=!is.na(goalie_shotagainst)]
  gamelogs[is_goalie==TRUE, `:=`(
    skater_games = NA_integer_,
    skater_toi = NA_real_
  )]
  gamelogs[is_goalie==FALSE, `:=`(
    goalie_games = NA_integer_,
    goalie_toi = NA_real_
  )]

  # Clean data
  gamelogs[is_goalie==TRUE & is.na(goalie_started), goalie_started:=0L]
  gamelogs[is_goalie==TRUE & is.na(goalie_wins), `:=`(
    goalie_wins = 0L,
    goalie_losses = 0L,
    goalie_ties = 0L,
    goalie_ot = 0L
  )]
  gamelogs[, is_goalie:=NULL]

  schedule <- tidy_schedule(unique(unlist(seasons_id)), regular, playoffs, tz, TRUE, TRUE)
  schedule_away <- copy(schedule)
  setnames(schedule, c(outer(c("home", "away"), c("score", "team", "id"), paste, sep="_")), c(outer(c("team", "opponent"), c("score", "abbreviation", "id"), paste, sep="_")))
  setnames(schedule_away, c(outer(c("home", "away"), c("score", "team", "id"), paste, sep="_")), c(outer(c("opponent", "team"), c("score", "abbreviation", "id"), paste, sep="_")))
  schedule[, team_status:="home"]
  schedule_away[, team_status:="away"]
  schedule_mirror <- rbindlist(list(schedule, schedule_away), use.names=TRUE)
  rm(schedule, schedule_away)

  cols <- setdiff(colnames(schedule_mirror), c("game_id", "team_id"))
  gamelogs[schedule_mirror, (cols):=mget(cols), on=.(game_id, team_id)]
  rm(cols)

  gamelogs[players_info, player_name:=player_name, on=.(player_id)]

  setcolorder(gamelogs, c("player_id", "player_name", "season_id", "season_years", "season_type", "game_id", "game_datetime", "venue_name", "team_status",
                          "team_id", "team_abbreviation", "team_score", "opponent_score", "opponent_abbreviation", "opponent_id", "game_status", "game_nbot",
                          "game_shootout"))

  setorder(gamelogs, player_id, game_datetime)

  if (!keep_id) {
    gamelogs[, colnames(gamelogs)[grep("_id$", colnames(gamelogs))]:=NULL]
  }

  if (return_datatable) {
    gamelogs[]
  } else {
    as.data.frame(gamelogs)
  }

}
