with_mock_dir <- function(dir, ...) {
  dir <- testthat::test_path(dir)
  httptest::.mockPaths(dir)
  if (dir.exists(dir)) {
    ## We already have recorded, so use the fixtures
    Sys.setenv("GITHUB_PAT" = "foobar")
    httptest::with_mock_api(...)
  } else {
    ## Record!
    httptest::capture_requests(...)
  }
}

library(httptest)
