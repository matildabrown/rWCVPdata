
# rWCVPdata

<!-- badges: start -->
[![R-CMD-check](https://github.com/matildabrown/rWCVPdata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/matildabrown/rWCVPdata/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

rWCVPdata is a data package that redistributes snapshots of the World Checklist of Vascular Plants (WCVP) database so it is easier to load into R.

## Installation

rWCVPdata is not hosted on CRAN, but you can install it using:

```r
install.packages("rWCVPdata", repos=c("https://matildabrown.github.io/drat", "https://cloud.r-project.org"))
```

Or you can add our data repository to your repo list first:
```r
r <- getOption("repos")
r["matildabrown"] <- "https://matildabrown.github.io/drat"
options(repos=r)

install.packages("rWCVPdata")
```

You can install the latest development version of rWCVPdata from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("matildabrown/rWCVPdata")
```

## Citation

If you use rWCVPdata, please cite the snapshot of the database you used and the paper describing WCVP.

You can find out how to cite these by running:
``` r
citation("rWCVPdata")
```
