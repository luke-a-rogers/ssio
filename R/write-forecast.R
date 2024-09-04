#' Write Stock Synthesis 3.30 Forecast Input File
#'
#' @param file [character()]
#' @param option_reference_points [integer()]
#' @param option_msy_method [integer()]
#' @param spr_target [numeric()]
#' @param relative_biomass_target [numeric()]
#' @param years_reference_points [integer()] [vector()]
#' @param relative_fishing_basis [integer()]
#' @param option_forecast [integer()]
#' @param years_forecast [integer()]
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
														option_reference_points = 1,
														option_msy_method = 2,
														spr_target = 0.4,
														relative_biomass_target = 0.4,
														years_reference_points = rep(0, 10),
														relative_fishing_basis = 1,
														option_forecast = 0,
														years_forecast = 1,
														fishing_multiplier = 1,
														control_rule_method = 0) {

	# Define ---------------------------------------------------------------------

	# Separation string
	sep <- c(" # ")
	# Vector
	x <- list(
		paste(c("#C forecast file written by ssio::write_forecast()")),
		paste(option_reference_points, "option reference points", sep = sep),
		paste(option_msy_method, "option msy method", sep = sep),
		paste(spr_target, "spr target", sep = sep),
		paste(relative_biomass_target, "relative biomass target", sep = sep),
		paste(
			paste(years_reference_points, collapse = " "),
			"years reference points",
			sep = sep
		),
		paste(relative_fishing_basis, "relative fishing basis", sep = sep),
		paste(option_forecast, "option forecast", sep = sep),
		paste(years_forecast, "years forecast", sep = sep),
		paste(fishing_multiplier, "fishing multiplier", sep = sep),
		paste(control_rule_method, "control rule method", sep = sep)
	)

	# Write ----------------------------------------------------------------------

	readr::write_lines(x = x, file = file)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
