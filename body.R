source('tab2.R')
body<-dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.min.css")
  ),
  tabItems(
    tabItem(tabName = "dashboard", 
            fluidRow(
             infoBox("GDP","1.2B", color = "black", fill=TRUE, icon = icon("briefcase")),
             infoBox("Economoic Growth", "6%", color = "lime", fill = TRUE, icon = icon("building")),
             infoBox("Inflation", "10%", color = "red", fill = TRUE, icon = icon("chart-line"))
            )),
    tabItem(tabName = "bars",
            tab2UI("bars")
            ),
    tabItem(tabName = "line",
            h2("Add line graphs")
            ),
    tabItem(tabName = "table",
            h2("Add tabularized data")
            )
  )
)
