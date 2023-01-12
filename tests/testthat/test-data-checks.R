test_that("name rows match metadata", {
  expect_equal(nrow(wcvp_names), metadata$name_rows)
})

test_that("name columns match metadata", {
  expect_equal(ncol(wcvp_names), metadata$name_col)
})

test_that("using latest version", {
  latest <- wcvp_check_version(silent=TRUE)
  expect_true(latest)
})
