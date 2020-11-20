test_that("get_players_id() works using only players_name", {

  # Single element
  expect_equal(get_players_id("Maurice Richard"), 8448321L)

  # Vectorized
  expect_equal(
    object   = get_players_id(c("Saku Koivu", "Martin St-Louis", "Martin St. Louis")),
    expected = c(8459442L, 8466378L, 8466378L)
  )

})

test_that("get_players_id() works using players_name and players_dob", {

  # Single element
  expect_equal(get_players_id(
    players_name = "Maurice Richard",
    players_dob  = as.Date("1921-08-04")
  ), 8448321L)

  # Vectorized
  expect_equal(
    object   = get_players_id(
      players_name = c("Saku Koivu", "Martin St-Louis", "Martin St. Louis"),
      players_dob  = as.Date(c("1974-11-23", "1975-06-18", "1975-06-18"))
    ),
    expected = c(8459442L, 8466378L, 8466378L)
  )

})

test_that("get_players_id() works using players_name and players_position_type", {

  # Single element
  expect_equal(get_players_id(
    players_name           = "Maurice Richard",
    players_position_type  = "F"
  ), 8448321L)

  # Vectorized
  expect_equal(
    object   = get_players_id(
      players_name          = c("Saku Koivu", "Martin St-Louis", "Martin St. Louis"),
      players_position_type = c("F", "F", "F")
    ),
    expected = c(8459442L, 8466378L, 8466378L)
  )

})

test_that("get_players_id() works using all parameters", {

  # Single element
  expect_equal(get_players_id(
    players_name           = "Maurice Richard",
    players_dob            = as.Date("1921-08-04"),
    players_position_type  = "F"
  ), 8448321L)

  # Vectorized
  expect_equal(
    object   = get_players_id(
      players_name          = c("Saku Koivu", "Martin St-Louis", "Martin St. Louis"),
      players_dob           = as.Date(c("1974-11-23", "1975-06-18", "1975-06-18")),
      players_position_type = c("F", "F", "F")
    ),
    expected = c(8459442L, 8466378L, 8466378L)
  )

})

test_that("get_players_id() returns warning for no ID matching", {

  expect_warning(out <- get_players_id("J.P. Le Cavalier"), "no ID")
  expect_equal(out, NA_integer_)

})

test_that("get_players_id() returns warning for multiple IDs matching", {

  expect_warning(out <- get_players_id("Sebastian Aho"), "multiple IDs")
  expect_equal(out, 8480222L)

})
