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
  filter_sensitive_data = list("<<github_api_token>>" = Sys.getenv('GITHUB_PAT'))
))
