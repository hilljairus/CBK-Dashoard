#tab2 mudule UI
contentUI<-function(id){
  ns<-NS(id)
  fluidRow(
    box(plotlyOutput(ns("plot_21")),
        title = "Consumer Price Indices",width = 6, solidHeader = FALSE,
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
  # output$plot_21<-renderPlotly({
  #   data<-Knoema('ixajdmb', list('timerange' = '2010M1-2020M12', 'Indicator' = 'KN.C1;KN.C7', 'Commodity' = 'KN.K22'), host='kenya.opendataforafrica.org')
  #   Q19<-data[["Q - Consumer Price Index (Index February 2009=100) - Broad Commodity Group (Total)"]]
  # 
  #   fig<-autoplot(Q19, ts.colour = 'pink')+scale_x_date(date_breaks ="2 year",date_labels = "%b %Y")+
  #     theme(
  #       # Hide panel borders and remove grid lines
  #       panel.border = element_blank(),
  #       panel.grid.major = element_blank(),
  #       panel.grid.minor = element_blank(),
  #       plot.background=element_rect(fill = "#232e3c"),
  #       panel.background = element_rect(fill = '#232e3c'),
  #       legend.background = element_rect(fill = "black", color = NA),
  #       legend.key = element_rect(color = "gray", fill = "black"),
  #       legend.title = element_text(color = "white"),
  #       legend.text = element_text(color = "white"),
  #       axis.text.x = element_text(color = "white"),
  #       axis.text.y = element_text(color = "blue"))
  #   ggplotly(fig)
  # 
  # })

}



