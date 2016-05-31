
library(dplyr)
library(leaflet)
library(htmlwidgets)

# setwd("C:/RICARDO-AEA/PostgreSQL_Gibraltair")
setwd("C:/Worldmet")

m <- leaflet() %>%
  setView(10, 44, 4) %>%
  addTiles(group = "OSM (default)") %>%
  # addProviderTiles("Stamen.TonerLite") %>%
  addProviderTiles("OpenWeatherMap.Rain", group = "Rain", options = providerTileOptions(opacity = 0.35)) %>%
  addProviderTiles("OpenWeatherMap.Clouds", group = "Clouds",  options = providerTileOptions(opacity = 0.75)) %>%
  addProviderTiles("Thunderforest.Transport", group = "Transport",  options = providerTileOptions(opacity = 1)) %>%
  addProviderTiles("OpenWeatherMap.Temperature", group = "Temperature", options = providerTileOptions(opacity = 0.35)) %>%
  addProviderTiles("OpenWeatherMap.PressureContour", group = "Pressure", options = providerTileOptions(opacity = 1)) %>%
  addProviderTiles("NASAGIBS.ModisTerraAOD", group = "AOD",  options = providerTileOptions(opacity = 0.35)) %>%
  addProviderTiles("NASAGIBS.ModisTerraChlorophyll", group = "Chlorophyll",  options = providerTileOptions(opacity = 0.35)) %>%

# addMarkers(lng=-0.09, lat=51.5, popup="London")
  addLayersControl(baseGroups = c("Rain", "Clouds", "Transport", "Temperature", "Pressure", "AOD", "Chlorophyll"),
#  overlayGroups = "Temperature",
  options = layersControlOptions(collapsed = TRUE))
  # hideGroup("AOD")

m  # Print the map

saveWidget(m, "Weather_Maps.html",selfcontained = FALSE)

#########################################################################################
#########################################################################################

AAA <- leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 4) %>%
  addWMSTiles(
    "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
    layers = "nexrad-n0r-900913",
    options = WMSTileOptions(format = "image/png", transparent = TRUE),
    attribution = "Weather data © 2012 IEM Nexrad"
  )
AAA

saveWidget(AAA, "AAA.html",selfcontained = FALSE)

