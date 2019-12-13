#' getProductDetail()
#'
#' @description Having specific makeup product in mind that you want to understand its details?
#' This function returns a clean output of products' detailed features of user's selections from the makeup database.
#' Specifying a  string or dataframe allows you to specify whether you want to return the entire results with NULL returns all product features, a vector of items, or a single item with item=""
#' Valid options for 'items=' include 'product_name', 'product_type', 'brand', 'product_tags', 'price', 'description', 'image',  'product_colors_hexvalues', and 'product_colors_name.'
#'
#' @author Ting-An Lai, \email{tl2960k@columbia.edu}
#' @param brand Defaults to NULL, you should enter a valid string of the brand you want to search.
#' @param product_type Defaults to NULL, you should enter a valid string of the type of makeup you want to search.
#' @param items Defaults to NULL, you could enter a vector of item strings or one item string to specify one specific feature you want to understand.
#' @param ...
#' @return An output of user's choice and queried products.
#' @examples
#' getProductDetail()
#' getProductDetail(product_type="eyebrow")
#' getProductDetail(product_type="blush", brand="nyx")
#' getProductDetail(product_type="blush", brand="nyx", items='product_colors_hexvalues')
#' getProductDetail(product_type="blush", brand="nyx", items=c('price', 'product_colors_hexvalues'))
#' @import httr
#' @import jsonlite
#' @import dplyr
#' @export


getProductDetail <- function(brand=NULL, product_type=NULL, items=NULL) {


  #construct working url
  param <- list(
    product_type=product_type,
    brand=brand
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

    #format it into json get the raw dataframe
    json_content <- jsonlite::fromJSON(response_content)

    #extract color hex value and color name in product_colors into two columns
    product_colors_hex_values <- list()
    product_colors_name <- list()

    for(i in 1: length(json_content$id)) {
      if(length(json_content$product_colors[[i]])==0){
        product_colors_hex_values[i] <- NULL
        #print (product_colors_hex_values)
      } else {
        product_colors_hex_values[i] <-json_content$product_colors[[i]][1]
        #print (product_colors_hex_values)
      }
    }

    for(i in 1: length(json_content$id)) {
      if(length(json_content$product_colors[[i]])==0){
        product_colors_name[[i]] <- NULL
      } else {
        product_colors_name[[i]] <-json_content$product_colors[[i]][2]
      }
    }

    #restructure json_content to a new dataframe
    json_content$product_colors_name <- sapply(product_colors_name, paste0, collapse=',')
    json_content$product_colors_hexvalues <- sapply(product_colors_hex_values, paste0, collapse=',')

    ### deal with output
    #### output format asked for df

      if(is.null(items)){
        return(json_content)
      } else {
        result <- json_content[items]
        return(result)
      }

    }
  }


