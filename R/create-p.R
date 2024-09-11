#' Create Stock Synthesis 3.30 Parameter Data Frame
#'
#' @description
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
