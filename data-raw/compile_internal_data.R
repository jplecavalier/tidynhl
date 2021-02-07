library(data.table)
library(jsonlite)
library(httr)
library(magrittr)
library(stringr)
library(tidynhl)

source("data-raw/seasons_info.R")

usethis::use_data(seasons_info, internal=TRUE, overwrite=TRUE)
