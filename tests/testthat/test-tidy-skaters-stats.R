test_that("tidy_skaters_stats() gives correct data", {

  # Single skater
  expect_snapshot_output(tidy_skaters_stats(8471339L))

  # Multiple skaters
  expect_snapshot_output(tidy_skaters_stats(c(8471339L, 8470543L)))

})
