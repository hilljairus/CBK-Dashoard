library(billboarder)
source("helpers.R")
source("data.R")

#tab2 mudule UI
selector<-selectInput("select",NULL, c("a","b","c"))
contentUI<-function(id){
  ns<-NS(id)
  fluidRow(
    box(billboarderOutput(ns("plot_21")),
        title = "Inflation Rates",width = 6, solidHeader = FALSE,
        collapsible = FALSE
    ),
    box(plotlyOutput(ns("plot_22")),
        title = "Consumer Price Indices",width = 6, solidHeader = FALSE,
        collapsible = FALSE
    )

  )
}

#-------------------tab2 server module
contentServer<-function(input,output,session){
   output$plot_21<-renderBillboarder({
     
     b1
   })

}



