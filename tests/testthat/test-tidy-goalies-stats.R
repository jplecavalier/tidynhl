test_that("tidy_goalies_stats() gives correct data", {

  # Single goalie
  expect_snapshot_output(tidy_goalies_stats(8466141L))

  # Multiple goalies
  expect_snapshot_output(tidy_goalies_stats(c(8466141L, 8471715L)))

})
