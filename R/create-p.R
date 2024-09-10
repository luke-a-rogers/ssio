#' Append Stock Synthesis 3.30 Parameter to Data Frame
#'
#' @details
#' Append a parameter row to a parameter [tibble::tibble()] created by
#' [ssio::create_p()] (see examples).
#'
#'
#' @param x [data.frame()]
#' @param lower [numeric()]
#' @param upper [numeric()]
#' @param initial [numeric()]
#' @param prior_mean [numeric()]
#' @param prior_sd [numeric()]
#' @param prior_type [integer()]
#' @param phase [integer()]
#' @param env_link [integer()]
#' @param dev_link [integer()]
#' @param dev_year_min [integer()]
#' @param dev_year_max [integer()]
#' @param dev_phase [integer()]
#' @param block [integer()]
#' @param block_fn [integer()]
#' @param name [character()]
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_p() |>
#'   append_p(5.0, 15, 9.5, 0, 0, 0, 1, name = "SR_LN(R0)")
#' }
append_p <- function (x = NULL,
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
											name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			lower = lower,
			upper = upper,
			initial = initial,
			prior_mean = prior_mean,
			prior_sd = prior_sd,
			prior_type = prior_type,
			phase = phase,
			env_link = env_link,
			dev_link = dev_link,
			dev_year_min = dev_year_min,
			dev_year_max = dev_year_max,
			dev_phase = dev_phase,
			block = block,
			block_fn = block_fn,
			name = paste("#", name, sep = c(" "))
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)

}

#' Create Stock Synthesis 3.30 Parameter Data Frame
#'
#' @details
#' Create a parameter [tibble::tibble()] with 0 rows. Append parameter
#' rows using [ssio::append_p()] and the pipe operator (see examples).
#'
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_p() |>
#'   append_p(5.0, 15, 9.5, 0, 0, 0, 1, name = "SR_LN(R0)")
#' }
#'
create_p <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		lower = numeric(0),
		upper = numeric(0),
		initial = numeric(0),
		prior_mean = numeric(0),
		prior_sd = numeric(0),
		prior_type = integer(0),
		phase = integer(0),
		env_link = integer(0),
		dev_link = integer(0),
		dev_year_min = integer(0),
		dev_year_max = integer(0),
		dev_phase = integer(0),
		block = integer(0),
		block_fn = integer(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)

}
