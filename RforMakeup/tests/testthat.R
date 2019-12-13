library(testthat)
library(RforMakeup)

test_check("RforMakeup")


# Unit Test for lintr()
if (requireNamespace("lintr", quietly = TRUE)) {
  context("lints")
  test_that("Package Style", {
    lintr::expect_lint_free()
  })
}


# test for output type
expect_type(getProductPrice(price=5.99, price_condition_operator="equal"), type = "list")
expect_type(getProductDetail(product_type="blush", brand="nyx", items=c('price', 'product_colors_hexvalues')), type = "list")
