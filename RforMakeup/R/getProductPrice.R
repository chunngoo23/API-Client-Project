#' Makeup function
#' This is a function for user to query makeup product information
#' with intuitive parameters and returned object to work with analysis
#' @author Ting-An Lai, \email{tl2960@columbia.edu}
#' @param product_type the string of the type of makeup to be searched
#' @param brand the string of the brand of products to be searched
#' @param product_tags the string of product characteristics to be searched
#' @param ...
#' @details The function will print the reasonable amoung of envelope money
#' should each child receive in each family.
#' @return a dataframe of product and product feature the user queried
#' @example
#' envelope(3, 4)
#' envelope(5, 5)
#' envelope(2, 2)
#' @import httr
#' @import jsonlite
#' @export

getProductPrice <-
