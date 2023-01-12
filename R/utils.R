#' Utility functions for checking the WCVP data

#' Get the latest upload date of WCVP to SFTP server.
#'
#' @noRd
get_upload_date_ <- function() {
  r <- httr::GET("http://sftp.kew.org/pub/data-repositories/WCVP/")
  page <- httr::content(r)

  table_node <- rvest::html_node(page, "pre")
  table_text <- rvest::html_text(table_node)

  table_lines <- stringr::str_split(table_text, "\n")[[1]]

  wcvp_line <- table_lines[stringr::str_detect(table_lines, "wcvp.zip")]
  upload_date <- stringr::str_extract(wcvp_line, "\\d{4}-\\d{2}-\\d{2}")
}
