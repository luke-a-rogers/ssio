#' Write Stock Synthesis 3.30 Starter Input File
#'
#' @param file [character()]
#' @param file_name_data  [character()]
#' @param file_name_control [character()]
#' @param use_ss3_dot_par [integer()]
#' @param progress_detail [integer()]
#' @param age_report_option [integer()]
#' @param custom_report_option [integer()]
#' @param parameter_trace [integer()]
#' @param cumulative_report_option [integer()]
#' @param use_full_priors [integer()]
#' @param use_soft_bounds [integer()]
#' @param data_output_option [integer()]
#' @param phase_maximum [integer()]
#' @param mcmc_burn [integer()]
#' @param mcmc_thin [integer()]
#' @param jitter_option [numeric()]
#' @param sd_report_year_min [integer()]
#' @param sd_report_year_max [integer()]
#' @param sd_report_years_extra [integer()]
#' @param convergence_value [numeric()]
#' @param year_retrospective [integer()]
#' @param age_summary_option [integer()]
#' @param depletion_basis [integer()]
#' @param depletion_denom [numeric()]
#' @param spr_basis [integer()]
#' @param fishing_units [integer()]
#' @param fishing_basis [integer()]
#' @param mcmc_detail [integer()]
#' @param alk_tolerance [integer()]
#' @param boot_seed [numeric()]
#' @param check_value [character()]
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
													 age_report_option = 1,
													 custom_report_option = 0,
													 parameter_trace = 0,
													 cumulative_report_option = 2,
													 use_full_priors = 0,
													 use_soft_bounds = 1,
													 data_output_option = 1,
													 phase_maximum = 10,
													 mcmc_burn = 250,
													 mcmc_thin = 5,
													 jitter_option = 0,
													 sd_report_year_min = -1, #
													 sd_report_year_max = -1, #
													 sd_report_years_extra = 0,
													 convergence_value = 1e-04,
													 year_retrospective = 0,
													 age_summary_option = 1,
													 depletion_basis = 1,
													 depletion_denom = 1,
													 spr_basis = 0,
													 fishing_units = 1,
													 fishing_basis = 0,
													 mcmc_detail = 2,
													 alk_tolerance = 0,
													 boot_seed  = 0,
													 check_value = "3.30") {

	# Define ---------------------------------------------------------------------

	x <- as.list(environment())

	# Comments -------------------------------------------------------------------

	write_comment_line("written by ssio::write_starter()", file, append = FALSE)

	# Write ----------------------------------------------------------------------

	write_argument_line(file_name_data, file, append = TRUE)
	write_argument_line(file_name_control, file, append = TRUE)
	write_argument_line(use_ss3_dot_par, file, append = TRUE)
	write_argument_line(progress_detail, file, append = TRUE)
	write_argument_line(age_report_option, file, append = TRUE)
	write_argument_line(custom_report_option, file, append = TRUE)
	write_argument_line(parameter_trace, file, append = TRUE)
	write_argument_line(cumulative_report_option, file, append = TRUE)
	write_argument_line(use_full_priors, file, append = TRUE)
	write_argument_line(use_soft_bounds, file, append = TRUE)
	write_argument_line(data_output_option, file, append = TRUE)
	write_argument_line(phase_maximum, file, append = TRUE)
	write_argument_line(mcmc_burn, file, append = TRUE)
	write_argument_line(mcmc_thin, file, append = TRUE)
	write_argument_line(jitter_option, file, append = TRUE)
	write_argument_line(sd_report_year_min, file, append = TRUE)
	write_argument_line(sd_report_year_max, file, append = TRUE)
	write_argument_line(sd_report_years_extra, file, append = TRUE)
	write_argument_line(convergence_value, file, append = TRUE)
	write_argument_line(year_retrospective, file, append = TRUE)
	write_argument_line(age_summary_option, file, append = TRUE)
	write_argument_line(depletion_basis, file, append = TRUE)
	write_argument_line(depletion_denom, file, append = TRUE)
	write_argument_line(spr_basis, file, append = TRUE)
	write_argument_line(fishing_units, file, append = TRUE)
	write_argument_line(fishing_basis, file, append = TRUE)
	write_argument_line(mcmc_detail, file, append = TRUE)
	write_argument_line(alk_tolerance, file, append = TRUE)
	write_argument_line(boot_seed, file, append = TRUE)
	write_argument_line(check_value, file, append = TRUE)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
