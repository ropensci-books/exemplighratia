if(!nzchar(Sys.getenv("REAL_REQUESTS"))) {
  Sys.setenv("GITHUB_PAT" = "foobar")
}
