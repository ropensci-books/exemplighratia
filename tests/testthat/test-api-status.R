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
    mockery::stub(
      where = gh_api_status,
      what = "status_url",
      how = web$url
    )
  }

  testthat::expect_type(gh_api_status(), "character")
})
