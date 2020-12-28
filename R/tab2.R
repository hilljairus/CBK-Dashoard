#' @import shiny
#' @import shinydashboard

#--------------InfoBox
infoboxUI<-function(id){
  ns<-NS(id)
  fluidRow(
    infoBox("GDP Growth","1.5%", icon = icon("briefcase")),
    infoBox("GDP Per Capita", "USD 1931", icon = icon("building")),
    infoBoxOutput(ns("inflbox"))
  )
}

infoboxServer<-function(input,output,session,infl){
  output$inflbox<-renderInfoBox({
    infoBox("Inflation", infl, icon = icon("chart-line"))
  })
}

#-------Inflation and Forex Exchange rates mudule UI
selector<-shiny::selectInput("select",NULL, 
                             c("Yr2012.13","Yr2013.2014","Yr2014.2015","Yr2015.2016","Yr2016.2017"))
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
    myBox(leaflet::leafletOutput(ns("map")),title="Revenue Allocation",
          my_input=shiny::selectInput(ns("select"),NULL, 
                                      c("Yr2012.13","Yr2013.2014","Yr2014.2015","Yr2015.2016","Yr2016.2017")),
          width=12)
  )
}

#--------------County map Server
countiesServer<-function(input,output,session){
  
  
  colorPal<-reactive({leaflet::colorQuantile("Blues",domain=cnty@data[[input$select]], n=8)})
  
  
  output$map<-leaflet::renderLeaflet(county_map)
  
  observeEvent(input$select,{
    pal<-colorPal()
    
    pop_text<- paste(
      "County: ", cnty@data$Name,"<br/>",
      "Fin Year: ",input$select, "<br/>",
      "Allocation: ", paste(floor(cnty@data[[input$select]]/1e6),"M",sep=""),
      sep="") %>%
      lapply(shiny::HTML)
   # pal <- leaflet::colorBin("Blues",domain=cnty@data[[input$select]], bins =bins, pretty = TRUE)

    leaflet::leafletProxy("map",data=cnty) %>%
      leaflet::addPolygons(
        fillColor = ~pal(cnty@data[[input$select]]),
        weight = 2,
        opacity = 1,
        color = "black",
        dashArray = "3",
        fillOpacity = 0.7,
        highlight = leaflet::highlightOptions(
          weight = 5,
          color = "#666",
          dashArray = "",
          fillOpacity = 0.7,
          bringToFront = TRUE),
        label = pop_text,
        labelOptions = leaflet::labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto")
        )

  })
}
