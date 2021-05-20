library(tidyverse)
library(leaflet)

dat<-read.csv("volcano_list.csv", fileEncoding = "UTF-8")


dat %>% 
  filter(NAME != "") %>% 
  separate(lat, into=c("lat_d", "lat_m", "lat_s"), sep="([°′″])") %>% 
  mutate(lat=as.numeric(lat_d) + as.numeric(lat_m)/60 + as.numeric(lat_s)/3600) %>% 
  separate(lng, into=c("lng_d", "lng_m", "lng_s"), sep="([°′″])") %>% 
  mutate(lng=as.numeric(lng_d) + as.numeric(lng_m)/60 + as.numeric(lng_s)/3600) %>% 
  leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(lat=~lat, lng=~lng, radius = ~elev/300, label = ~NAME) 

