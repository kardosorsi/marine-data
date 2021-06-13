source("../../R/dropdown-module.R")

testServer(dropdownModuleServer, args = list(choices=c("one", "two", "three")), {
  session$setInputs(selectInput = "two")
  expect_equal(input$selectInput, "two")
})