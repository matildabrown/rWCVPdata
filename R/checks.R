#' Functions to help check the WCVP data is okay and up to date.

#' View the version of WCVP available.
#'
#' @param long Whether to return the version date with version number.
#'
#' @importFrom glue glue
#'
#' @export
#'
#' @examples
#' wcvp_version()
#'
wcvp_version <- function(long=TRUE) {
  if (long) {
    glue::glue("Version {metadata$version} ({metadata$version_date})")
  } else {
    metadata$version
  }
}


#' Check if the packaged version of WCVP is up to date.
#'
#' @param silent Raise a warning if the version is out of date.
#'
#' @export
#'
#' @examples
#' wcvp_check_version()
#'
wcvp_check_version <- function(silent=FALSE) {
  latest_date <- get_upload_date_()
  up_to_date <- latest_date == metadata$upload_date

  if (! silent & ! up_to_date) {
    msg <- glue::glue("WCVP data not the most recent version!",
                      "Using {wcvp_version()} uploaded on {metadata$upload_date}.",
                      "Latest version was uploaded on {latest_date}.",
                      .sep="\n")
    warning(msg)
  }

  up_to_date
}
