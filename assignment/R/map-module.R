# module for rendering the map
mapModuleUI <- function(id) {
  ns <- NS(id)
  div(class="map-container",
      div(class="legend-container",
          div(class="legend-indicator-start"),
          "Start",
          div(class="legend-indicator-end"),
          "End"
          ),
      leafletOutput(ns("map")) %>% withSpinner(color="orange")
      )
}

mapModuleServer <- function(id, coordinates) {
  moduleServer(
    id,
    function(input, output, session) {
      
      pal <- colorFactor(c("purple", "orange"), domain = c("start", "end"))
      
      output$map <- renderLeaflet({
        leaflet(data = coordinates) %>%
          addTiles() %>%
          addCircleMarkers(
            ~longitude,
            ~latitude,
            radius = ~ifelse(type == "start", 10, 6),
            color = ~pal(type),
            stroke = FALSE,
            fillOpacity = 0.5
          )
      })
    }
  )
}