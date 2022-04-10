
###leaflet: 
library(tidyverse)
#install.packages("sf")
library(sf)
#install.packages("mapview")
library(mapview)
library(htmlwidgets)

vol<- read.csv("GVP_Volcano_List_Holocene.csv")

head(vol) 


map<-mapview(vol, xcol = "Longitude", ycol = "Latitude",crs = 4269, grid = FALSE)
mapshot(map, url = paste0(getwd(), "/data1_map.html"))
