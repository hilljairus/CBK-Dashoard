#LIbraries
library(shiny)
library(shinydashboard)
library(shinythemes)
library(tidyverse)
source("header.R")
source("sidebar.R")
source("body.R")
##Layout
ui <- dashboardPage(
  header,
  sidebar,
  body
)

server <- function(input, output, server) { }

shinyApp(ui, server)
