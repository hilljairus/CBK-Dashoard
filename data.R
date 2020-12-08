library(tabulizer)
library(stringr)
library(lubridate)
library(tidyverse)

inflation_pdf<-"C:/Users/Ragang'/Downloads/September 2020 LEI.pdf"
inflation<-extract_tables(inflation_pdf, pages = 9)

inflation_df<-as.data.frame(inflation[[1]], stringsAsFactors = FALSE)
unclean_names<-inflation_df[1:4,]
inflation_values<-inflation_df[6:length(inflation_df[[1]]),]
cleaned_names<-lapply(unclean_names,function(x){str_wrap(str_c(x,collapse = " "))})
for(i in 1:length(unclean_names)){names(inflation_values)[i]<-cleaned_names[[i]]}
month<-str_c(month.name,collapse = "|")

inflation_values[[1]]<-str_extract(inflation_values[[1]],month)
inflation_values[[2]]<-NULL
inflation_values
cleaned_table<-as_tibble(inflation_values) %>% mutate(Period=dmy(paste(1,Period,2020)))
b1<-billboarder() %>% bb_linechart(data=cleaned_table,type = "spline",show_point = TRUE, width = 2) %>%
  bb_x_axis(tick = list(format = "%b-%Y", fit = FALSE)) %>%
  bb_y_grid(show = TRUE) %>%
  bb_y_axis(label = list(text = "Rate of Inflation", position = "outer-middle",color ="white"))



