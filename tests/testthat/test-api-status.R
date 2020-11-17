test_that("gh_api_status() works", {
  vcr::use_cassette("error-status", {
    testthat::expect_error(gh_api_status())
  })

})
