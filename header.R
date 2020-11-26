#Title format
title<-tags$a(href="https://google.com" ,
              tags$img(src="dashboard-icon.jpg", class="img-circle", height='50'),
              "EI")

#Modularized header
#Module UI
headerUI<-function(header){
  ns<-NS(header)
 dropdownMenuOutput(ns("notf"))
}
#Module server for render notifications dynamically
headerServer<-function(input,output,session){
  output$notf<-renderMenu(
    dropdownMenu(type = "notifications", badgeStatus = "primary", icon=icon("bell"),
                  notificationItem(icon = icon("info-circle"), status = "info",
                 "Notify Something")
    )
  )
}