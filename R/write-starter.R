#' Write Stock Synthesis 3.30 Starter Input File
#'
#' @param file [character()]
#' @param file_name_data  [character()]
#' @param file_name_control [character()]
#' @param use_ss3_dot_par [integer()]
#' @param progress_detail [integer()]
#' @param option_age_report [integer()]
#' @param option_custom_report [integer()]
#' @param parameter_trace [integer()]
#' @param option_cumulative_report [integer()]
#' @param use_full_priors [integer()]
#' @param use_soft_bounds [integer()]
#' @param option_data_output [integer()]
#' @param phase_maximum [integer()]
#' @param mcmc_burn [integer()]
#' @param mcmc_thin [integer()]
#' @param option_jitter [numeric()]
#' @param year_min_sd_report [integer()]
#' @param year_max_sd_report [integer()]
#' @param years_extra_sd_report [integer()]
#' @param convergence_value [numeric()]
#' @param year_retrospective [integer()]
#' @param option_age_summary [integer()]
#' @param depletion_basis [integer()]
#' @param depletion_denom [numeric()]
#' @param spr_basis [integer()]
#' @param fishing_units [integer()]
#' @param fishing_basis [integer()]
#' @param mcmc_detail [integer()]
#' @param alk_tolerance [integer()]
#' @param boot_seed [numeric()]
#' @param check_value [integer()]
#'
#' @return [list()]
#' @export
#'
#' @examples
#' \dontrun{
#' write_starter()
#' }
#'
write_starter <- function (file = "starter.ss",
													 file_name_data = "data.ss",
													 file_name_control = "control.ss",
													 use_ss3_dot_par = 0,
													 progress_detail = 0,
													 option_age_report = 1,
													 option_custom_report = 0,
													 parameter_trace = 0,
													 option_cumulative_report = 2,
													 use_full_priors = 0,
													 use_soft_bounds = 1,
													 option_data_output = 1,
													 phase_maximum = 10,
													 mcmc_burn = 250,
													 mcmc_thin = 5,
													 option_jitter = 0,
													 year_min_sd_report = -1, #
													 year_max_sd_report = -1, #
													 years_extra_sd_report = 0,
													 convergence_value = 1e-04,
													 year_retrospective = 0,
													 option_age_summary = 1,
													 depletion_basis = 1,
													 depletion_denom = 1,
													 spr_basis = 0,
													 fishing_units = 1,
													 fishing_basis = 0,
													 mcmc_detail = 2,
													 alk_tolerance = 0,
													 boot_seed  = 0,
													 check_value = 3.30) {

	# Define ---------------------------------------------------------------------

	# Separation string
	sep <- c(" # ")
	# Vector
	x <- list(
		paste(c("#C starter file written by ssio::write_starter()")),
		paste(file_name_data, "data file name", sep = sep),
		paste(file_name_control, "control file name", sep = sep),
		paste(use_ss3_dot_par, "use ss3 dot par", sep = sep),
		paste(progress_detail, "progress detail", sep = sep),
		paste(option_age_report, "option age report", sep = sep),
		paste(option_custom_report, "option custom report", sep = sep),
		paste(parameter_trace, "parameter trace", sep = sep),
		paste(option_cumulative_report, "option cumulative report", sep = sep),
		paste(use_full_priors, "use full priors", sep = sep),
		paste(use_soft_bounds, "use soft bounds", sep = sep),
		paste(option_data_output, "option data output", sep = sep),
		paste(phase_maximum, "phase maximum", sep = sep),
		paste(mcmc_burn, "mcmc burn", sep = sep),
		paste(mcmc_thin, "mcmc thin", sep = sep),
		paste(option_jitter, "option jitter", sep = sep),
		paste(year_min_sd_report, "year min sd report", sep = sep),
		paste(year_max_sd_report, "year max sd report", sep = sep),
		paste(years_extra_sd_report, "years extra sd report", sep = sep),
		paste(convergence_value, "convergence value", sep = sep),
		paste(year_retrospective, "year retrospective", sep = sep),
		paste(option_age_summary, "option age summary", sep = sep),
		paste(depletion_basis, "depletion basis", sep = sep),
		paste(depletion_denom, "depletion denominator", sep = sep),
		paste(spr_basis, "spr basis", sep = sep),
		paste(fishing_units, "fishing units", sep = sep),
		paste(fishing_basis, "fishing basis", sep = sep),
		paste(mcmc_detail, "mcmc detail", sep = sep),
		paste(alk_tolerance, "alk tolerance", sep = sep),
		paste(boot_seed, "boot seed", sep = sep),
		paste(check_value, "check value", sep = sep)
	)

	# Write ----------------------------------------------------------------------

	readr::write_lines(x = x, file = file)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
