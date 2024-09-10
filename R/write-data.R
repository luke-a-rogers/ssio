#' Write Stock Synthesis 3.30 Data Input File
#'
#' @param file [character()]
#' @param year_start [integer()]
#' @param year_end [integer()]
#' @param n_seasons_per_year [integer()]
#' @param n_months_per_season [numeric()]
#' @param n_subseasons [integer()]
#' @param month_spawning [numeric()]
#' @param n_sexes [integer()]
#' @param n_ages [integer()]
#' @param n_areas [integer()]
#' @param n_fleets [integer()]
#' @param catch_info [data.frame()]
#' @param catch_data [data.frame()]
#' @param index_info [data.frame()]
#' @param index_data [data.frame()]
#' @param n_fleets_discard [integer()]
#' @param discard_info [data.frame()]
#' @param discard_data [data.frame()]
#' @param use_mean_body_size [integer()]
#' @param length_bin_method [integer()]
#' @param length_bin_width [integer()]
#' @param length_bin_lower_min [integer()]
#' @param length_bin_lower_max [integer()]
#' @param use_length_composition [integer()]
#' @param length_info [data.frame()]
#' @param n_length_bins [integer()]
#' @param length_bins_lower [integer()]
#' @param length_data [data.frame()]
#' @param n_age_bins [integer()]
#' @param use_mean_size_at_age [integer()]
#' @param n_environmental [integer()]
#' @param n_size_frequency_methods [integer()]
#' @param use_tag_recapture [integer()]
#' @param use_morph_composition [integer()]
#' @param use_selectivity_data [integer()]
#'
#' @return [list()]
#' @export
#'
#' @examples
#' \dontrun{
#' write_data()
#' }
write_data <- function (file = "data.ss",
												year_start,
												year_end,
												n_seasons_per_year,
												n_months_per_season,
												n_subseasons,
												month_spawning,
												n_sexes,
												n_ages,
												n_areas,
												n_fleets,
												catch_info,
												catch_data,
												index_info,
												index_data,
												n_fleets_discard,
												discard_info,
												discard_data,
												use_mean_body_size,
												length_bin_method,
												length_bin_width,
												length_bin_lower_min,
												length_bin_lower_max,
												use_length_composition,
												length_info,
												n_length_bins,
												length_bins_lower,
												length_data,
												n_age_bins = 0,
												use_mean_size_at_age = 0,
												n_environmental = 0,
												n_size_frequency_methods = 0,
												use_tag_recapture = 0,
												use_morph_composition = 0,
												use_selectivity_data = 0) {

	# Define ---------------------------------------------------------------------

	x <- as.list(environment())

	# Comments -------------------------------------------------------------------

	write_comment_line("written by ssio::write_data()", file, append = FALSE)

	# Model dimensions -----------------------------------------------------------

	write_argument_line(year_start, file, append = TRUE)
	write_argument_line(year_end, file, append = TRUE)
	write_argument_line(n_seasons_per_year, file, append = TRUE)
	write_argument_line(n_months_per_season, file, append = TRUE)
	write_argument_line(n_subseasons, file, append = TRUE)
	write_argument_line(month_spawning, file, append = TRUE)
	write_argument_line(n_sexes, file, append = TRUE)
	write_argument_line(n_ages, file, append = TRUE)
	write_argument_line(n_areas, file, append = TRUE)
	write_argument_line(n_fleets, file, append = TRUE)

	# Fleet definitions ----------------------------------------------------------

	write_data_frame(catch_info, file, append = TRUE)

	# Bycatch fleets -------------------------------------------------------------

	# TBD

	# Catch ----------------------------------------------------------------------

	write_data_frame(catch_data, file, append = TRUE)
	write_terminal_line(n = ncol(catch_data), file, append = TRUE)

  # Indices --------------------------------------------------------------------

	write_data_frame(index_info, file, append = TRUE)
	write_data_frame(index_data, file, append = TRUE)
	write_terminal_line(n = ncol(index_data), file, append = TRUE)

	# Discards -------------------------------------------------------------------

	write_argument_line(n_fleets_discard, file, append = TRUE)

	if (n_fleets_discard > 0) {
		# Discard info
		write_data_frame(discard_info, file, append = TRUE)
		# Discard data
		write_data_frame(discard_data, file, append = TRUE)
		write_terminal_line(n = ncol(discard_data), file, append = TRUE)
	}

	# Mean body size -------------------------------------------------------------

	write_argument_line(use_mean_body_size, file, append = TRUE)

	if (use_mean_body_size > 0) {
		stop("use_mean_body_size > 0 not implemented")
	}

	# Population length bins -----------------------------------------------------

	write_argument_line(length_bin_method, file, append = TRUE)

	if (length_bin_method == 2) {
		write_argument_line(length_bin_width, file, append = TRUE)
		write_argument_line(length_bin_lower_min, file, append = TRUE)
		write_argument_line(length_bin_lower_max, file, append = TRUE)
	} else {
		stop("length_bin_method != 2 not implemented")
	}

	# Length composition ---------------------------------------------------------

	write_argument_line(use_length_composition, file, append = TRUE)

	if (use_length_composition > 0) {
		write_data_frame(length_info, file, append = TRUE)
	}
	if (use_length_composition == 2L) {
		write_terminal_line(n = ncol(length_info), file, append = TRUE)
	}

	write_argument_line(n_length_bins, file, append = TRUE)
	write_argument_line(length_bins_lower, file, append = TRUE)

	if (use_length_composition > 0) {
		write_data_frame(length_data, file, append = TRUE)
		write_terminal_line(n = ncol(length_data), file, append = TRUE)
	}

	# Age composition ------------------------------------------------------------

	write_argument_line(n_age_bins, file, append = TRUE)

	if (n_age_bins > 0) {
		stop("n_age_bins > 0 not implemented")
	}

	# Conditional age-at-length --------------------------------------------------

	# TBD

	# Mean size-at-age -----------------------------------------------------------

	write_argument_line(use_mean_size_at_age, file, append = TRUE)

	if (use_mean_size_at_age > 0) {
		stop("use_mean_size_at_age > 0 not implemented")
	}

	# Environmental --------------------------------------------------------------

	write_argument_line(n_environmental, file, append = TRUE)

	if (n_environmental > 0) {
		stop("n_environmental > 0 not implemented")
	}

	# Size composition -----------------------------------------------------------

	write_argument_line(n_size_frequency_methods, file, append = TRUE)

	if (n_environmental > 0) {
		stop("n_size_frequency_methods > 0 not implemented")
	}

	# Tag recapture --------------------------------------------------------------

	write_argument_line(use_tag_recapture, file, append = TRUE)

	if (use_tag_recapture > 0) {
		stop("use_tag_recapture > 0 not implemented")
	}

	# Morph composition ----------------------------------------------------------

	write_argument_line(use_morph_composition, file, append = TRUE)

	if (use_morph_composition > 0) {
		stop("use_morph_composition > 0 not implemented")
	}

	# Selectivity ----------------------------------------------------------------

	write_argument_line(use_selectivity_data, file, append = TRUE)

	if (use_selectivity_data > 0) {
		stop("use_selectivity_data > 0 not implemented")
	}

	# End of file ----------------------------------------------------------------

	readr::write_lines(x = 999, file = file, append = TRUE)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
