#' Predict optimized y value
#' 
#' A function that generate predicted value according to lad optimization
#' @param object A lad object
#' @param new.x A number vector
#' @param ... further arguments passed to or from other methods
#' @return A vector of predicted value 
#' @details Enter a vector of independent values and a lad object, the predict.lad function will return predicted values according to the optimized least absolute deviation regression
#' @export
#' @importFrom graphics plot points
#' @examples
#' plot (area$land, area$farm)
#' points( x = quantile(area$land), y = predict(lad (x = area$land, y = area$farm), quantile(area$land)), col = "green" )
#' 
predict.lad = function (object, new.x, ...) {
  p = c(object$coefficients[1] + object$coefficients[2] * new.x)
 print (p)
}
