
b1<-billboarder() %>% bb_linechart(data=cleaned_table,type = "spline",show_point = TRUE, width = 2) %>%
  bb_x_axis(tick = list(format = "%b-%Y", fit = FALSE)) %>%
  bb_y_grid(show = TRUE) %>%
  bb_y_axis(label = list(text = "Rate of Inflation", position = "outer-middle",color ="white"))
b2<-billboarder() %>%
  bb_barchart(a2, bbaes(Period, Exchange_Rate,Currency))

