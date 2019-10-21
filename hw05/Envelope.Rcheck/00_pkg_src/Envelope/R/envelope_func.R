#' Envelope function
#'
#' This is a function that helps you decide how much envelope money each child
#' should receive in each family reasonably and fairly.
#' @param x number of children in x family
#' @param y number of children in y family
#' @param ... number of more children in other families
#' @details The function will print the reasonable amoung of envelope money
#' should each child receive in each family.
#' @return a vector of envelope money for x and y family
#' @example
#' envelope (3,4)
#' envelope (5,5)
#' envelope (2,2)
#' @export


envelope <- function(x=4, y=4, ...) {
  a = max (x, y)
  b = min (x, y)
  gcd = 1

  if (a==b) {
    print ("each child receive $1000 in envelope")
    return (1000)
    } else {

      while (b==TRUE) {
      a = b
      b = a%%b
      gcd = a
      }

    ap = x/gcd
    bp = y/gcd
    lcm = ap*bp*gcd*300
    xreceive = lcm/ap
    yreceive = lcm/bp

    print (paste0("In x family, each child receive $", xreceive))
    print (paste0("In y family, each child receive $", yreceive))
    }
  ab = c(xreceive, yreceive)
  return (ab)
}

