
library(shiny)
library(dplyr)
library(leaflet)

###############################################################

shinyServer(function(input, output) {

  finalMap_rain <- reactive({
    map_rain <- leaflet() %>%
      addTiles() %>% 
      setView(18, 38, 4) %>%
     # addProviderTiles("Stamen.TonerBackground", options = providerTileOptions(opacity = 1)) %>%
      addProviderTiles("OpenWeatherMap.Rain", options = providerTileOptions(opacity = 0.35))
  })
  
  finalMap_temperature <- reactive({
    map_temperature <- leaflet() %>%
      addTiles() %>% 
      setView(18, 38, 4) %>%
      addProviderTiles("OpenWeatherMap.Temperature", options = providerTileOptions(opacity = 0.35))
  })
  
  
  finalMap_clouds <- reactive({
    map_clouds <- leaflet() %>%
    #  addTiles() %>% 
      setView(18, 38, 4) %>%
      addProviderTiles("Thunderforest.TransportDark", options = providerTileOptions(opacity = 1)) %>%
      addProviderTiles("OpenWeatherMap.Clouds", options = providerTileOptions(opacity = 0.35))
  })
  
  
  finalMap_wind <- reactive({
    map_wind <- leaflet() %>%
      addTiles() %>% 
      setView(18, 38, 4) %>%
      addProviderTiles("OpenWeatherMap.Wind", options = providerTileOptions(opacity = 0.35))
  })
  
  finalMap_pressure <- reactive({
    map_pressure <- leaflet() %>%
      addTiles() %>% 
      setView(18, 38, 4) %>%
      addProviderTiles("OpenWeatherMap.PressureContour", options = providerTileOptions(opacity = 0.35))
  })
  
  finalMap_AOD <- reactive({
    map_AOD <- leaflet() %>%
      addTiles() %>% 
      setView(18, 38, 4) %>%
      addProviderTiles("NASAGIBS.ModisTerraAOD", options = providerTileOptions(opacity = 0.35))
  })
  
  finalMap_Chlorophyll <- reactive({
    map_Chlorophyll <- leaflet() %>%
      addTiles() %>% 
      setView(18, 38, 4) %>%
      addProviderTiles("NASAGIBS.ModisTerraChlorophyll", options = providerTileOptions(opacity = 0.35))
  })
  
  # Return to client
  output$myMap_rain = renderLeaflet(finalMap_rain())
  output$myMap_temperature = renderLeaflet(finalMap_temperature())
  output$myMap_clouds = renderLeaflet(finalMap_clouds())
  output$myMap_wind = renderLeaflet(finalMap_wind())
  output$myMap_pressure = renderLeaflet(finalMap_pressure())
  output$myMap_AOD = renderLeaflet(finalMap_AOD())
  output$myMap_Chlorophyll = renderLeaflet(finalMap_Chlorophyll())
  

  
  

})
