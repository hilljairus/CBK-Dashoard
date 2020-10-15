body<-dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Create Dashboard")),
    tabItem(tabName = "bars",
            h2("Add bar graphs")),
    tabItem(tabName = "line",
            h2("Add line graphs")),
    tabItem(tabName = "table",
            h2("Add tabularized data"))
  )
)
