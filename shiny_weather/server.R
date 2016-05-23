
library(shiny)
library(dplyr)
library(leaflet)

###############################################################

shinyServer(function(input, output) {

  finalMap <- reactive({
    
 #   base <- input$variable
    
    # Create base map
    map <- leaflet() %>%
      addTiles() %>% 
      setView(10, 44, 4) %>%
      addProviderTiles(as.character(input$variable), options = providerTileOptions(opacity = 0.35))
      
    # Return
    map
    
  })
  
  # Return to client
  output$myMap = renderLeaflet(finalMap())
  


})
