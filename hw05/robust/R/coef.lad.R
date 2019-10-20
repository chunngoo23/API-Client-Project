#' Coefficient vectors of the lad object
#' 
#' A method to return coefficient vectors of the lad object(Description paragraph)
#' @param object A lad object
#' @param ... further arguments passed to or from other methods
#' @return A vector of intercept and the slope from the optimization result (Value section)
#' @details The method is specifically for object lad and can especially be used in abline () (Details section)
#' @export
#' @importFrom stats coef
#' @importFrom graphics plot abline
#' @examples
#' plot (area$land, area$farm)
#' abline (lm (area$farm~area$land), col = "black")
#' abline (coef(lad (x = area$land, y = area$farm)), col = "green")
#' legend (x = 0, y = 200000, c("fit linear model", "least absolute deviation"),lty = c(1,1), col = c(1, 3), cex = 0.5)
coef.lad = function (object, ...) {
  return  (c(object$coefficients[1], object$coefficients[2]))
}
