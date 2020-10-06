status_url <- function() {
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
  httr::stop_for_status(response)

  # Parse the content
  content <- httr::content(response)

  # Extract the part about the API status
  components <- content$components
  api_status <- components[purrr::map_chr(components, "name") == "API Requests"][[1]]

  # Return status
  api_status$status

}
