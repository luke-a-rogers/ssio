#' Create Stock Synthesis 3.30 Catch Info Data Frame
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_catch_info()] and the pipe operator (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_catch_info() |>
#'   append_catch_info(1, -1, 1, 1, 1, name = "Fleet name")
#' }
#'
create_catch_info <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		fleet_type = integer(0),
		timing = numeric(0),
		area = integer(0),
		units = integer(0),
		use_catch_mult = integer(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)

}

#' Create Stock Synthesis 3.30 Index Info Data Frame
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_index_info()] and the pipe operator (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_index_info() |>
#'   append_index_info(1, 1, 0, 0, name = "Fleet name")
#' }
#'
create_index_info <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		fleet = integer(0),
		units = integer(0),
		error_type = numeric(0),
		sd_report = integer(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)

}

#' Create Stock Synthesis 3.30 Length Info Data Frame
#'
#' @param use_length_composition [integer()]
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_length_info()] and the pipe operator (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_length_info() |>
#'   append_length_info(-1, 1e-04, 0, 0, 0, 0, 0.001, name = "Fleet name")
#' }
#'
create_length_info <- function (use_length_composition = 1L) {

	# Define ---------------------------------------------------------------------

	if (use_length_composition == 0) {
		x <- tibble::tibble()
	} else if (use_length_composition == 1) {
		x <- tibble::tibble(
			min_tail_compress = numeric(0),
			add_to_prop = numeric(0),
			combine_sexes = numeric(0),
			compress_bins = numeric(0),
			error = integer(0),
			parameter = integer(0),
			min_sample_size = numeric(0),
			name = character(0)
		)
	} else if (use_length_composition == 3) {
		stop("use_length_composition == 3 not implemented")
	}

	# Return ---------------------------------------------------------------------

	return(x)

}

#' Create Stock Synthesis 3.30 Recruitment Info Data Frame
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_recruitment_info()] and the pipe operator
#' (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_recruitment_info() |>
#'   append_recruitment_info(1, 1, 1, 0, name = "Morph 1")
#' }
#'
create_recruitment_info <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		growth_pattern = integer(0),
		month = integer(0),
		area = integer(0),
		age_at_settlement = integer(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Create Stock Synthesis 3.30 Catchability Info Data Frame
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_catchability_info()] and the pipe operator
#' (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_catchability_info() |>
#'   append_catchability_info(1, 1, 0, 0, 0, 1,  name = "Fleet name")
#' }
#'
create_catchability_info <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		fleet = integer(0),
		link_type = integer(0),
		link_info = integer(0),
		extra_se = integer(0),
		bias_adjust = integer(0),
		float = integer(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Create Stock Synthesis 3.30 Selectivity Info Data Frame
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_selectivity_info()] and the pipe operator
#' (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_selectivity_info() |>
#'   append_selectivity_info(24, 0, 0, 0, name = "Fleet name")
#' }
#'
create_selectivity_info <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		pattern = integer(0),
		discard = integer(0),
		male = integer(0),
		special = integer(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Create Stock Synthesis 3.30 Variance Info Data Frame
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_variance_info()] and the pipe operator
#' (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_variance_info() |>
#'   append_variance_info(4, 1, 1, name = "Fleet name")
#' }
#'
create_variance_info <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		factor = integer(0),
		fleet = integer(0),
		value = numeric(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Create Stock Synthesis 3.30 Lambda Info Data Frame
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_lambda_info()] and the pipe operator
#' (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_lambda_info() |>
#'   append_lambda_info(1, 1, 1, 1, 1, name = "Fleet name")
#' }
#'
create_lambda_info <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		component = integer(0),
		fleet = integer(0),
		phase = integer(0),
		value = numeric(0),
		method = integer(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Create Stock Synthesis 3.30 Seasonality Info Data Frame
#'
#' @description
#' Create an info [tibble::tibble()] with 0 rows. Append info
#' rows using [ssio::append_seasonality_info()] and the pipe operator
#' (see examples).
#'
#' @return [tibble::tibble()]
#' @export
#'
#' @examples
#' \dontrun{
#' create_seasonality_info() |>
#'   append_seasonality_info(name = "seasonality")
#' }
#'
create_seasonality_info <- function () {

	# Define ---------------------------------------------------------------------

	x <- tibble::tibble(
		wt_len_fem_1 = integer(0),
		wt_len_fem_2 = integer(0),
		maturity_1 = integer(0),
		maturity_2 = integer(0),
		fecundity_1 = integer(0),
		fecundity_2 = integer(0),
		wt_len_mal_1 = integer(0),
		wt_len_mal_2 = integer(0),
		l1 = integer(0),
		von_bert_k = integer(0),
		name = character(0)
	)

	# Return ---------------------------------------------------------------------

	return(x)

}
