#' getProductdf function
#'
#' The getProductdf API returns all of the queried products' features in a dataframe object easy for
#' data analysis. The result set contains the following attributes.
#'
#' @author Ting-An Lai, \email{tl2960@columbia.edu}
#' @param product_type the string of the type of makeup to be searched
#' @param brand the string of the brand of products to be searched
#' @param product_tags the string of product characteristics to be searched
#' @param ...
#' @details The function will print the reasonable amoung of envelope money
#' should each child receive in each family.
#' @return a dataframe of product and product feature the user queried
#' @example
#' getProductdf()
#' getProductdf(product_type="eyebrow")
#' getProductdf(product_type = 'blush', brand='nyx')
#' @import httr
#' @import jsonlite
#' @export


getProductdf <- function(product_type=NULL, brand=NULL, product_tags=NULL) {

  #making sure the parameters queried
  if (missing(brand)) {
    brand <- NULL
  }
  if (missing(product_tags)) {
    product_tags <- NULL
  }
  if (missing(product_type)) {
    product_type <- NULL
  }


  #construct working url
  param <- list(
    product_type=product_type,
    brand=brand,
    product_tags=product_tags
  )
  #get raw response from the url
  response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)


  #check status code to continute
  if (response$status_code != 200) {
    message_status <- paste0("The request returned the status code: ",
    response$status_code, ". Please check that the provided API key is correct.")
    return(warning(message_status))
  } else {

    #content the result (raw ->  format) as 'text': content(a, as='text')
    response_content <- httr::content(response, as='text')

    #format it into json
    json_content <- jsonlite::fromJSON(response_content)

    return(json_content)
  }

}


