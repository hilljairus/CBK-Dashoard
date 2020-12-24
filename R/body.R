#' @import shinydashboard
#' @import shiny
#' 
#'
# source('tab2.R')
# source('moduleChangeTheme.R')
body<-function() {dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "www/bootstrap.min.css")
  ),
  # Custom theme ------------------------------------------------------------
  uiChangeThemeOutput(),
  # menu items
  tabItems(
    tabItem(tabName = "dashboard", 
            infoboxUI("infos"),
            contentUI("content"),
            countiesUI("maps")
            ),
    
    tabItem(tabName = "table",
            h2("Add tabularized data")
            ),
    tabItem(tabName = "theme",
            fluidRow(
              column(12, offset =4 ,
                     # Theme drop-down ---------------------------------------------------------
                     uiChangeThemeDropdown()
              )
            )
            )
  )
)
}

