
library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)

############################################################



shinyUI(
  dashboardPage( skin = "yellow", 
    dashboardHeader(title = "WeatherMaps"),
    
    dashboardSidebar(sidebarMenu(
      menuItem("Dashboard", tabName = "MetData", icon = icon("dashboard")
      )
      
    )),
    
  
  dashboardBody(
      tabItem(tabName = "MetData",
              fluidRow(
                 box(height = 80, width = 7,
                        selectInput("variable", "Met Parameter", c("Rain" = "OpenWeatherMap.Rain",
                                                                   "Clouds" = "OpenWeatherMap.Clouds",
                                                                   "Wind" = "OpenWeatherMap.Wind",
                                                                   "Temperature" = "OpenWeatherMap.Temperature",
                                                                   "Pressure" = "OpenWeatherMap.PressureContour",
                                                                   "AOD" ="NASAGIBS.ModisTerraAOD",
                                                                   "Chlorophyll" = "NASAGIBS.ModisTerraChlorophyll"))
                     ),

                    
                # Show leaflet map 
                mainPanel(
                  leafletOutput('myMap', height = 750, width = 950)
                )
      
              )
            
      ))
  ))
