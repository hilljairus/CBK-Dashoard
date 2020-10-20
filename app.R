#LIbraries
library(shiny)
library(shinydashboard)
library(shinythemes)
library(tidyverse)
library(forecast)
library(ggplot2)
library(plotly)
#Source files
source("header.R")
source("sidebar.R")
source("body.R")
##Layout
ui <- dashboardPage(skin="purple",
  dashboardHeader(title = "Something to build on",
                  headerUI("notification")),
  sidebar,
  body
)

server <- function(input, output, server) {
  callModule(headerServer,"notification")#Notification module
  callModule(tab2Server,"bars") #Tab 2 module
}

shinyApp(ui, server)
