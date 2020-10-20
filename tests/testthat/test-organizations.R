test_that("gh_organizations works", {

  if(!nzchar(Sys.getenv("REAL_REQUESTS"))) {
    app <- presser::new_app()
    app$get("/organizations", function(req, res) {
      res$send_json(
        jsonlite::read_json(
          testthat::test_path(
            file.path("responses", "organizations.json")
          )
        ),
        auto_unbox = TRUE
        )
    })
    web <-  presser::new_app_process(app)
    withr::defer(web$stop())
    Sys.setenv(EXEMPLIGHRATIA_GITHUB_API_URL = web$url())
  }

  testthat::expect_type(gh_organizations(), "character")
})
