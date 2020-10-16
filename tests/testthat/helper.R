with_mock_dir <- function(dir, ...) {
  dir <- testthat::test_path(dir)
  current_mockPaths <- httptest::.mockPaths()
  httptest::.mockPaths(dir)
  if (dir.exists(dir)) {
    ## We already have recorded, so use the fixtures
    withr::with_envvar(
      new = c("GITHUB_PAT" = "foobar"),
      httptest::with_mock_api(...)
    )
  } else {
    ## Record!
    httptest::capture_requests(...)
  }
  httptest::.mockPaths(NULL)
  httptest::.mockPaths(current_mockPaths)
}

library(httptest)
