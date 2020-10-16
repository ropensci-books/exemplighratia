with_mock_dir("gh_organizations", {
test_that("gh_organizations works", {
  testthat::expect_type(gh_organizations(), "character")
})
})
