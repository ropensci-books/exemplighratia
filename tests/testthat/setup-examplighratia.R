library("vcr")

vcr_dir <- "../fixtures"

if (!nzchar(Sys.getenv("GITHUB_PAT"))) {
  if (dir.exists(vcr_dir)) {
    Sys.setenv("GITHUB_PAT" = "foobar")
  } else {
    stop("No API key nor cassettes, tests cannot be run.",
         call. = FALSE)
  }
}

invisible(vcr::vcr_configure(
  dir = vcr_dir,
  filter_request_headers = list(Authorization = "My bearer token is safe")
))
