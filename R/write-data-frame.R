#' Write Stock Synthesis 3.30 Data Frame
#'
#' @param x [data.frame()]
#' @param file [character()]
#' @param name [character()]
#' @param append [logical()]
#'
#' @return [data.frame()]
#' @export
#'
#' @examples
#' \dontrun{
#' x <- data.frame(first = 1:10, second = 11:20)
#' write_data_frame(x = x, file = "temp.ss", name = "data frame")
#' }
#'
write_data_frame <- function (x,
															file,
															name = "",
															append = TRUE) {

  # Define ---------------------------------------------------------------------

	name <- paste("#", name, collapse = c(" "))
	cols <- paste("#", paste(colnames(x), collapse = c(" ")), sep = c(" "))

  # Write ----------------------------------------------------------------------

	# Name
	readr::write_lines(name, file = file, append = append)
	# Colnames
	readr::write_lines(cols, file = file, append = TRUE)
	# Data frame
	readr::write_delim(x, file = file, append = TRUE, col_names = FALSE)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
