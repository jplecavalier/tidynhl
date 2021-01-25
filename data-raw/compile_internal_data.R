library(data.table)
library(jsonlite)
library(httr)
library(magrittr)
library(stringr)
library(tidynhl)

source("data-raw/seasons_info.R")
source("data-raw/prospects_info.R")
source("data-raw/players_info.R")

usethis::use_data(seasons_info, prospects_info, players_info, internal=TRUE, overwrite=TRUE)
