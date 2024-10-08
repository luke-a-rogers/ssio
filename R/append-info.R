#' Append Stock Synthesis 3.30 Catch Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_catch_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param fleet_type [integer()]
#' @param timing [numeric()]
#' @param area [integer()]
#' @param units [integer()]
#' @param use_catch_mult [integer()]
#' @param name [character()]
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
append_catch_info <- function (x = NULL,
															 fleet_type = 0,
															 timing = 0,
															 area = 0,
															 units = 0,
															 use_catch_mult = 0,
															 name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			fleet_type = fleet_type,
			timing = timing,
			area = area,
			units = units,
			use_catch_mult = use_catch_mult,
			name = stringr::str_replace_all(name, " ", "_")
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Append Stock Synthesis 3.30 Index Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_index_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param fleet [integer()]
#' @param units [integer()]
#' @param error_type [numeric()]
#' @param sd_report [integer()]
#' @param name [character()]
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
append_index_info <- function (x = NULL,
															 fleet = 0,
															 units = 0,
															 error_type = 0,
															 sd_report = 0,
															 name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			fleet = fleet,
			units = units,
			error_type = error_type,
			sd_report = sd_report,
			name = paste("#", name, sep = c(" "))
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Append Stock Synthesis 3.30 Length Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_length_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param ... [numeric()]
#' @param name [character()]
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
append_length_info <- function (x = NULL, ..., name = c("")) {

	# Define ---------------------------------------------------------------------

	# Augment
	y <- c(list(...), paste("#", name, sep = c(" ")))
	# Check
	if (!is.null(x)) {
		if (length(x) == length(y)) {
			# Match names
			names(y) <- colnames(x)
			# Row bind
			x <- dplyr::bind_rows(x, y)
		} else {
			stop("length(list(...)) + 1  must equal ncol(x)")
		}
	}

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Append Stock Synthesis 3.30 Recruitment Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_recruitment_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param growth_pattern [integer()]
#' @param month [integer()]
#' @param area [integer()]
#' @param age_at_settlement [integer()]
#' @param name [character()]
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
append_recruitment_info <- function (x = NULL,
																		 growth_pattern = 0,
																		 month = 0,
																		 area = 0,
																		 age_at_settlement = 0,
																		 name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			growth_pattern = growth_pattern,
			month = month,
			area = area,
			age_at_settlement = age_at_settlement,
			name = paste("#", name, sep = c(" "))
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Append Stock Synthesis 3.30 Catchability Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_catchability_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param fleet [integer()]
#' @param link_type [integer()]
#' @param link_info [integer()]
#' @param extra_se [numeric()]
#' @param bias_adjust [numeric()]
#' @param float [integer()]
#' @param name [character()]
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
append_catchability_info <- function (x = NULL,
																			fleet = 0,
																			link_type = 0,
																			link_info = 0,
																			extra_se = 0,
																			bias_adjust = 0,
																			float = 0,
																			name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			fleet = fleet,
			link_type = link_type,
			link_info = link_info,
			extra_se = extra_se,
			bias_adjust = bias_adjust,
			float = float,
			name = paste("#", name, sep = c(" "))
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Append Stock Synthesis 3.30 Selectivity Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_selectivity_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param pattern [integer()]
#' @param discard [integer()]
#' @param male [integer()]
#' @param special [integer()]
#' @param name [character()]
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
append_selectivity_info <- function (x = NULL,
																		 pattern = 0,
																		 discard = 0,
																		 male = 0,
																		 special = 0,
																		 name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			pattern = pattern,
			discard = discard,
			male = male,
			special = special,
			name = paste("#", name, sep = c(" "))
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Append Stock Synthesis 3.30 Variance Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_variance_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param factor [integer()]
#' @param fleet [integer()]
#' @param value [numeric()]
#' @param name [character()]
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
append_variance_info <- function (x = NULL,
																	factor = 0,
																	fleet = 0,
																	value = 0,
																	name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			factor = factor,
			fleet = fleet,
			value = value,
			name = paste("#", name, sep = c(" "))
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}

#' Append Stock Synthesis 3.30 Lambda Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_lambda_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param component [integer()]
#' @param fleet [integer()]
#' @param phase [integer()]
#' @param value [numeric()]
#' @param method [integer()]
#' @param name [character()]
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
append_lambda_info <- function (x = NULL,
																component = 0,
																fleet = 0,
																phase = 0,
																value = 0,
																method = 0,
																name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			component = component,
			fleet = fleet,
			phase = phase,
			value = value,
			method = method,
			name = paste("#", name, sep = c(" "))
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}


#' Append Stock Synthesis 3.30 Seasonality Info
#'
#' @description
#' Append an info row to an info [tibble::tibble()] created by
#' [ssio::create_seasonality_info()] (see examples).
#'
#' @param x [data.frame()]
#' @param wt_len_fem_1 [integer()]
#' @param wt_len_fem_2 [integer()]
#' @param maturity_1 [integer()]
#' @param maturity_2 [integer()]
#' @param fecundity_1 [integer()]
#' @param fecundity_2 [integer()]
#' @param wt_len_mal_1 [integer()]
#' @param wt_len_mal_2 [integer()]
#' @param l1 [integer()]
#' @param von_bert_k [integer()]
#' @param name [character()]
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
append_seasonality_info <- function (x = NULL,
																		 wt_len_fem_1 = 0,
																		 wt_len_fem_2 = 0,
																		 maturity_1 = 0,
																		 maturity_2 = 0,
																		 fecundity_1 = 0,
																		 fecundity_2 = 0,
																		 wt_len_mal_1 = 0,
																		 wt_len_mal_2 = 0,
																		 l1 = 0,
																		 von_bert_k = 0,
																		 name = c("")) {

	# Define ---------------------------------------------------------------------

	x <- x |> dplyr::bind_rows(
		tibble::tibble(
			wt_len_fem_1 = wt_len_fem_1,
			wt_len_fem_2 = wt_len_fem_2,
			maturity_1 = maturity_1,
			maturity_2 = maturity_2,
			fecundity_1 = fecundity_1,
			fecundity_2 = fecundity_2,
			wt_len_mal_1 = wt_len_mal_1,
			wt_len_mal_2 = wt_len_mal_2,
			l1 = l1,
			von_bert_k = von_bert_k,
			name = paste("#", name, sep = c(" "))
		)
	)

	# Return ---------------------------------------------------------------------

	return(x)
}
