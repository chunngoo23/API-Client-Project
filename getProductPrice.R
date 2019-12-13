#' getProdcutPrice()
#'
#' This is a function for user to query makeup product list according to product pricing and rating conditions
#' @author Ting-An Lai, \email{tl2960@columbia.edu}
#' @param price a number.
#' @param price_condition_operator what condition you're looking for, 'greater than', 'less than', 'equal'
#' @param rating a number
#' @param rating_condition_operator twhat condition you're looking for, 'greater than', 'less than', 'equal'
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

getProductPrice <- function(price=5.5, price_condition_operator="greater than", rating=2, rating_condition_operator="greater than") {


  #construct working url
  ## condition one: price greater & rating greater
  if(price_condition_operator=='greater than') {

      if (rating_condition_operator=='greater than') {
          param <- list(
            price_greater_than=price,
            rating_greater_than=rating)

        response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

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
            json_content_price <- json_content[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
            return(json_content_price)


      ## condition two: price greater & rating less
      } else if (rating_condition_operator=='less than'){
        param <- list(
          price_greater_than=price,
          rating_less_than=rating)

        response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

        if (response$status_code != 200) {
          message_status <- paste0("The request returned the status code: ",
                                   response$status_code, ". Please check that the provided API key is correct.")
          return(warning(message_status))
        } else {

          #content the result (raw ->  format) as 'text': content(a, as='text')
          response_content <- httr::content(response, as='text')

          #format it into json get the raw dataframe
          json_content <- jsonlite::fromJSON(response_content)
          json_content_price <- json_content[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
          return(json_content_price)
      }
      } else {
        rating <- rating-0.1
        param <- list(
          price_greater_than=price,
          rating_greater_than=rating)

        response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

        if (response$status_code != 200) {
          message_status <- paste0("The request returned the status code: ",
                                   response$status_code, ". Please check that the provided API key is correct.")
          return(warning(message_status))
        } else {

          #content the result (raw ->  format) as 'text': content(a, as='text')
          response_content <- httr::content(response, as='text')

          #format it into json get the raw dataframe
          json_content <- jsonlite::fromJSON(response_content)

          #extract the minimum column
          index <- which (json_content$rating == min(json_content$rating, na.rm=T))

          #get the only rows we want
          equal_row <- json_content[index,]

          #only get relevant columns
          json_content_price <- equal_row[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
          return(json_content_price)
      }
      }
      }
    ##price less rating greater
  } else if(price_condition_operator=='less than') {

    if (rating_condition_operator=='greater than') {
      param <- list(
        price_less_than=price,
        rating_greater_than=rating)

      response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

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
        json_content_price <- json_content[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
        return(json_content_price)

        ## condition two: price less & rating less
      } else if (rating_condition_operator=='less than'){

        param <- list(
          price_less_than=price,
          rating_less_than=rating)

        response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

        if (response$status_code != 200) {
          message_status <- paste0("The request returned the status code: ",
                                   response$status_code, ". Please check that the provided API key is correct.")
          return(warning(message_status))
        } else {

          #content the result (raw ->  format) as 'text': content(a, as='text')
          response_content <- httr::content(response, as='text')

          #format it into json get the raw dataframe
          json_content <- jsonlite::fromJSON(response_content)
          json_content_price <- json_content[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
          return(json_content_price)
        }
        ##price less, rating equal
      } else {
        rating <- rating-0.1
        param <- list(
          price_less_than=price,
          rating_greater_than=rating)

        response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

        if (response$status_code != 200) {
          message_status <- paste0("The request returned the status code: ",
                                   response$status_code, ". Please check that the provided API key is correct.")
          return(warning(message_status))
        } else {

          #content the result (raw ->  format) as 'text': content(a, as='text')
          response_content <- httr::content(response, as='text')

          #format it into json get the raw dataframe
          json_content <- jsonlite::fromJSON(response_content)

          #extract the minimum column
          index <- which (json_content$rating == min(json_content$rating, na.rm=T))

          #get the only rows we want
          equal_row <- json_content[index,]

          #only get relevant columns
          json_content_price <- equal_row[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
          return(json_content_price)
        }
      }
    }

    #price equal
  }
  else {
    price <- price-0.01
    if (rating_condition_operator=='greater than') {
      param <- list(
        price_greater_than=price,
        rating_greater_than=rating)

      response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

      if (response$status_code != 200) {
        message_status <- paste0("The request returned the status code: ",
                                 response$status_code, ". Please check that the provided API key is correct.")
        return(warning(message_status))
      } else {

        #content the result (raw ->  format) as 'text': content(a, as='text')
        response_content <- httr::content(response, as='text')

        #format it into json get the raw dataframe
        json_content <- jsonlite::fromJSON(response_content)

        df_price <- as.numeric(json_content$price)
        index <- which (json_content$price == min(df_price, na.rm=T))
        equal_row <- json_content[index,]

        #only get relevant columns
        json_content_price <- equal_row[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
        return(json_content_price)

      } else if (rating_condition_operator=='less than'){
        param <- list(
          price_greater_than=price,
          rating_less_than=rating)

        response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

        if (response$status_code != 200) {
          message_status <- paste0("The request returned the status code: ",
                                   response$status_code, ". Please check that the provided API key is correct.")
          return(warning(message_status))
        } else {

          #content the result (raw ->  format) as 'text': content(a, as='text')
          response_content <- httr::content(response, as='text')

          #format it into json get the raw dataframe
          json_content <- jsonlite::fromJSON(response_content)

          index <- which (json_content$price == min(df_price, na.rm=T))
          equal_row <- json_content[index,]

          #only get relevant columns
          json_content_price <- equal_row[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
          return(json_content_price)

        } else {
      rating <- rating-0.01
      param <- list(
      price_greater_than=price,
      rating_greater_than=rating)

      response <- httr::GET("http://makeup-api.herokuapp.com/api/v1/products.json", query=param)

      if (response$status_code != 200) {
      message_status <- paste0("The request returned the status code: ",
                               response$status_code, ". Please check that the provided API key is correct.")
      return(warning(message_status))
    } else {

      #content the result (raw ->  format) as 'text': content(a, as='text')
      response_content <- httr::content(response, as='text')

      #format it into json get the raw dataframe
      json_content <- jsonlite::fromJSON(response_content)

      #extract the minimum column
      index <- which (json_content$price == min(df_price, na.rm=T))
      #extract the minimun column
      index_2 <- which(json_content$rating == min(json_content$rating, na.rm=T))

      index <- append(index, index_2)

      #get the only rows we want
      equal_row <- json_content[index,]

      #only get relevant columns
      json_content_price <- equal_row[c('id', 'brand', 'name', 'price_sign', 'price', 'currency')]
      return(json_content_price)

}

  }
      }
    }
  }
}


}


