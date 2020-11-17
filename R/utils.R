api_url <- "https://statsapi.web.nhl.com/api/v1/"

create_data_table <- function(data) {

  return_dt <- is.data.frame(data)

  data <- lapply(data, function(col){
    if (is.list(col)) {
      lapply(col, function(obs) {
        if (is.data.frame(obs)) {
          create_data_table(obs)
        } else {
          obs
        }
      })
    } else {
      col
    }
  })

  if (return_dt) {
    setDT(data)[]
  } else {
    data
  }

}

convert_toi <- function(toi) {
  sapply(strsplit(toi, ":"), function(x) {
    if (is.na(x[1])) {
      NA_real_
    } else {
      as.integer(x[1])+as.integer(x[2])/60L
    }
  })
}

season_years <- function(season_id) {
  ifelse(
    test = is.na(season_id),
    yes = NA_character_,
    no = paste0(
      substr(season_id, 1L, 4L),
      "-",
      substr(season_id, 7L, 8L)
    )
  )
}
