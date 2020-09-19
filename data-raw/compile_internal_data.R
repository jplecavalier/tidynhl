library(data.table)
library(jsonlite)
library(httr)
library(magrittr)
library(stringr)
library(tidynhl)

source("data-raw/teams_info.R")
source("data-raw/seasons_info.R")

usethis::use_data(teams_info, seasons_info, internal=TRUE, overwrite=TRUE)
