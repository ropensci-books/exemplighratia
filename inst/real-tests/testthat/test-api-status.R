with_mock_dir("gh_api_status", {
test_that("gh_api_status() works", {
  testthat::expect_type(gh_api_status(), "character")
  testthat::expect_equal(gh_api_status(), "operational")
})
})
