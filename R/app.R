#' @import shiny
#' @import shinydashboard

#' @export
myApp<-function(){
  ui <- shinydashboardPlus::dashboardPagePlus(skin = "purple",
                                              collapse_sidebar = TRUE,
                                              dashboardHeader(title = title(),
                                                              headerUI("notification")),
                                              sidebar(),
                                              body()
  )
  
  server <- function(input, output, server) {
    callModule(headerServer,"notification")#Notification module
    callModule(infoboxServer,"infos",infl=inflation()$last)
    callModule(contentServer,"content") #Tab 2 module
    callModule(countiesServer,"maps")
    # Changing theme ----------------------------------------------------------
    callModule(module = serverChangeTheme, id = "moduleChangeTheme")
    
  }
  
  shinyApp(ui, server)
}
