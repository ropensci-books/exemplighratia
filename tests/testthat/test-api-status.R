vcr::use_cassette("gh_api_status", {
  test_that("gh_api_status() works", {
    testthat::expect_type(gh_api_status(), "character")
  })
})
