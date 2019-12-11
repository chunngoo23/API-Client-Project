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


getProductdf <- function(product_type, brand=NULL, product_tags=NULL) {

  #making sure the parameters queried
  if (missing(brand)) {
    brand <- NULL
  }
  if (missing(product_tags)) {
    product_tags <- NULL
  }
  if (missing(output)) {
    output <- NULL
  }
  if (missing(item)) {
    item <- NULL
  }

  #construct working url
  param <- list(
    product_type=product_type,
    brand=brand,
    product_tags=product_tags
  )
  response <- GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)


  #check status code to continute
  response$status_code
  #get raw response from the url

  #content the result (raw ->  format) as 'text': content(a, as='text')
  response_content <- content(response, as='text')
  #jsonlite::fromJSON(a)
  json_content <- fromJSON(response_content)
  #dplyr::glimpse(a_from_json) let you know the summary of the data



}


