factor_event_types <- function(characters) {

  factor(
    x = characters,
    levels = c("blocked_shot", "faceoff", "giveaway", "goal", "hit", "missed_shot", "penalty",
               "shot", "takeaway")
  )

}

factor_period_types <- function(characters) {

  factor(
    x = characters,
    levels = c("regular", "overtime", "shootout")
  )

}

factor_goal_strengths <- function(characters) {

  factor(
    x = characters,
    levels = c("even", "ppg", "shg", "so")
  )

}

factor_shot_types <- function(characters) {

  factor(
    x = characters,
    levels = c("Backhand", "Deflected", "Slap Shot", "Snap Shot", "Tip-In", "Wrist Shot")
  )

}
