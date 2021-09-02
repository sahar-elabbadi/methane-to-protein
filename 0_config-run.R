## SETUP & RUN 
## Protein from stranded methane
## Author: Sahar El Abbadi


# Load libraries 

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



