sidebar<-dashboardSidebar(
  
  sidebarMenu(id="tabs",
    #Dashboard tab
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
   
    #Display tabular representation of the data
    menuItem("Tables", tabName = "table",icon = icon("table")),
    
    #change themes - 
    menuItem("Themes",tabName = "theme", icon = icon("gear")),
    #Redirect to datasource i.e CBK website
    menuItem("Source",icon = icon("external-link"), href = "https://www.centralbank.go.ke/")
  )
)


