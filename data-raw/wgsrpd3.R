## code to prepare `wgsrpd3` and derived datasets goes here
library(sf)
library(lwgeom)
library(dplyr)

# wgsrpd3 ----
shp_url <- "https://github.com/tdwg/wgsrpd/archive/refs/heads/master.zip"

# download and extract the folder
temp <- tempfile()
download.file(shp_url, temp)
unzip(temp)

# load level 3 shape file
wgsrpd3_orig <- st_read("wgsrpd-master/level3/level3.shp")

# clean up directory
unlink(temp)
unlink("wgsrpd-master", recursive=TRUE)

# before fixing the shape file doesn't work with spherical coordinates
sf_use_s2(FALSE)

wgsrpd3 <- st_buffer(wgsrpd3_orig, 0)
wgsrpd3 <- st_crop(wgsrpd3, st_bbox(c(xmin=-180, xmax=180, ymin=-90, ymax=90)))

usethis::use_data(wgsrpd3, overwrite=TRUE)

# pacific-centered ----
# lines for cutting polygons
meridian <- st_linestring(matrix(c(0,0,-90,90),nrow=2))
antimeridian <- st_linestring(matrix(c(-180,-180,-90,90),nrow=2))

# rectangles for checking where areas fall
westpoly <- st_polygon(list(matrix(c(-180,-180, -0.003, -0.003, -180, -90,90, 90, -90, -90),nrow=5)))
eastpoly <- st_polygon(list(matrix(c(180,180, 0.003, 0.003, 180, -90, 90, 90, -90, -90),nrow=5)))

westpoly2 <- st_polygon(list(matrix(c(-180,-180, -0.3, -0.3,-180, -90,90, 90, -90, -90),nrow=5)))

# function for splitting geometries and shifting
move_to_the_pacific <- function(geom) {
  crs <- st_crs(geom)
  is_west <- st_intersects(geom, westpoly, sparse=FALSE)
  is_east <- st_intersects(geom, eastpoly, sparse=FALSE)
  if (is_east[1] & is_west[1]) {
    geom <- st_collection_extract(st_split(geom, meridian))
    geom <- st_collection_extract(st_split(geom, antimeridian))

    is_west <- st_intersects(geom, westpoly2, sparse=FALSE)
  }
  shift_by <- cbind(is_west * 360, rep(0, length(is_west)))
  shift_by <- split(shift_by, 1:length(is_west))
  shift_by <- st_sfc(lapply(shift_by, st_point))

  shifted <- st_combine(geom + shift_by)
  st_set_crs(shifted, crs)
}

# shift geometries
shifted_geoms <- lapply(split(wgsrpd3$geometry, 1:nrow(wgsrpd3)), move_to_the_pacific)

# create pacific-centred map by replacing geometry
wgsrpd3_pacific <- wgsrpd3
st_geometry(wgsrpd3_pacific) <- do.call(c, shifted_geoms)

usethis::use_data(wgsrpd3_pacific, overwrite=TRUE)

# coast-line ----

coast <- st_union(wgsrpd3_orig)
coast <- smoothr::fill_holes(coast, threshold=units::set_units(1000, km^2))

# clean up like we did the original shapes
coast <- st_buffer(coast, 0)
coast <- st_crop(coast, st_bbox(c(xmin=-180, xmax=180, ymin=-90, ymax=90)))

usethis::use_data(coast, overwrite=TRUE)

# pacific-centred coast-line ----

coast_pacific <- st_union(wgsrpd3_pacific)
coast_pacific <- smoothr::fill_holes(coast_pacific, threshold=units::set_units(1000, km^2))

usethis::use_data(coast_pacific, overwrite=TRUE)
