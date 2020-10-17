#LIbraries
library(shiny)
library(shinydashboard)
library(shinythemes)
library(tidyverse)
#Source files
source("header.R")
source("sidebar.R")
source("body.R")
##Layout
ui <- dashboardPage(
  dashboardHeader(title = "Something to build on",
                  headerUI("notification")),
  sidebar,
  body
)

server <- function(input, output, server) {
  callModule(headerServer,"notification")
}

shinyApp(ui, server)
