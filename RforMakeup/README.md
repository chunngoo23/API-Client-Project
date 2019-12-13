
## Installation

```r
## Install RforMakeup from GitHub:
devtools::install_github("chunngoo23/API-Client-Project/RforMakeup")
```
## Usage
This package includes two useful functions for user to query makeup product data from the API. 

### getProductDetail()
Having specific makeup product in mind that you want to understand its details? This function returns a clean output of products' detailed features of user's selections from the makeup product database. User can specifying whether you want to return the entire results with NULL returns all product features, a vector of items, or a single item with item="".

```r
library(RforMakeup)

#get the df for all eyebrow product details
eyebrow_df <- getProductDetail(product_type="eyebrow")

#get the df for all nyx blush product details
nyx_blush_df <- getProductDetail(product_type="blush", brand="nyx")

#get the hex value and price for all nyx blush products
nyx_blush_color_hex_price_df <- getProductDetail(product_type="blush", brand="nyx", items=c('price', 'product_colors_hexvalues'))

#example result
nyx_blush_color_hex_price_df
```

### getProductPrice()
```r
#get all products that are more expensive than $5.5 and has rating 2 in dataframe
price_5.5_rating_2_df <- getProductPrice(price=5.5, price_condition_operator="greater than", rating=2, rating_condition_operator="equal")
```
