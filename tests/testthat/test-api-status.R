test_that("gh_api_status() works", {
  vcr::use_cassette("gh_api_status", {
    status <- gh_api_status()
  })
  testthat::expect_type(status, "character")
})
