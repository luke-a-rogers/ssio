#' Write Stock Synthesis 3.30 Forecast Input File
#'
#' @param file [character()]
#' @param reference_point_option [integer()]
#' @param msy_method [integer()]
#' @param spr_target [numeric()]
#' @param relative_biomass_target [numeric()]
#' @param reference_point_years [integer()] [vector()]
#' @param relative_fishing_basis [integer()]
#' @param forecast_option [integer()]
#' @param forecast_years [integer()]
#' @param fishing_multiplier [numeric()]
#' @param control_rule_method [integer()]
#'
#' @return [list()]
#' @export
#'
#' @examples
#' \dontrun{
#' write_forecast()
#' }
#'
write_forecast <- function (file = "forecast.ss",
														reference_point_option = 1,
														msy_method = 2,
														spr_target = 0.4,
														relative_biomass_target = 0.4,
														reference_point_years = rep(0, 10),
														relative_fishing_basis = 1,
														forecast_option = 0,
														forecast_years = 1,
														fishing_multiplier = 1,
														control_rule_method = 0) {

	# Define ---------------------------------------------------------------------

	x <- as.list(environment())

	# Comments -------------------------------------------------------------------

	write_comment_line("written by ssio::write_forecast()", file, append = FALSE)

	# Write ---------------------------------------------------------------------

	write_argument_line(reference_point_option, file, append = TRUE)
	write_argument_line(msy_method, file, append = TRUE)
	write_argument_line(spr_target, file, append = TRUE)
	write_argument_line(relative_biomass_target, file, append = TRUE)
	write_argument_line(reference_point_years, file, append = TRUE)
	write_argument_line(relative_fishing_basis, file, append = TRUE)
	write_argument_line(forecast_option, file, append = TRUE)
	write_argument_line(forecast_years, file, append = TRUE)
	write_argument_line(fishing_multiplier, file, append = TRUE)
	write_argument_line(control_rule_method, file, append = TRUE)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
