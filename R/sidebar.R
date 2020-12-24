sidebar<-function(){
  shinydashboard::dashboardSidebar(
  
    shinydashboard::sidebarMenu(id="tabs",
    #Dashboard tab
    shinydashboard::menuItem("Dashboard", tabName = "dashboard", icon = shiny::icon("dashboard")),
   
    #Display tabular representation of the data
    shinydashboard::menuItem("Tables", tabName = "table",icon = shiny::icon("table")),
    
    #change themes - 
    shinydashboard::menuItem("Themes",tabName = "theme", icon = shiny::icon("gear")),
    #Redirect to datasource i.e CBK website
    shinydashboard::menuItem("Source",icon = shiny::icon("external-link"), href = "https://www.centralbank.go.ke/")
  )
)
}


