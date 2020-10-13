Sys.setenv(RECORDING = FALSE)

if (Sys.getenv("RECORDING")) {
  with_mock_api <- httptest::capture_requests
}

library(httptest)
