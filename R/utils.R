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

validate_columns <- function(data, columns) {

  missing <- !(names(columns) %in% colnames(data))
  missing_columns <- columns[which(missing)]
  if (length(missing_columns) > 0L) {
    present_columns <- columns[-which(missing)]
  } else {
    present_columns <- columns
  }

  mapply(function(name, value) {

    class_expected <- class(value)
    class_actual <- class(data[, get(name)])

    mismatch <- FALSE
    if (length(class_expected) != length(class_actual)) {
      mismatch <- TRUE
    } else {
      if (sum(class_expected != class_actual) > 0L) {
        mismatch <- TRUE
      }
    }

    if (mismatch) {
      warning(paste0(
        "actual class for column '",
        name,
        "' is [",
        paste(paste0("'", class_actual, "'"), collapse = ", "),
        "] while expected class is [",
        paste(paste0("'", class_expected, "'"), collapse = ", "),
        "], please open an issue with a reprex throwing this warning"
      ))
    }

  }, name = names(present_columns), value = present_columns)

  if (length(missing_columns) > 0L) {
    data[, names(missing_columns) := lapply(missing_columns, rep, .N)]
  }

}

convert_toi <- function(toi) {

  if (length(toi)==0L) {
    return(numeric(0L))
  }

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

add_copyright <- function(object) {

  setattr(object, "copyright", paste(
    "NHL and the NHL Shield are registered trademarks of the National Hockey League.",
    "NHL and NHL team marks are the property of the NHL and its teams.",
    "\u00a9 NHL 2021. All Rights Reserved."
  ))

}

get_nhl_api <- function(base_url, paths) {

  nb_paths <- length(paths)
  if (nb_paths == 0L) {
    return(list())
  }

  urls <- paste0(base_url, paths)
  waits <- c(0, runif(nb_paths - 1L, 1, 1.5))

  output <- mapply(function(url, wait) {
    Sys.sleep(wait)
    jsonlite::fromJSON(httr::content(httr::GET(url), "text", encoding = "UTF-8"), flatten = TRUE)
  }, url = urls, wait = waits, SIMPLIFY = FALSE, USE.NAMES = FALSE)

  add_copyright(output)

}

get_records_api <- function(paths) {

  get_nhl_api("https://records.nhl.com/site/api/", paths)

}

get_stats_api <- function(paths) {

  get_nhl_api("https://statsapi.web.nhl.com/api/v1/", paths)

}

drop_ids <- function(data) {

  data[, colnames(data)[grep("_id$", colnames(data))]:=NULL]

}

data <- new.env()
