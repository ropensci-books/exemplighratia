vcr::use_cassette("organizations", {
test_that("gh_organizations works", {

  testthat::expect_message(foo <- gh_organizations(), "Retrying")

  testthat::expect_type(foo, "character")
})
})
