#' @import shiny
#' @import shinydashboard

#--------------InfoBox
infoboxUI<-function(id){
  ns<-NS(id)
  fluidRow(
    infoBox("GDP","1.2B", icon = icon("briefcase")),
    infoBox("Economoic Growth", "6%", icon = icon("building")),
    infoBoxOutput(ns("inflbox"))
  )
}

infoboxServer<-function(input,output,session,infl){
  output$inflbox<-renderInfoBox({
    infoBox("Inflation", infl, icon = icon("chart-line"))
  })
}

#-------Inflation and Forex Exchange rates mudule UI
selector<-shiny::selectInput("select",NULL, c("a","b","c"))
contentUI<-function(id){
  ns<-NS(id)
  fluidRow(
    box(billboarder::billboarderOutput(ns("plot_21")),
        title = "Inflation Rates",width = 6, solidHeader = FALSE,
        collapsible = FALSE
    ),
    box(billboarder::billboarderOutput(ns("plot_22")),
        title = " End of Month Mean Exchange rate of Kenya Shillings ",width = 6, solidHeader = FALSE,
        collapsible = FALSE
    )

  )
}



#---------------Inflation and Forex Exchange rates server module
contentServer<-function(input,output,session){
   output$plot_21<-billboarder::renderBillboarder({
     b1()
   })
   output$plot_22<-billboarder::renderBillboarder({
     b2()
   })

}

#--------------County map UI
countiesUI<-function(id){
  ns<-NS(id)
  fluidRow(
    myBox(leaflet::leafletOutput(ns("map")),title="Revenue Allocation", my_input=selector,width=12)
  )
}

#--------------County map Server
countiesServer<-function(input,output,session){
  output$map<-leaflet::renderLeaflet(mymap)
}
