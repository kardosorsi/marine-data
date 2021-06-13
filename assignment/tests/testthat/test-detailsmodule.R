source("../../R/details-module.R")
library(shiny)

testServer(detailsModuleServer, args = list(id="module_id", sailed_m=1232, date_obs="2021-06-11 12:45", destination="ROTTERDAM", speed=8), {
  expect_equal(output$distance, "1232")
  expect_equal(output$measuredAt, "2021-06-11 12:45")
  expect_equal(output$destination, "ROTTERDAM")
  expect_equal(output$speed, "8")
})
