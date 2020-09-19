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
