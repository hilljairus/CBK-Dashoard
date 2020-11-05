#LIbraries
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(dashboardthemes)
library(tidyverse)
library(ggfortify)
library(ggplot2)
library(plotly)
library(Knoema)
#Source files
source("header.R")
source("sidebar.R")
source("body.R")
source('tab2.R')
##Layout
ui <- dashboardPagePlus(skin="purple",
                        collapse_sidebar = TRUE,
  dashboardHeaderPlus(title = title,
                  headerUI("notification")),
  sidebar,
  body
)

server <- function(input, output, server) {
  callModule(headerServer,"notification")#Notification module
  callModule(tab2Server,"bars") #Tab 2 module
  # Changing theme ----------------------------------------------------------
  callModule(module = serverChangeTheme, id = "moduleChangeTheme")
}

shinyApp(ui, server)
