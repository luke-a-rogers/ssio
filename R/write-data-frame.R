#' Write Stock Synthesis 3.30 Data Frame
#'
#' @param x [data.frame()]
#' @param file [character()]
#' @param append [logical()]
#'
#' @return [data.frame()]
#' @export
#'
#' @examples
#' \dontrun{
#' data_frame <- data.frame(first = 1:10, second = 11:20)
#' write_data_frame(x = data_frame, file = "temp.ss")
#' }
#'
write_data_frame <- function (x,
															file,
															append = TRUE) {

	# Name -----------------------------------------------------------------------

	d <- substitute(x) |> as.character() |> stringr::str_replace_all("_", " ")
	name <- paste("#", d, sep = " ")

  # Columns --------------------------------------------------------------------

	cols <- paste("#", paste(colnames(x), collapse = c(" ")), sep = c(" "))

  # Write ----------------------------------------------------------------------

	# Name
	readr::write_lines(name, file = file, append = append)
	# Colnames
	readr::write_lines(cols, file = file, append = TRUE)
	# Data frame
	readr::write_delim(x, file = file, append = TRUE, quote = "none")

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
