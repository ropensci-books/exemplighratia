gh_v3_url <- function() {

  api_url <- Sys.getenv("EXEMPLIGHRATIA_GITHUB_API_URL")

  if (nzchar(api_url)) {
    return(api_url)
  }

  "https://api.github.com/"
}

#' GitHub organizations
#'
#' @description Get logins of GitHub organizations.
#'
#' @param since The integer ID of the last organization that you've seen.
#'
#' @return A character vector of at most 30 elements.
#' @export
#'
#' @details Refer to https://developer.github.com/v3/orgs/#list-organizations
#'
#' @examples
#' \dontrun{
#' gh_organizations(since = 42)
#' }
gh_organizations <- function(since = 1) {
  url <- httr::modify_url(
    gh_v3_url(),
    path = "organizations",
    query = list(since = since)
    )

  token <- Sys.getenv("GITHUB_PAT")

  if (!nchar(token)) {
    stop("No token provided! Set up the GITHUB_PAT environment variable please.")
  }

  response <- httr::RETRY(
    "GET",
    url,
    httr::add_headers("Authorization" = paste("token", token))
  )

  httr::stop_for_status(response)

  content <- httr::content(response)

  purrr::map_chr(content, "login")

}
