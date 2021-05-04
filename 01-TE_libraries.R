#Order in which to run code: 
# 1-TE startup code (PC or Mac version)
# 2-TE data manipulation

#set working directory to TE/data/R
#setwd("C:/Users/sahar/Dropbox/Stanford/Research/Projects/01-inProgress/TE/data/R")

#load libraries

library(devtools)
library(here)

#for data ceaning and manipulation
library(tidyr)
library(dplyr)
library(tidyverse)
library(readxl)
library(sf) #used for maps (simple features)
library(spData)
library(raster)
library(spData)
library(ggpubr)
library (ggplot2) 

#for themes/colors
library(ggthemes)
library(RColorBrewer)

#for maps: 
library(maps)
library(mapproj)
library(rgdal)
library(rgeos)
library(viridis)
library(hrbrthemes)
library(usmap)
library(maptools)

theme_set(
  theme_pubr() +
    theme(legend.position = "right")
)



