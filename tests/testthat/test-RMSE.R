context("Test RMSE value")

test_that("Comparing calculated RMSE value against known value", {
  
  set.seed(1101, kind = NULL, normal.kind = NULL)
  M <- array(rnorm(10 * 5, mean = 0, sd = 1), c(10, 5))
  RMSE_calculated = simpleRegression(M)
  RMSE_reference = 0.395104575814913
  
  expect_lte(abs(RMSE_calculated - RMSE_reference), 1e-6)
})

