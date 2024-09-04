
write_control <- function (file = "control.ss") {

	# Define ---------------------------------------------------------------------

	# Separation string
	sep <- c(" # ")
	# Vector
	x <- list()

	# Write ----------------------------------------------------------------------

	readr::write_lines(x = x, file = file)

	# Return ---------------------------------------------------------------------

	return(invisible(x))

}
