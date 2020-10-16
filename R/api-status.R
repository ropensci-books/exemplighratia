status_url <- function() {

  env_url <- Sys.getenv("EXEMPLIGHRATIA_GITHUB_STATUS_URL")

  if(nzchar(env_url)) {
    return(env_url)
  }

  "https://kctbh9vrtdwd.statuspage.io/api/v2/components.json"
}

#' GitHub APIs status
#'
#' @description Get the status of requests to GitHub APIs
#'
#' @return A character vector, one of "operational", "degraded_performance",
#' "partial_outage", or "major_outage."
#'
#' @details See details in https://www.githubstatus.com/api#components.
#' @export
#'
#' @examples
#' \dontrun{
#' gh_api_status()
#' }
gh_api_status <- function() {
  response <- httr::GET(status_url())

  # Check status
  httr::stop_for_status(response, "get API status, ouch!")

  # Parse the content
  content <- httr::content(response)

  # Extract the part about the API status
  components <- content$components
  api_status <- components[purrr::map_chr(components, "name") == "API Requests"][[1]]

  # Return status
  api_status$status

}
