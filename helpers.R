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
