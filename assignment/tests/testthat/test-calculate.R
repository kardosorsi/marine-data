source("../../R/calculate.R")
library(parallel)
library(geosphere)

test_that("Distance calculation works", {
  test_df <- data.frame(c(54.77127, 54.73847, 54.64617), c(18.99692, 18.97842, 18.92541))
  colnames(test_df) <- c("LAT", "LON")
  
  expect_equal(max(calculate_distance(test_df)), 10828.32)
})

test_that("Coordinate data frame creation works", {
  test_df <- data.frame(c(54.77127, 54.73847, 54.64617), c(18.99692, 18.97842, 18.92541))
  colnames(test_df) <- c("LAT", "LON")
  max_id <- 2
  equals_df <- data.frame(c(18.92541, 18.97842), c(54.64617, 54.73847), c("start", "end"))
  colnames(equals_df) <- c("longitude", "latitude", "type")
  
  expect_equal(construct_coordinate_mtx(max_id, test_df), equals_df)
})
