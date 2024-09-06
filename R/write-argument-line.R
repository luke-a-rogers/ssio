#' Write Stock Synthesis 3.30 Argument Line
#'
#' @param x [numeric()] [vector()]
#' @param file [character()]
#' @param append [logical()]
#'
#' @return [character()]
#' @export
#'
#' @examples
#' \dontrun{
#' some_descriptive_name <- rep(0, 10)
#' write_argument_line(x = some_descriptive_name, file = "temp.ss")
#' }
#'
write_argument_line <- function (x, file, append = TRUE) {

	# Name -----------------------------------------------------------------------

	d <- substitute(x) |> as.character() |> stringr::str_replace_all("_", " ")

	# String ---------------------------------------------------------------------

	x <- paste(paste(x, collapse = " "),  d, sep = " # ")

	# Write ----------------------------------------------------------------------

	readr::write_lines(x = x, file = file, append = append)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
