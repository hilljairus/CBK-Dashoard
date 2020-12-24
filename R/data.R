
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs


#------------Inflation Data Extraction Function
`%>%` <- magrittr::`%>%`
inflation_pdf<-"R/OS_Data/September 2020 LEI.pdf"
inflation<-function(raw=inflation_pdf,page=9){
    
    extracted<-tabulizer::extract_tables(raw, pages = page)
    inflation_df<-as.data.frame(extracted[[1]], stringsAsFactors = FALSE)
    unclean_names<-inflation_df[1:4,]
    inflation_values<-inflation_df[6:nrow(inflation_df),]
    
    cleaned_names<-lapply(unclean_names,
                          function(x){
                            stringr::str_wrap(stringr::str_c(x,collapse = " "))})
    for(i in 1:length(unclean_names)){names(inflation_values)[i]<-cleaned_names[[i]]}

    inflation_values[[1]]<-stringr::str_remove_all(inflation_values[[1]],"\\.")
    inflation_values[[2]]<-NULL
    
    last_month_inf<-dplyr::last(inflation_values[,5])
    cleaned_table<-tibble::as_tibble(inflation_values) %>% dplyr::mutate(Period=lubridate::dmy(paste(1,Period,2020)))
    return(list(last_month=last_month_inf,mydata=cleaned_table))
    
}

inf_data= inflation()$mydata

#-----------Forex exchange rates
forex<-function(raw=inflation_pdf,page=11){
  
    extracted<-tabulizer::extract_tables(raw,pages=page,output = "data.frame")
    
    len_out<-ncol(extracted[[1]])
    start_month<-names(extracted[[1]])[2] #2nd col name marks the start month
    start_date<-as.Date(paste(start_month,15,2019), format = "%b %d %Y") #convert to date format
    period<-seq.Date(start_date,by="month", length.out = len_out-1)
    names(extracted[[1]])[2:len_out]<-format(period,"%b%y")
    a2<-tibble::as_tibble(extracted[[1]]) %>% 
      tidyr::pivot_longer(cols=-Currency, names_to = "Period", values_to= "Exchange_Rate") %>% 
      dplyr::mutate(Currency=stringr::str_remove_all(Currency,"\\."))
    a2
}


#----------Plots
b1<-function(data=inf_data){
billboarder::billboarder() %>%
    billboarder::bb_linechart(data=data,type = "spline",show_point = TRUE, width = 2) %>%
    billboarder::bb_x_axis(tick = list(format = "%b-%Y", fit = FALSE)) %>%
    billboarder::bb_y_grid(show = TRUE) %>%
    billboarder::bb_y_axis(label = list(text = "Rate of Inflation", position = "outer-middle"))
}

b2<-function(data=forex()){
  billboarder::billboarder() %>%
    billboarder::bb_barchart(data=data, billboarder::bbaes(Period, Exchange_Rate,Currency)) %>% 
    billboarder::bb_x_axis(tick=list(fit=TRUE, multiline=FALSE,autorotate= TRUE)) %>% 
    billboarder::bb_y_axis(label = list(text = "Kenyan Shillings", position = "outer-middle"))
}
mymap<-leaflet::leaflet() %>% 
  leaflet::addTiles() %>% 
  leaflet::setView(37.906193, -0.023559,  zoom =6) %>% addMarkers(lng=35.30272, lat=-0.8015009)





