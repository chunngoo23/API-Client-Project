#' Envelope function
#'
#' This is a function that helps you decide how much envelope money each child should receive in each family reasonably and fairly.
#' @param number of children in x family
#' @param number of children in y family
#' @details The function will print the reasonable amoung of envelope money should each child receive in each family.
#' @example
#' envelope (3,4)
#' envelope (5,5)
#' envelope (2,2)
#' @export
#' Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

envelope <- function(x=4, y=4, ...) {
  a = max (x, y)
  b = min (x, y)
  gcd = 1

  if (a==b) {
    print ("each child receive $1000 in envelope")
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

}

