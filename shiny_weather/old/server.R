
library(shiny)
library(dplyr)
library(leaflet)

###############################################################

shinyServer(function(input, output) {

  finalMap <- reactive({
    
    time <- Sys.time()
    # popout current time (sys time)
    popup_time <- paste0("<h2><center><strong> </strong>", 
                          time)  
    
    # Create base map
    map <- leaflet() %>%
      addTiles() %>% 
      setView(10, 44, 4) %>%
      addPopups(38.01, 56.25, popup_time,
                options = popupOptions(closeButton = FALSE)) %>%
      addProviderTiles(as.character(input$variable), options = providerTileOptions(opacity = 0.35))
      
    # Return
    map
    
  })
  
  # Return to client
  output$myMap = renderLeaflet(finalMap())
  


})
