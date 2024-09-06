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
#' @param fleet_info [data.frame()]
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
#' @return NULL
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
												fleet_info,
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

	# Separation string
	sep <- c(" # ")

	# Comments -------------------------------------------------------------------

	x0 <- c("#C data file written by ssio::write_data()")

	# Write
	readr::write_lines(x = x0, file = file, append = FALSE)

	# Model dimensions -----------------------------------------------------------

	x1 <- list(
		# Model dimensions
		paste(year_start, "year start", sep = sep),
		paste(year_end, "year end", sep = sep),
		paste(n_seasons_per_year, "n seasons per year", sep = sep),
		paste(
			paste(
				n_months_per_season,
				collapse = c(" ")
			),
			"n months per season",
			sep = sep
		),
		paste(n_subseasons, "n subseasons", sep = sep),
		paste(month_spawning, "month spawning", sep = sep),
		paste(n_sexes, "n sexes", sep = sep),
		paste(n_ages, "n ages", sep = sep),
		paste(n_areas, "n areas", sep = sep),
		paste(n_fleets, "n fleets", sep = sep)
	)

	# Write
	readr::write_lines(x = x1, file = file, append = TRUE)

	# Fleet definitions ----------------------------------------------------------

	write_data_frame(fleet_info, file, append = TRUE)

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

	x2 <- paste(n_fleets_discard, "n fleets discard", sep = sep)
	readr::write_lines(x = x2, file = file, append = TRUE)

	if (n_fleets_discard > 0) {
		# Discard info
		write_data_frame(discard_info, file, append = TRUE)
		# Discard data
		write_data_frame(discard_data, file, append = TRUE)
		write_terminal_line(n = ncol(discard_data), file, append = TRUE)
	}

	# Mean body size -------------------------------------------------------------

	x3 <- paste(use_mean_body_size, "use mean body size", sep = sep)
	readr::write_lines(x = x3, file = file, append = TRUE)

	if (use_mean_body_size > 0) {
		# TBD
		stop("ssio::write_data(): mean body size not implemented")
	}

	# Population length bins -----------------------------------------------------

	x4 <- paste(length_bin_method, "length bin method", sep = sep)
	readr::write_lines(x = x4, file = file, append = TRUE)

	if (length_bin_method == 2) {
		x42 <- list(
			paste(length_bin_width, "length bin width", sep = sep),
			paste(length_bin_lower_min, "length bin lower min", sep = sep),
			paste(length_bin_lower_max, "length bin lower max", sep = sep)
		)
		readr::write_lines(x = x42, file = file, append = TRUE)
	} else {
		stop("ssio::write_data(): use `length_bin_method == 2`")
	}

	# Length composition ---------------------------------------------------------

	x5 <- paste(use_length_composition, "use length composition", sep = sep)
	readr::write_lines(x = x5, file = file, append = TRUE)

	if (use_length_composition > 0) {
		write_data_frame(length_info, file, append = TRUE)
	}
	if (use_length_composition == 2L) {
		write_terminal_line(n = ncol(length_info), file, append = TRUE)
	}

	x51 <- list(
		paste(n_length_bins, "n_length_bins", sep = sep),
		paste(
			paste(
				length_bins_lower,
				collapse = c(" ")
			),
			"length bins lower",
			sep = sep
		)
	)
	readr::write_lines(x = x51, file = file, append = TRUE)

	if (use_length_composition > 0) {
		write_data_frame(length_data, file, append = TRUE)
		write_terminal_line(n = ncol(length_data), file, append = TRUE)
	}


	# Age composition ------------------------------------------------------------

	x6 <- paste(n_age_bins, "n age bins", sep = sep)
	readr::write_lines(x = x6, file = file, append = TRUE)

	if (n_age_bins > 0) {
		stop("ssio::write_data(): n_age_bins > 0 not implemented")
	}

	# Conditional age-at-length --------------------------------------------------

	# TBD

	# Mean size-at-age -----------------------------------------------------------

	x7 <- paste(use_mean_size_at_age, "use mean size at age", sep = sep)
	readr::write_lines(x = x7, file = file, append = TRUE)

	if (use_mean_size_at_age > 0) {
		stop("ssio:write_data(): use_mean_size_at_age > 0 not implemented")
	}

	# Environmental --------------------------------------------------------------

	x8 <- paste(n_environmental, "n environmental", sep = sep)
	readr::write_lines(x = x8, file = file, append = TRUE)

	if (n_environmental > 0) {
		stop("ssio:write_data(): n_environmental > 0 not implemented")
	}

	# Size composition -----------------------------------------------------------

	x9 <- paste(n_size_frequency_methods, "n size frequency methods", sep = sep)
	readr::write_lines(x = x9, file = file, append = TRUE)

	if (n_environmental > 0) {
		stop("ssio:write_data(): n_size_frequency_methods > 0 not implemented")
	}

	# Tag recapture --------------------------------------------------------------

	x10 <- paste(use_tag_recapture, "use tag recapture", sep = sep)
	readr::write_lines(x = x10, file = file, append = TRUE)

	if (n_environmental > 0) {
		stop("ssio:write_data(): use_tag_recapture > 0 not implemented")
	}

	# Morph composition ----------------------------------------------------------

	x11 <- paste(use_morph_composition, "use morph composition", sep = sep)
	readr::write_lines(x = x11, file = file, append = TRUE)

	if (n_environmental > 0) {
		stop("ssio:write_data(): use_morph_composition > 0 not implemented")
	}

	# Selectivity ----------------------------------------------------------------

	x12 <- paste(use_selectivity_data, "use selectivity data", sep = sep)
	readr::write_lines(x = x11, file = file, append = TRUE)

	if (n_environmental > 0) {
		stop("ssio:write_data(): use_selectivity_data > 0 not implemented")
	}

	# End of file ----------------------------------------------------------------

	readr::write_lines(x = 999, file = file, append = TRUE)

	# Return ---------------------------------------------------------------------

	return(invisible(NULL))

}
