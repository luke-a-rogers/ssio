% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/append-info.R
\name{append_variance_info}
\alias{append_variance_info}
\title{Append Stock Synthesis 3.30 Variance Info}
\usage{
append_variance_info(x = NULL, factor = 0, fleet = 0, value = 0, name = c(""))
}
\arguments{
\item{x}{\code{\link[=data.frame]{data.frame()}}}

\item{factor}{\code{\link[=integer]{integer()}}}

\item{fleet}{\code{\link[=integer]{integer()}}}

\item{value}{\code{\link[=numeric]{numeric()}}}

\item{name}{\code{\link[=character]{character()}}}
}
\value{
\code{\link[tibble:tibble]{tibble::tibble()}}
}
\description{
Append an info row to an info \code{\link[tibble:tibble]{tibble::tibble()}} created by
\code{\link[=create_variance_info]{create_variance_info()}} (see examples).
}
\examples{
\dontrun{
create_variance_info() |>
  append_variance_info(4, 1, 1, name = "Fleet name")
}

}
