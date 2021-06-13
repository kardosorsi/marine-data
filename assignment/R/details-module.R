# module for displaying detailed information
detailsModuleUI <- function(id) {
  ns <- NS(id)
  div(class="detail-wrapper",
      div(class="detail-element",
          "METERS SAILED",
          h4(class = "ui yellow header", textOutput(ns("distance")))
          ),
      div(class="detail-element",
          "OBSERVATION TIME",
          h4(class = "ui yellow header", textOutput(ns("measuredAt")))
          ),
      div(class="detail-element",
          "DESTINATION",
          h4(class = "ui yellow header", textOutput(ns("destination")))
          ),
      div(class="detail-element",
          "SPEED IN KNOTS",
          h4(class = "ui yellow header", textOutput(ns("speed")))
          )
      )
  }

detailsModuleServer <- function(id, sailed_m, date_obs, destination, speed) {
  moduleServer(
    id,
    function(input, output, session) {
      output$distance <- renderText({ sailed_m })
      output$measuredAt <- renderText({ date_obs })
      output$destination <- renderText({ destination })
      output$speed <- renderText({ speed })
    }
  )
}