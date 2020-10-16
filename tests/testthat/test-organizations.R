vcr::use_cassette("gh_organizations", {
  test_that("gh_organizations works", {
    testthat::expect_type(gh_organizations(), "character")
  })
})

test_that("gh_organizations errors when the API doesn't behave", {
  webmockr::enable()
  stub <- webmockr::stub_request("get", "https://api.github.com/organizations?since=1")
  webmockr::to_return(stub, status = 502)
  expect_error(gh_organizations(), "oops")
  webmockr::disable()
})
