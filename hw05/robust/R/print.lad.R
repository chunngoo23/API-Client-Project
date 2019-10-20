#' A method to print lad object 
#' 
#' This is a function for creating print method for lad object
#' @param x A lad object
#' @param ... further arguments passed to or from other methods
#' @return A list of coefficients, fitted value, and residuals.
#' @details Return Intercept = "", x = ""
#' @examples
#' a = lad (x = area$land, y = area$farm)
#' print(a)
#' 
print.lad = function (x, ...) {
 cat(sep="", "Intercept=", x$coefficients[1], ", ", "x=", x$coefficients[2], "\n")
}

