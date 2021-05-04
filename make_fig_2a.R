#libraries: usmap, maptools, ggplot2

analytica_df <- read_excel(here("figures", "master_data_2021-03-22.xlsx"))
analytica_df [ analytica_df == 'INF'] <- NA 

map_col_order <- c("long", "lat", "ch4_emission", "source_type") 

analytica_df_map <- analytica_df[,map_col_order] %>% 
  na.omit()

#make SF points object   
pts <- st_as_sf(analytica_df_map, coords = 1:2, crs = 4326)
states = spData::us_states #PROBLEM: does not contain alaska or hawaii 
states <- st_transform(states, crs = 3857)
pts <- st_transform(pts, crs = 3857)
state_names <- states[["NAME"]]
ii <- as.integer(st_intersects(pts, states))
state_names[ii]


analytica_df_map$state <- state_names[ii]

analytica_df_map <- na.omit(analytica_df_map) 


# Make map ----------------------------------------------------------------

# Make map of US 


library(maps)
library(mapproj)
library(ggthemes)

us_states <- map_data("state") #load lat and long data for US States


#combine the us_states data with my data in state.df
p <- ggplot( ) + 
  geom_polygon (data = us_states, aes( x = long, y = lat, group = group),
                fill = "white", 
                color = "black", 
                size = 0.3) +
  #geom_point (data = flight_landfill, aes( x = long, y = lat)) + 
  theme_void() + 
  coord_map()
coord_map(projection = "albers", lat0=39, lat1 = 45) 


# remove the x and y axes and labels

p <- p + theme(axis.line = element_blank(), 
               axis.text.x = element_blank(), 
               axis.text.y = element_blank(), 
               axis.ticks = element_blank(), 
               axis.title.x = element_blank(), 
               axis.title.y = element_blank())


# Add points to map -------------------------------------------------------

map_colors = c("#A6611A", "#018571", "#D7191C", "#FDAE61", "#2C7BB6")
source_type_labs = c("Landfill Currently Emitted", "Landfill Currently Flared", 
                     "Oil & Gas Currently Emitted", "Oil & Gas Currently Flared", 
                     "Wastewater Treatment Currently Emitted or Flared")

p <- p + geom_point(data = analytica_df_map, aes(x =long, y = lat, 
                                                 size = ch4_emission,
                                                 color = source_type), 
               alpha = 0.5) + 
  scale_color_manual(values = map_colors, name = "Source Type", labels = source_type_labs, ) + 
  scale_size(range = c(0.1, 10), breaks = c(1, 100, 200, 300, 400), name = "Tons Methane / Day") #+ 
  #theme(legend.key.size = unit(3, ))





