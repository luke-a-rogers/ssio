#' Write Stock Synthesis 3.30 Comment Line
#'
#' @param x [character()]
#' @param file [character()]
#' @param append [logical()]
#'
#' @return [character()]
#' @export
#'
#' @examples
#' \dontrun{
#' write_comment_line("A new comment", file = "temp.ss")
#' }
#'
write_comment_line <- function (x, file, append = TRUE) {

	# Comment --------------------------------------------------------------------

	x <- paste("#C", x, sep = " ")

	# Write ----------------------------------------------------------------------

	readr::write_lines(x, file = file, append = append)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
