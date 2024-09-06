#' Write Stock Synthesis 3.30 Input Control File
#'
#' @param file [character()]
#' @param use_weight_at_age [integer()]
#' @param n_morphs [integer()]
#' @param n_platoons_per_morph [integer()]
#' @param recruitment_method [integer()]
#' @param recruitment_spatial [integer()]
#' @param n_recruitment_settle [integer()]
#' @param recruitment_unused [integer()]
#' @param recruitment_info [data.frame()]
#' @param n_block_patterns [integer()]
#' @param time_varying_method [integer()]
#' @param time_varying_auto_generation [integer()] [vector()]
#' @param natural_mortality_option [integer()]
#' @param growth_method [integer()]
#' @param growth_age_at_l1 [numeric()]
#' @param growth_age_at_l2 [numeric()]
#' @param growth_exp_decay [numeric()]
#' @param growth_feature [integer()]
#' @param maturity_option [integer()]
#' @param maturity_data [data.frame()]
#' @param maturity_first_age [numeric()]
#' @param hermaphroditism_option [integer()]
#' @param parameter_offset_method [integer()]
#' @param mortality_growth_parameters [data.frame()]
#' @param seasonal_parameters [data.frame()]
#' @param spawner_recruitment_option [integer()]
#' @param spawner_recruitment_parameters [data.frame()]
#' @param use_steepness [integer()]
#' @param spawner_recruitment_feature [integer()]
#' @param recruitment_deviation_option [integer()]
#' @param recruitment_deviation_year_start [integer()]
#' @param recruitment_deviation_year_end [integer()]
#' @param recruitment_deviation_phase [integer()]
#' @param recruitment_deviation_advanced [integer()]
#' @param fishing_method [integer()]
#' @param fishing_ballpark [numeric()]
#' @param fishing_ballpark_year [integer()]
#' @param fishing_maximum [numeric()]
#' @param fishing_iterations [integer()]
#' @param catchability_info [data.frame()]
#' @param catchability_parameters [data.frame()]
#' @param selectivity_size_info [data.frame()]
#' @param selectivity_age_info [data.frame()]
#' @param selectivity_parameters [data.frame()]
#' @param use_tag_recapture [integer()]
#' @param use_selectivity_2d [integer()]
#' @param variance_adjustment_info [data.frame()]
#' @param lambda_max_phase [integer()]
#' @param lambda_sd_offset [integer()]
#' @param lambda_info [data.frame()]
#' @param sd_report_option [integer()]
#'
#' @return [list()]
#' @export
#'
#' @examples
#' \dontrun{
#' # TBD
#' write_control()
#' }
#'
write_control <- function (file = "control.ss",
													 use_weight_at_age = 0,
													 n_morphs = 1,
													 n_platoons_per_morph = 1,
													 recruitment_method = 4,
													 recruitment_spatial = 1,
													 n_recruitment_settle = 1,
													 recruitment_unused = 0,
													 recruitment_info,
													 n_block_patterns = 0,
													 time_varying_method = 0,
													 time_varying_auto_generation = rep(0, 5),
													 natural_mortality_option = 0,
													 growth_method = 1,
													 growth_age_at_l1,
													 growth_age_at_l2,
													 growth_exp_decay,
													 growth_feature = 0,
													 maturity_option,
													 maturity_data,
													 maturity_first_age,
													 hermaphroditism_option = 0,
													 parameter_offset_method,
													 mortality_growth_parameters,
													 seasonal_parameters,
													 spawner_recruitment_option,
													 spawner_recruitment_parameters,
													 use_steepness,
													 spawner_recruitment_feature,
													 recruitment_deviation_option = 0,
													 recruitment_deviation_year_start,
													 recruitment_deviation_year_end,
													 recruitment_deviation_phase,
													 recruitment_deviation_advanced = 0,
													 fishing_method,
													 fishing_ballpark,
													 fishing_ballpark_year,
													 fishing_maximum,
													 fishing_iterations,
													 catchability_info,
													 catchability_parameters,
													 selectivity_size_info,
													 selectivity_age_info,
													 selectivity_parameters,
													 use_tag_recapture = 0,
													 use_selectivity_2d = 0,
													 variance_adjustment_info,
													 lambda_max_phase,
													 lambda_sd_offset,
													 lambda_info,
													 sd_report_option = 0) {

	# Define ---------------------------------------------------------------------

	x <- as.list(environment())

	# Comments -------------------------------------------------------------------

	write_comment_line("written by ssio::write_control()", file, append = FALSE)

	# Beginning ------------------------------------------------------------------

	write_argument_line(use_weight_at_age, file, append = TRUE)
	write_argument_line(n_morphs, file, append = TRUE)
	write_argument_line(n_platoons_per_morph, file, append = TRUE)

	if (n_platoons_per_morph > 1) {
		stop("n_platoons_per_morph > 1 not implemented")
	}

	# Recruitment ----------------------------------------------------------------

	write_argument_line(recruitment_method, file, append = TRUE)
	write_argument_line(recruitment_spatial, file, append = TRUE)
	write_argument_line(n_recruitment_settle, file, append = TRUE)
	write_argument_line(recruitment_unused, file, append = TRUE)
  # Data frame
	write_data_frame(recruitment_info, file, append = TRUE)

  # Movement -------------------------------------------------------------------

	# if (n_areas > 1) {
	# 	stop("n_areas > 1 not implemented")
	# }

  # Time blocks ----------------------------------------------------------------

	write_argument_line(n_block_patterns, file, append = TRUE)

	if (n_block_patterns > 0) {
		stop("n_block_patterns > 0 not implemented")
	}

	# Auto generation ------------------------------------------------------------

	write_argument_line(time_varying_method, file, append = TRUE)
	write_argument_line(time_varying_auto_generation, file, append = TRUE)

	# Natural mortality ----------------------------------------------------------

	write_argument_line(natural_mortality_option, file, append = TRUE)

	if (natural_mortality_option > 0) {
		stop("natural_mortality_option > 0 not implemented")
	}

	# Growth ---------------------------------------------------------------------

	write_argument_line(growth_method, file, append = TRUE)
	write_argument_line(growth_age_at_l1, file, append = TRUE)
	write_argument_line(growth_age_at_l2, file, append = TRUE)
	write_argument_line(growth_exp_decay, file, append = TRUE)
	write_argument_line(growth_feature, file, append = TRUE)

	if (growth_method > 2) {
		stop("growth_method > 2 not implemented")
	}

	# Maturity -------------------------------------------------------------------

	write_argument_line(maturity_option, file, append = TRUE)

	if (maturity_option %in% c(3:4)) {
		write_argument_line(maturity_data, file, append = TRUE)
	} else {
		stop("maturity_option !%in% c(3:4) not implemented")
	}

	write_argument_line(maturity_first_age, file, append = TRUE)

	# Hermaphroditism ------------------------------------------------------------

	write_argument_line(hermaphroditism_option, file, append = TRUE)

	if (hermaphroditism_option > 0) {
		stop("hermaphroditism_option > 0 not implemented")
	}

	# Parameter offset method ----------------------------------------------------

	write_argument_line(parameter_offset_method, file, append = TRUE)

	# Biology parameters ---------------------------------------------------------

	write_data_frame(mortality_growth_parameters, file, append = TRUE)

	# Seasonal parameters --------------------------------------------------------

	write_argument_line(seasonal_parameters, file, append = TRUE)

	# Spawner recruitment --------------------------------------------------------

	write_argument_line(spawner_recruitment_option, file, append = TRUE)
	write_argument_line(use_steepness, file, append = TRUE)
	write_argument_line(spawner_recruitment_feature, file, append = TRUE)
	# Data frame
	write_data_frame(spawner_recruitment_parameters, file, append = TRUE)

	# Recruitment deviations -----------------------------------------------------

	write_argument_line(recruitment_deviation_option, file, append = TRUE)
	write_argument_line(recruitment_deviation_year_start, file, append = TRUE)
	write_argument_line(recruitment_deviation_year_end, file, append = TRUE)
	write_argument_line(recruitment_deviation_phase, file, append = TRUE)
	write_argument_line(recruitment_deviation_advanced, file, append = TRUE)

	if (recruitment_deviation_advanced > 0) {
		stop("recruitment_deviation_advanced > 0 not implemented")
	}

	# Fishing mortality ----------------------------------------------------------

	write_argument_line(fishing_ballpark, file, append = TRUE)
	write_argument_line(fishing_ballpark_year, file, append = TRUE)
	write_argument_line(fishing_method, file, append = TRUE)
	write_argument_line(fishing_maximum, file, append = TRUE)

	if (fishing_method == 3) {
		write_argument_line(fishing_iterations, file, append = TRUE)
	} else {
		stop("fishing_iterations != 3 not implemented")
	}

	# Initial fishing mortality --------------------------------------------------

	# TBD

	# Catchability ---------------------------------------------------------------

	write_data_frame(catchability_info, file, append = TRUE)
	write_terminal_line(ncol(catchability_info), file, append = TRUE)
	write_data_frame(catchability_parameters, file, append = TRUE)

	# Selectivity and retention --------------------------------------------------

	write_data_frame(selectivity_size_info, file, append = TRUE)
	write_data_frame(selectivity_age_info, file, append = TRUE)
	write_data_frame(selectivity_parameters, file, append = TRUE)
	# Scalar
	write_argument_line(use_selectivity_2d, file, append = TRUE)

	if (use_selectivity_2d > 0) {
		stop("use_selectivity_2d > 0 not implemented")
	}

	# Tag recapture --------------------------------------------------------------

	write_argument_line(use_tag_recapture, file, append = TRUE)

	if (use_tag_recapture > 0) {
		stop("use_tag_recapture > 0 not implemented")
	}

	# Variance adjustment --------------------------------------------------------

	write_data_frame(variance_adjustment_info, file, append = TRUE)
	write_terminal_line(ncol(variance_adjustment_info), file, append = TRUE)

	# Emphasis factors -----------------------------------------------------------

	write_argument_line(lambda_max_phase, file, append = TRUE)
	write_argument_line(lambda_sd_offset, file, append = TRUE)
	# Data frame
	write_data_frame(lambda_info, file, append = TRUE)
	write_terminal_line(ncol(lambda_info), file, append = TRUE)

	# Variance of derived quantities ---------------------------------------------

	write_argument_line(sd_report_option, file, append = TRUE)

	if (sd_report_option > 0) {
		stop("sd_report_option > 0 not implemented")
	}

	# Empirical weight at age ----------------------------------------------------

	# TBD

	# End of file ----------------------------------------------------------------

	readr::write_lines(x = 999, file = file, append = TRUE)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
