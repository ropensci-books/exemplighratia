vcr::use_cassette("gh_organizations", {
  test_that("gh_organizations works", {
    testthat::expect_type(gh_organizations(), "character")
  })
})
