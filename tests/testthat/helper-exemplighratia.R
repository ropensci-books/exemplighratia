library("vcr")
invisible(vcr::vcr_configure(
  dir = "../fixtures",
  filter_sensitive_data = list("<<github_api_token>>" = Sys.getenv('GITHUB_PAT'))
))
vcr::check_cassette_names()
