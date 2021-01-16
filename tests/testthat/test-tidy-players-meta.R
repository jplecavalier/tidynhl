test_that("tidy_players_meta() gives correct informations", {

  expect_snapshot_output(tidy_players_meta(c(8471679L, 8448782L, 8448960L)))

})

test_that("tidy_players_meta() internal parameter works", {

  expect_equal(
    object = setdiff(
      colnames(tidy_players_meta(c(8471679L, 8448782L, 8448960L), internal=FALSE)),
      colnames(tidy_players_meta(c(8471679L, 8448782L, 8448960L), internal=TRUE))
    ),
    expected = c("team_abbreviation", "player_number", "player_active", "player_alt_captain", "player_captain", "player_rookie", "player_roster_status")
  )

})


test_that("tidy_players_meta() keep_id parameter works", {

  expect_length(grep("_id$", names(tidy_players_meta(c(8471679L, 8448782L, 8448960L)))), 0L)
  expect_equal(
    object   = tidy_players_meta(c(8471679L, 8448782L, 8448960L), keep_id=TRUE)$player_id,
    expected = c(8471679L, 8448782L, 8448960L)
  )

})

test_that("tidy_players_meta() return_datatable parameter works", {

  expect_s3_class(tidy_players_meta(c(8471679L, 8448782L, 8448960L), return_datatable=FALSE), "data.frame")
  expect_s3_class(tidy_players_meta(c(8471679L, 8448782L, 8448960L), return_datatable=TRUE), "data.table")

})
