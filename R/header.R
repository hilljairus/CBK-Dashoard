#Title format

title<-function(){shiny::tags$a(href="https://osdashboard.shinyapps.io/Dashboard/" ,
              shiny::tags$img(src="www/dashboard-icon.jpg", class="img-circle", height='50'),
              "EI")}

#Modularized header
#Module UI
headerUI<-function(header){
  ns<-shiny::NS(header)
 shinydashboard::dropdownMenuOutput(ns("notf"))
}
#Module server for render notifications dynamically
headerServer<-function(input,output,session){
  output$notf<-shinydashboard::renderMenu(
    shinydashboard::dropdownMenu(type = "notifications", badgeStatus = "primary", icon=icon("bell"),
                  shinydashboard::notificationItem(icon = icon("info-circle"), status = "info",
                 "Contact hilljairus@gmail.com to add a dataset to this dashboard")
    )
  )
}