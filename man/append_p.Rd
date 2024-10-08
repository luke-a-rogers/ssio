% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/append-p.R
\name{append_p}
\alias{append_p}
\title{Append Stock Synthesis 3.30 Parameter}
\usage{
append_p(
  x = NULL,
  lower = 0,
  upper = 0,
  initial = 0,
  prior_mean = 0,
  prior_sd = 0,
  prior_type = 0,
  phase = 0,
  env_link = 0,
  dev_link = 0,
  dev_year_min = 0,
  dev_year_max = 0,
  dev_phase = 0,
  block = 0,
  block_fn = 0,
  name = c("")
)
}
\arguments{
\item{x}{\code{\link[=data.frame]{data.frame()}}}

\item{lower}{\code{\link[=numeric]{numeric()}}}

\item{upper}{\code{\link[=numeric]{numeric()}}}

\item{initial}{\code{\link[=numeric]{numeric()}}}

\item{prior_mean}{\code{\link[=numeric]{numeric()}}}

\item{prior_sd}{\code{\link[=numeric]{numeric()}}}

\item{prior_type}{\code{\link[=integer]{integer()}}}

\item{phase}{\code{\link[=integer]{integer()}}}

\item{env_link}{\code{\link[=integer]{integer()}}}

\item{dev_link}{\code{\link[=integer]{integer()}}}

\item{dev_year_min}{\code{\link[=integer]{integer()}}}

\item{dev_year_max}{\code{\link[=integer]{integer()}}}

\item{dev_phase}{\code{\link[=integer]{integer()}}}

\item{block}{\code{\link[=integer]{integer()}}}

\item{block_fn}{\code{\link[=integer]{integer()}}}

\item{name}{\code{\link[=character]{character()}}}
}
\value{
\code{\link[tibble:tibble]{tibble::tibble()}}
}
\description{
Append a parameter row to a parameter \code{\link[tibble:tibble]{tibble::tibble()}} created by
\code{\link[=create_p]{create_p()}} (see examples).
}
\examples{
\dontrun{
create_p() |>
  append_p(5.0, 15, 9.5, 0, 0, 0, 1, name = "SR_LN(R0)")
}

}
