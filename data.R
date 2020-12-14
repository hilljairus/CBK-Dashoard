library(tabulizer)
library(stringr)
library(lubridate)
library(tidyverse)

#------------Inflation Data
inflation_pdf<-"OS_Data/September 2020 LEI.pdf"
inflation<-extract_tables(inflation_pdf, pages = 9)

inflation_df<-as.data.frame(inflation[[1]], stringsAsFactors = FALSE)
unclean_names<-inflation_df[1:4,]
inflation_values<-inflation_df[6:length(inflation_df[[1]]),]
cleaned_names<-lapply(unclean_names,function(x){str_wrap(str_c(x,collapse = " "))})
for(i in 1:length(unclean_names)){names(inflation_values)[i]<-cleaned_names[[i]]}
month<-str_c(month.name,collapse = "|")

inflation_values[[1]]<-str_extract(inflation_values[[1]],month)
inflation_values[[2]]<-NULL
last_month_inf<-last(inflation_values[,5])
cleaned_table<-as_tibble(inflation_values) %>% mutate(Period=dmy(paste(1,Period,2020)))


#-----------Forex exchange rates
forex<-extract_tables(inflation_pdf,pages=11,output ="data.frame")

len_out<-length(forex[[1]])
st_month<-names(forex[[1]])[2]
st<-as.Date(paste(st_month,15,2019), format = "%b %d %Y")
bar_period<-seq.Date(st,by="month", length.out = len_out-1)
names(forex[[1]])[2:len_out]<-format(bar_period,"%b%y")

a2<-as_tibble(forex[[1]]) %>% 
  pivot_longer(cols=-Currency, names_to = "Period", values_to= "Exchange_Rate") %>% 
  mutate(Currency=str_remove_all(Currency,"\\."))
  
#----------Plots
b1<-billboarder() %>% bb_linechart(data=cleaned_table,type = "spline",show_point = TRUE, width = 2) %>%
  bb_x_axis(tick = list(format = "%b-%Y", fit = FALSE)) %>%
  bb_y_grid(show = TRUE) %>%
  bb_y_axis(label = list(text = "Rate of Inflation", position = "outer-middle"))


b2<-billboarder() %>%
  bb_barchart(a2, bbaes(Period, Exchange_Rate,Currency)) %>% 
  bb_x_axis(tick=list(fit=TRUE, multiline=FALSE,autorotate= TRUE)) %>% 
  bb_y_axis(label = list(text = "Kenyan Shillings", position = "outer-middle"))

mymap<-leaflet() %>% 
  addTiles() %>% 
  setView(-1.286389, 36.817223, zoom = 15) 
mymap
