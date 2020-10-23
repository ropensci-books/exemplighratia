fake_pat <- function() {
  withr::local_envvar(
    new = c("GITHUB_PAT" = "foobar")
  )
}

library(httptest)
