#Title format

title<-function(){shiny::tags$a(href="https://osdashboard.shinyapps.io/Dashboard/" ,
              shiny::tags$img(src="www/Data-Analytics-Icon.png", class="img-circle", height='40'),
              "OS-D")}

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
                 text=shiny::tags$div("Contact hilljairus@gmail.com or",
                             shiny::tags$br(),
                             "georgetkerry@gmail.com to visualize",
                             shiny::tags$br(),
                             "a dataset in this dashboard",
                             style = "display: inline-block; vertical-align: middle;"
                             )
                   )
    )
  )
}