#' Least Absolute Deviation Regression
#'
#' Use the Nelder-Mead method to find the minimum absolute square of the data
#' @param x A numeric vector
#' @param y A numeric vector
#' @param beta A numeric vector
#' @return A list of coefficients, fitted values, and residuals from the optimization of least absolute square
#' @details The returned list is a list consists of three vectors, including coefficients which returns the optimized intercept and slop, fitted value which returns the predict value that can create least absolute deviation, and a residual vector
#' @export
#' @importFrom stats lm optim
#' @examples
#' lad(x= area$land, y = area$farm)
#'
lad = function (beta, x, y){

  SSE.f = function (beta, x, y) {
    SSE = sum (abs (y - beta[1] - beta[2]*x))
    return (SSE)
  }

  m = lm (y~x)

  out.1 = optim( par = c(m$coefficients[1], m$coefficients[2]), fn = SSE.f, x = x, y=y)

   return.lad = list (coefficients = c(out.1$par[1], out.1$par[2]),
                      fitted.values = out.1$value,
                     residuals = y - out.1$value)

  print (return.lad)
  class(return.lad) = "lad"
  return (return.lad)

}
