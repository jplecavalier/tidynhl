test_that("tidy_players_stats() gives correct data", {

  # Single skater
  expect_snapshot_output(tidy_players_stats(8459426L))

  # Single goalie
  expect_snapshot_output(tidy_players_stats(8448382L))

  # Multiple skaters
  expect_snapshot_output(tidy_players_stats(c(8459426L, 8451715L)))

  # Multiple goalies
  expect_snapshot_output(tidy_players_stats(c(8448382L, 8462055L)))

  # Multiple players
  expect_snapshot_output(tidy_players_stats(c(8459426L, 8448382L)))

})
