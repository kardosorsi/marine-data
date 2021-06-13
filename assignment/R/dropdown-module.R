# module for the two select inputs
dropdownModuleUI <- function(id, label) {
  ns <- NS(id)
  selectInput(
    inputId = ns("selectInput"),
    label = label,
    choices = "",
    selected = "",
    width = 350
  )
}

dropdownModuleServer <- function(id, choices) {
  moduleServer(
    id,
    function(input, output, session) {
      updateSelectInput(session = session, inputId = "selectInput", choices = choices)
      return(reactive(input$selectInput))
    }
  )
}
