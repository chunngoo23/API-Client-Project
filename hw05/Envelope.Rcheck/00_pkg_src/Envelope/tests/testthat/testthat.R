library(testthat)
library(Envelope)


# Test for equality:
expect_equal(envelope(4,2), c(600, 1200))

# Unit Test for lintr()
if (requireNamespace("lintr", quietly = TRUE)) {
  context("lints")
  test_that("Package Style", {
    lintr::expect_lint_free()
  })
}

