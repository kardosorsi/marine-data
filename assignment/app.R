library(shiny)
library(shiny.semantic)
library(geosphere)
library(dplyr)
library(parallel)
library(iotools)
library(shinycssloaders)
library(leaflet)

source('styles.R')

# render layout
ui <- semanticPage(
  title="Marine data",
  tags$head(tags$style(HTML(css))),
  
  div(class="app-container",
      div(class="header",
          div(class="title-wrapper",
              h1(class = "ui header", "Marine data statistics"),
              div(class = "subtitle", "longest sails between consecutive observations"),
              ),
          div(class="input-wrapper",
              dropdownModuleUI("selectVesselType", "Select Vessel type"),
              dropdownModuleUI("selectVessel", "Select Vessel")
              )
          ),
      mapModuleUI("sailMap"),
      div(class = "ui horizontal divider", "Detailed information"),
      detailsModuleUI("detailCards"),
      div(class="made", "Assignemnt for the Shiny developer role @Appsilon, made by Orsolya Kardos")
      )
  )

# read ship data frame from rds file
ships_data_frame <- readRDS("ships-data-frame.rds")

# app server
server <- function(input, output, session) {
  
  # store the filtered data frame for optimization
  ships_filtered <- reactiveVal(data.frame())
  
  # selected type and vessel returned by the dropdown modules
  type_selection <- reactiveVal(NULL)
  vessel_selection <- reactiveVal(NULL)

  # fill the vessel type select choices if data is loaded
  observeEvent(length(ships_data_frame), {
    ship_types <- unique(ships_data_frame['ship_type'])$ship_type
    type_selection(dropdownModuleServer("selectVesselType", choices = ship_types))
  })
  
  # fill the vessel select choices if selected type is changed
  observe({
    type_selection
    filtered <- filter(ships_data_frame, ship_type == type_selection()())
    ships_filtered(filtered)
    
    ships <- unique(filtered['SHIPNAME'])$SHIPNAME
    vessel_selection(dropdownModuleServer("selectVessel", choices = ships))
  })
  
  # calculate the distance and render map and additional information on ship selection change
  observe({
     vessel_selection
    
     df <- filter(ships_filtered(), SHIPNAME == vessel_selection()())
     distances <- calculate_distance(df)
     max_m <- max(distances)
     max_id <- which.max(distances)
     
     detailsModuleServer("detailCards",
                         round(max_m),
                         strftime(df[max_id, c('DATETIME')], format="%Y-%m-%d %H:%m"),
                         df[max_id, c('DESTINATION')],
                         df[max_id, c('SPEED')])

     if (!is.na(max_m)) {
       mapModuleServer("sailMap", construct_coordinate_mtx(max_id, df))
     }
  })
}

shiny::shinyApp(ui, server)