
#' Check that rWCVP is using the latest version of the World Checklist
#' @param silent Logical. If FALSE, function prints the version status to
#' console. If TRUE, function returns either TRUE (if version up to date) or
#' FALSE (if version not up to date), for use in warnings. Defaults to FALSE.
#' @param test Logical. Defaults to FALSE. Only used for testing, should not be changed.
#' @export
#'
#' @examples check_wcvp_version()
#'
check_wcvp_version <- function(silent=FALSE){

  #this is the name it will have when archived
  packageversion <- "wcvp_v10_oct_2022.zip"

  archivedversions <- wcvp_archive_versions_()
  if(silent==FALSE){
  if(!packageversion %in% archivedversions) {
    message("WCVP data up to date - using the most recent release (October 2022; v10)")
  } else {
    message(paste0("WCVP data not the most recent version - package dataset
                   matches ",packageversion, " but most recent version available from http://sftp.kew.org/pub/data-repositories/WCVP/wcvp.zip" ))
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


#' Get the archived version links of WCVP.
#'
#' @importFrom httr GET
#' @importFrom rvest html_nodes html_attr
#' @importFrom stringr str_detect
#'
#' @noRd
wcvp_archive_versions_ <- function() {

  # from archive
  base <- "http://sftp.kew.org/pub/data-repositories/WCVP/Archive/wcvp_webapp_oct_2019_to_jun_2022/"
  response <- GET(base)

  page <- httr::content(response)
  link_nodes <- html_nodes(page, "a")
  links <- html_attr(link_nodes, "href")

  download_links1 <- links[str_detect(links, "\\.zip$")]


  # from webapp archive

  base <- "http://sftp.kew.org/pub/data-repositories/WCVP/Archive/wcvp_webapp_oct_2019_to_jun_2022/"
  response <- GET(base)

  page <- httr::content(response)
  link_nodes <- html_nodes(page, "a")
  links <- html_attr(link_nodes, "href")

  download_links2 <- links[str_detect(links, "\\.zip$")]

return(c(download_links1, download_links2))


}
