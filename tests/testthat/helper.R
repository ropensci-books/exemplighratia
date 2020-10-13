Sys.setenv(RECORDING = FALSE)

if (Sys.getenv("RECORDING")) {
  with_mock_api <- httptest::capture_requests
} else {
  Sys.setenv("GITHUB_PAT" = "foobar")
}

library(httptest)
