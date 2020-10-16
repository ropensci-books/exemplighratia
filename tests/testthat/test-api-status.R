test_that("gh_api_status() works", {
  if(!nzchar(Sys.getenv("REAL_REQUESTS"))) {
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
    web <-  presser::new_app_process(app)
    withr::defer(web$stop())
    Sys.setenv(EXEMPLIGHRATIA_GITHUB_STATUS_URL = web$url())
  }

  testthat::expect_type(gh_api_status(), "character")
})

test_that("gh_api_status() errors when the API does not behave", {
  app <- presser::new_app()
  app$get("/", function(req, res) {
    res$set_status(502L)$send_json(NULL)
  })
  web <-  presser::new_app_process(app)
  withr::defer(web$stop())
  Sys.setenv(EXEMPLIGHRATIA_GITHUB_STATUS_URL = web$url())

  testthat::expect_error(gh_api_status(), "ouch")
})
