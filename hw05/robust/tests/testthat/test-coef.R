test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
test()

model <- lad(mpg ~ wt, data = mtcars)
expect_is(model, "lad")
