
library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)

############################################################


ui <- dashboardPage(
  skin = "yellow",
  dashboardHeader(title = "EasyWeather"),
  
  dashboardSidebar(paste("Time:",Sys.time()),
                   sidebarMenu(
                     menuItem("Meteo", tabName = "Met", icon = icon("th")),
                     menuItem("Aerosols", tabName = "MODIS", icon = icon("dashboard"))
                   )),
    

  dashboardBody(tabItems(
    # First tab content
    tabItem(tabName = "Met",
            fluidRow(
              tabBox(
                height = 750, width = 950, selected = tags$b("Rain"),
                #  title = h1("Weather Maps"),
                tabPanel(
                 tags$b("Rain"), leafletOutput('myMap_rain', height = 650, width = 750)
                ),
                tabPanel(
                  tags$b("Temp."), leafletOutput('myMap_temperature', height = 650, width = 750)
                ),
                tabPanel(
                  tags$b("Clouds"), leafletOutput('myMap_clouds', height = 650, width = 750)
                ),
                tabPanel(
                  tags$b("Wind"), leafletOutput('myMap_wind', height = 650, width = 750
                ))
#                 tabPanel(
#                   tags$b("Pressure"), leafletOutput('myMap_pressure', height = 650, width = 750)
#                 )
              )
            )),
    
    tabItem(tabName = "MODIS",
            fluidRow(
              tabBox(
                height = 750, width = 950, selected = "AOD",
                tabPanel("AOD", leafletOutput(
                  'myMap_AOD', height = 650, width = 750
                )),
                tabPanel(
                  "Chlorophyll", leafletOutput('myMap_Chlorophyll', height = 650, width = 750
               ))
              )
            ))
  ))
)
          

