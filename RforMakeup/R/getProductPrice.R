#' getProdcutPrice()
#'
#' This is a function for user to query makeup product list according to product pricing and rating conditions
#' @author Ting-An Lai, \email{tl2960@columbia.edu}
#' @param price a number.
#' @param price_condition_operator what condition you're looking for, 'greater than', 'less than', 'equal'
#' @param rating a number
#' @param rating_condition_operator twhat condition you're looking for, 'greater than', 'less than', 'equal'
#' @param ...
#' @return a dataframe of product and product feature the user queried
#' @example
#' getProductPrice(price=5.5, price_condition_operator="greater than", rating=2, rating_condition_operator="equal")
#' getProductPrice(price=5.5)
#' getProductPrice(price=5.99, price_condition_operator="equal")
#' @import httr
#' @import jsonlite
#' @export

getProductPrice <- function(price=5.5, price_condition_operator="greater than", rating=2, rating_condition_operator="greater than") {
  #price=5.5
  #price_condition_operator="greater than"
  #rating=2
  #rating_condition_operator="greater than"
  price_url <- price-1
  rating_url <- rating-1
  index_equal <- c()


  #when price_condition == greater
  if(price_condition_operator == 'greater than') {
    if(rating_condition_operator == 'greater than') {
    param <- list(
      price_greater_than=price,
      rating_greater_than=rating)
    } else if (rating_condition_operator == 'less than') {
      param <- list(
        price_greater_than=price,
        rating_less_than=rating)
    } else {
      param <- list(
        price_greater_than=price,
        rating_greater_than=rating_url)
    }
  }


  #when price_condition == less
  if(price_condition_operator == 'less than') {
    if(rating_condition_operator == 'greater than') {
      param <- list(
        price_less_than=price,
        rating_greater_than=rating)
    } else if (rating_condition_operator == 'less than') {
      param <- list(
        price_less_than=price,
        rating_less_than=rating)
    } else {
      param <- list(
        price_less_than=price,
        rating_greater_than=rating_url)
    }
  }

  #when price_condition == equal
  if(price_condition_operator == 'equal') {
    if(rating_condition_operator == 'greater than') {
      param <- list(
        price_greater_than=price_url,
        rating_greater_than=rating)
    } else if (rating_condition_operator == 'less than') {
      param <- list(
        price_greater_than=price_url,
        rating_less_than=rating)
    } else {
      param <- list(
        price_greater_than=price_url,
        rating_greater_than=rating_url)
    }
  }


  response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

  #check status code
  if (response$status_code != 200) {
    message_status <- paste0("The request returned the status code: ",
                             response$status_code, ". Please check that the provided API key is correct.")
    return(warning(message_status))
  } else {

    #content the result (raw ->  format) as 'text': content(a, as='text')
    response_content <- httr::content(response, as='text')

    #format it into json get the raw dataframe
    json_content <- jsonlite::fromJSON(response_content)

    #only get relevant columns
    json_content_price <- json_content[c('id', 'brand', 'name', 'price_sign', 'price', 'currency', 'rating')]
    json_content_price$price <- as.numeric(json_content_price$price)

    index <- c(1:dim(json_content_price[1]))
    index_p <- c()
    index_r <- c()


    #check whether there are such price
    if (price_condition_operator=='equal') {
      if (!price %in% json_content_price$price ){
        message_eq <- paste0("There's no product in such price. Please check that you have a valid number.")
        return(warning(message_eq))
      }
    }

    if(rating_condition_operator=='equal'){
      if (!rating %in% json_content_price$rating ){
        message_eq <- paste0("There's no product in such rating score Please check that you have a valid rating score")
        return(warning(message_eq))
      }
    }




       if(price_condition_operator=='equal') {
         #extract the minimum column
         index_p <- which (json_content_price$price == price)
         }

    if(rating_condition_operator=='equal') {
      index_r <- which (json_content_price$rating == rating)
      #get the only rows we want
      }


    index_equal <- append(index_p, index_r)
    }


    #final return
    if (price_condition_operator=='equal' | rating_condition_operator=='equal') {
      return(json_content_price[index_equal,])
    } else {
      return(json_content_price[index,])
    }



}
