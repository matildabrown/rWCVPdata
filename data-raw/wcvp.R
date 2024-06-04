## code to download the latest WCVP name and distribution tables and record version
## re-run this to update the WCVP data when there is a new release
## REMEMBER TO UPDATE THE DOCS IF THE DATA STRUCTURE HAS CHANGED

library(httr)
library(rvest)
library(stringr)
library(readr)
library(readxl)
library(lubridate)
library(glue)

# download save wcvp data ----
base_url <- "http://sftp.kew.org/pub/data-repositories/WCVP/"
zip_url <- paste0(base_url, "wcvp.zip")

# if site down, use emergency script to update (not part of package)
# or wait until site is back up

# download to temporary place and extract
temp <- tempfile()
download.file(zip_url, temp)
unzip(temp, exdir="wcvp-files")

# load and save the names file
wcvp_names <- read_delim("wcvp-files/wcvp_names.csv", delim="|", quote="")
usethis::use_data(wcvp_names, compress="xz", overwrite=TRUE)

# load and save the distributions file
wcvp_distributions <- read_delim("wcvp-files/wcvp_distribution.csv", delim="|", quote="")
usethis::use_data(wcvp_distributions, compress="xz", overwrite=TRUE)

# extract metadata ----
# get info from README spreadsheet
version <- read_xlsx("wcvp-files/README_WCVP.xlsx", range="A7", col_names="version")$version
version <- str_extract(version, "\\d+")

citation <- read_xlsx("wcvp-files/README_WCVP.xlsx", range="A4", col_names="cite")$cite
cite_date <- str_extract(citation, "(?<=accessed )\\d+ [A-Z][a-z]+ \\d{4}")

table_info <- read_xlsx("wcvp-files/README_WCVP.xlsx", range="A11", col_names="info")$info
table_rows <- str_extract(table_info, "[\\d\\,]+(?= rows)")
table_cols <- str_extract(table_info, "[\\d\\,]+(?= columns)")

# Parse upload date from SFPT server site
r <- GET(base_url)
page <- httr::content(r)

table_node <- html_node(page, "pre")
table_text <- html_text(table_node)

table_lines <- str_split(table_text, "\n")[[1]]

wcvp_line <- table_lines[str_detect(table_lines, "wcvp.zip")]
upload_date <- str_extract(wcvp_line, "\\d{4}-\\d{2}-\\d{2}")

# save to internal data file
metadata <- list(
  version=as.numeric(version),
  version_date=cite_date,
  name_rows=as.numeric(str_remove_all(table_rows, "\\,")),
  name_col=as.numeric(table_cols),
  upload_date=upload_date,
  citation=citation
)

usethis::use_data(metadata, internal=TRUE, overwrite=TRUE)

# update citation file ----
citation_file <- "inst/CITATION"

citation_text <- readLines(citation_file)

i <- which(str_detect(citation_text, "(?=snapshot_date \\<\\- )"))
citation_text[i] <- paste0("snapshot_date <- '",cite_date, "'")

i <- which(str_detect(citation_text, "(?<=snapshot_version \\<\\- )"))
citation_text[i] <- paste0("snapshot_version <- ", version)

writeLines(citation_text, citation_file)

# clean up directory ----
unlink(temp)
unlink("wcvp-files", recursive=TRUE)
