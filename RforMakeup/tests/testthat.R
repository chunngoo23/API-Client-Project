library(testthat)
library(RforMakeup)
library(stringr)
test_check("RforMakeup")


context("String length")

test_that("str_length is number of characters", {
  expect_equal(str_length("a"), 1)
  expect_equal(str_length("ab"), 2)
  expect_equal(str_length("abc"), 3)
})

test_that("str_length of factor is length of level", {
  expect_equal(str_length(factor("a")), 1)
  expect_equal(str_length(factor("ab")), 2)
  expect_equal(str_length(factor("abc")), 3)
})

test_that("str_length of missing is missing", {
  expect_equal(str_length(NA), NA_integer_)
  expect_equal(str_length(c(NA, 1)), c(NA, 1))
  expect_equal(str_length("NA"), 2)
})

# Unit Test for lintr()
if (requireNamespace("lintr", quietly = TRUE)) {
  context("lints")
  test_that("Package Style", {
    lintr::expect_lint_free()
  })
}

# Test for equality:
expect_equal(10, 10)

# Match a character vector against a regular expression.
string <- "Testing is fun!"
expect_match(string, "testing")

# Checks that object is from particular class
model <- lm(mpg ~ wt, data = mtcars)
expect_is(model, "lm")
