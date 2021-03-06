% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidy_goalies_stats.R
\name{tidy_goalies_stats}
\alias{tidy_goalies_stats}
\title{Get a tidy dataset of NHL goalies statistics}
\usage{
tidy_goalies_stats(
  players_id,
  regular = TRUE,
  playoffs = TRUE,
  keep_id = FALSE,
  return_datatable = getOption("tidynhl.data.table", TRUE)
)
}
\arguments{
\item{players_id}{Integer vector indicating the NHL ID of goalies for whom the statistics will be
returned.}

\item{regular}{\emph{(optional)} Logical indicating if the regular season statistics should be
returned. Default to \code{TRUE}.}

\item{playoffs}{\emph{(optional)} Logical indicating if the playoffs statistics should be returned.
Default to \code{TRUE}.}

\item{keep_id}{\emph{(optional)} Logical indicating if the IDs of different dimensions should be
returned. Default to \code{FALSE}.}

\item{return_datatable}{\emph{(optional)} Logical indicating whether or not a data.table should be
returned. Default can be set globally with \code{options("tidynhl.data.table")}.}
}
\description{
The function \code{tidy_goalies_stats()} is meant to be a user-friendly way of getting the NHL
year-by-year statistics of selected goalies
}
\examples{
# Allowing large outputs for the pkgdown website
options(width = 1000L)

# Get the NHL career statistics of Roberto Luongo
tidy_goalies_stats(8466141L)

# Get the NHL career playoffs statistics of both Roberto Luongo and Corey Crawford, keeping the
# IDs
tidy_goalies_stats(c(8466141L, 8470645L), regular = FALSE, keep_id = TRUE)

}
