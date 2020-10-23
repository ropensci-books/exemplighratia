test_that("gh_api_status() works", {
  testthat::expect_type(gh_api_status(), "character")
})
