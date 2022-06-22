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

  lookup <- rbindlist(list(
    list(old = "Backhand", new = "backhand"),
    list(old = "Deflected", new = "deflected"),
    list(old = "Slap Shot", new = "slap"),
    list(old = "Snap Shot", new = "snap"),
    list(old = "Tip-In", new = "tip-in"),
    list(old = "Wrist Shot", new = "wrist")
  ))

  characters <- data.table(old = characters)
  characters[lookup, new := new, on = .(old)]

  factor(
    x = characters[, new],
    levels = lookup[, new]
  )

}

factor_shot_results <- function(characters) {

  lookup <- rbindlist(list(
    list(old = "GOAL", new = "goal"),
    list(old = "SHOT", new = "shot"),
    list(old = "BLOCKED_SHOT", new = "blocked"),
    list(old = "MISSED_SHOT", new = "missed")
  ))

  characters <- data.table(old = characters)
  characters[lookup, new := new, on = .(old)]

  factor(
    x = characters[, new],
    levels = lookup[, new]
  )

}
