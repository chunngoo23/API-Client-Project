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
#' getProductDetail(product_type="blush, brand="nyx")
#' getProductDetail(product_type="blush, brand="nyx", items='product_colors_hexvalues')
#' getProductDetail(product_type="blush, brand="nyx", items=c('price', 'product_colors_hexvalues'))
#' @import httr
#' @import jsonlite
#' @import dplyr
#' @export
#'

df <- getProductPrice(price=10, price_condition_operator="greater than", rating=3, rating_condition_operator="less than")


