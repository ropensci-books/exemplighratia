test_that("gh_api_status() works", {
  if (!nzchar(Sys.getenv("REAL_REQUESTS"))) {
   app <- presser::new_app()
      app$get("/", function(req, res) {
        res$send_json(
          list( components =
          list(
            list(
            name = "API Requests",
            status = "operational"
            )
          )
          ),
          auto_unbox = TRUE
        )
      })
    web <-  presser::local_app_process(app)
    web$local_env(list(EXEMPLIGHRATIA_GITHUB_STATUS_URL = "{url}"))
    web$start()
  }

  testthat::expect_type(gh_api_status(), "character")
})

test_that("gh_api_status() errors when the API does not behave", {
  app <- presser::new_app()
  app$get("/", function(req, res) {
    res$send_status(502L)
  })
  web <-  presser::local_app_process(app)
  web$local_env(list(EXEMPLIGHRATIA_GITHUB_STATUS_URL = "{url}"))
  web$start()
  testthat::expect_error(gh_api_status(), "ouch")
})
