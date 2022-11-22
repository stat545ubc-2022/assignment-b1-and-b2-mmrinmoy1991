#context("poten_logi_param")

testthat::test_that("Datatype Testing",{
  testthat::expect_true(is.character(poten_logi_param(apt_buildings)))
  testthat::expect_equal(poten_logi_param(vancouver_trees), c("assigned","root_barrier","curb"))
  testthat::expect_error(poten_logi_param(strings),"dataset must be of data.frame, tbl, tbl_df class")
  testthat::expect_error(poten_logi_param(numbers),"dataset must be of data.frame, tbl, tbl_df class")
  testthat::expect_error(poten_logi_param(vancouver_trees,1),"logical_factors must be a numeric and >=2")
})
