
#' Check that rWCVP is using the latest version of the World Checklist
#' @param silent Logical. If FALSE, function prints the version status to
#' console. If TRUE, function returns either TRUE (if version up to date) or
#' FALSE (if version not up to date), for use in warnings. Defaults to FALSE.
#' @param test Logical. Defaults to FALSE. Only used for testing, should not be changed.
#' @export
#'
#' @examples check_wcvp_version()
#'
check_wcvp_version <- function(silent=FALSE, test=FALSE){
  if(test==TRUE){
    packageversionurl <- "http://sftp.kew.org/pub/data-repositories/WCVP/wcvp_v6_sep_2021.zip"
  } else {
  packageversionurl <- "http://sftp.kew.org/pub/data-repositories/WCVP/wcvp_v7_dec_2021.zip"
  }
  recentversionurl <- wcvp_download_url_()
  if(silent==FALSE){
  if(packageversionurl==recentversionurl) {
    message("WCVP data up to date - using the most recent release (December 2021; v7)")
  } else {
    message(paste0("WCVP data not the most recent version - package dataset
                   downloaded from ",packageversionurl, " but most recent version available from ", recentversionurl ))
  }
  } else {
    return(packageversionurl==recentversionurl)
  }

}


#' Get a WCVP download URL.
#'
#' @importFrom httr GET
#' @importFrom rvest html_nodes html_attr
#' @importFrom stringr str_detect str_extract
#' @importFrom glue glue
#'
#' @noRd
wcvp_download_url_ <- function(version=NULL) {
  base <- "http://sftp.kew.org/pub/data-repositories/WCVP/"
  response <- GET(base)

  page <- httr::content(response)
  link_nodes <- html_nodes(page, "a")
  links <- html_attr(link_nodes, "href")

  download_links <- links[str_detect(links, "\\.zip$")]
  versions <- str_extract(download_links, "(?<=_v)\\d+")

  if (is.null(version)) {
    version <- max(versions)
  }

  if (! version %in% versions) {
    message <- glue("Not a recognised version of WCVP: {version}",
                    "Available versions: {paste0(versions, collapse=',')}",
                    "",
                    .sep="\n", .trim=FALSE)

    stop(message, call.=FALSE)
  }

  download_link <- download_links[str_detect(download_links, paste0("_v", version))]
  paste0(base, download_link)
}
