#tab2 mudule UI

tab2UI<-function(id){
  ns<-NS(id)
  fluidRow(
    box(plotlyOutput(ns("plot_21")),
        title = "Consumer Price Indices", status = "primary",width = 6, solidHeader = TRUE,
        collapsible = TRUE
    ),
    box(plotlyOutput(ns("plot_22")),
        title = "Consumer Price Indices", status = "info",width = 6, solidHeader = TRUE,
        collapsible = TRUE
    )
  )
}

#tab2 server module
tab2Server<-function(input,output,session){
  output$plot_21<-renderPlotly({
    fig<-autoplot(Q19)
    ggplotly(fig)
  })
  
}
