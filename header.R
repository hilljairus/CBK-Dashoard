#header <- dashboardHeader(
  #title = "Dashboard Demo",
  
  # Dropdown menu for notifications
  #dropdownMenu(type = "notifications", badgeStatus = "primary", icon=icon("bell"),
              # notificationItem(icon = icon("info-circle"), status = "info",
                                #"Notify Something"))
  # )

headerUI<-function(header){
  ns<-NS(header)
 dropdownMenuOutput(ns("notf"))
}

headerServer<-function(input,output,session){
  output$notf<-renderMenu(
    dropdownMenu(type = "notifications", badgeStatus = "primary", icon=icon("bell"),
                  notificationItem(icon = icon("info-circle"), status = "info",
                 "Notify Something") )
  )
}