#' Write Stock Synthesis 3.30 Data Frame Terminal Line
#'
#' @param n [integer()]
#' @param file [character()]
#' @param value [numeric()]
#' @param append [logical()]
#'
#' @return [character()]
#' @export
#'
#' @examples
#' \dontrun{
#' write_terminal_line(n = 10, file = "temp.ss")
#' }
#'
write_terminal_line <- function (n,
																 file,
																 value = -9999,
																 append = TRUE) {

	# Define ---------------------------------------------------------------------

	name <- c("terminal line")
	x <- paste(value, paste(rep(0, n-1), collapse = " "), "#", name, sep = c(" "))

	# Write ----------------------------------------------------------------------

	readr::write_lines(x = x, file = file, append = append)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
