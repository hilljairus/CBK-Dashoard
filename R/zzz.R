#create custom path for static files
.onAttach <- function(libname, pkgname) {
  shiny::addResourcePath('www',
                         system.file('www',
                                     package = 'Dashoard'))
}
