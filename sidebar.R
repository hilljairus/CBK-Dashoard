sidebar<-dashboardSidebar(
  sidebarMenu(id="tabs",
    #Show summary of data loaded
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    #Display graphs
    menuItem(
      "Charts", icon = icon("chart-area"),
      menuSubItem("Bars", tabName = "bars",icon = icon("chart-bar")),
      menuSubItem("Line", tabName = "line", icon = icon("chart-line"))
    ),
    #Display tabular representation of the data
    menuItem("Tables", tabName = "table",icon = icon("table")),
    
    #Redirect to datasource i.e CBK website
    menuItem("Source",icon = icon("external-link"), href = "https://www.centralbank.go.ke/")
  )
)
