source('tab2.R')
source('moduleChangeTheme.R')
body<-dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.min.css")
  ),
  # Custom theme ------------------------------------------------------------
  uiChangeThemeOutput(),
  # menu items
  tabItems(
    tabItem(tabName = "dashboard", 
            fluidRow(
             infoBox("GDP","1.2B", icon = icon("briefcase")),
             infoBox("Economoic Growth", "6%", icon = icon("building")),
             infoBox("Inflation", "10%", icon = icon("chart-line"))
            ),
            contentUI("content"),
            fluidRow(myBox(title="mybox", my_input=selector,width=12))
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
