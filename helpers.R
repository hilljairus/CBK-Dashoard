myBox <- function(..., title = NULL, footer = NULL, status = NULL,
                  solidHeader = FALSE, background = NULL, width = 6,
                  height = NULL, my_input=NULL) {
  
  boxClass <- "box"
  if (solidHeader || !is.null(background)) {
    boxClass <- paste(boxClass, "box-solid")
  }
  if (!is.null(status)) {
    validateStatus(status)
    boxClass <- paste0(boxClass, " box-", status)
  }
  
  if (!is.null(background)) {
    validateColor(background)
    boxClass <- paste0(boxClass, " bg-", background)
  }
  
  style <- NULL
  if (!is.null(height)) {
    style <- paste0("height: ", validateCssUnit(height))
  }
  
  titleTag <- NULL
  if (!is.null(title)) {
    titleTag <- h3(class = "box-title", title)
  }
  myTag<-div(class="my_div", style="display: flex; flex-direction: column; align-items: flex-start;",
             my_input)
  
  headerTag <- NULL
  if (!is.null(titleTag)) {
    headerTag <- div(class = "box-header",
                     style="display: flex; justify-content: space-between;",
                     titleTag,
                     myTag
    )
  }
  
  div(class = if (!is.null(width)) paste0("col-sm-", width),
      div(class = boxClass,
          style = if (!is.null(style)) style,
          headerTag,
          div(class = "box-body", ...),
          if (!is.null(footer)) div(class = "box-footer", footer)
      )
  )
}

#data<-Knoema('ixajdmb', list('timerange' = '2010M1-2020M12', 'Indicator' = 'KN.C1;KN.C7', 'Commodity' = 'KN.K22'), host='kenya.opendataforafrica.org')
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