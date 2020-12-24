#  from https://github.com/nik01010/dashboardThemeSwitcher
# Ui functions ------------------------------------------------------------
uiChangeThemeDropdown <- function(dropDownLabel = "Change Theme", defaultTheme = "default")
{
  changeThemeChoices <- c("Default"="default",
    "Blue gradient" = "blue_gradient",
    "Flat Red" = "flat_red",
    "Grey light" = "grey_light",
    "Grey dark" = "grey_dark",
    "OneNote" = "onenote",
    "Poor man's Flatly" = "poor_mans_flatly",
    "Purple gradient" = "purple_gradient"
  )
  
  ns <- shiny::NS("moduleChangeTheme")
  dropdown <- shiny::tagList(
    shiny::selectizeInput(
      inputId = ns("dbxChangeTheme"),
      label = dropDownLabel,
      choices = changeThemeChoices
      
    )
  )
  
  return(dropdown)
}

uiChangeThemeOutput <- function()
{
  ns <- shiny::NS("moduleChangeTheme")
  themeOutput <- shiny::tagList(
    shiny::uiOutput(ns("uiChangeTheme"))
  )
  
  return(themeOutput)
}


# Server functions --------------------------------------------------------
serverChangeTheme <- function(input, output, session)
{
  shiny::observeEvent(
    input$dbxChangeTheme, 
      output$uiChangeTheme <- shiny::renderUI({
        if(input$dbxChangeTheme!="default"){
          dashboardthemes::shinyDashboardThemes(theme = input$dbxChangeTheme)}
        else {NULL}
      })
    
      
  )
}
