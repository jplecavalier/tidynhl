test_that("tidy_players_stats() gives correct data", {

  # Single skater
  expect_snapshot_output(tidy_players_stats(8471339L))

  # Single goalie
  expect_snapshot_output(tidy_players_stats(8466141L))

  # Multiple skaters
  expect_snapshot_output(tidy_players_stats(c(8471339L, 8470543L)))

  # Multiple goalies
  expect_snapshot_output(tidy_players_stats(c(8466141L, 8471715L)))

  # Multiple players
  expect_snapshot_output(tidy_players_stats(c(8471339L, 8466141L)))

})
