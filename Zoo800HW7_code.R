######## Zoo800 Homework 7 - Maddy Teter - 10/17/2025

#Load packages used to produce map figure for HW 7
library(mapview)
library(dplyr)
library(ggspatial)
library(sf)
library(maptiles)
library(ggplot2)
library(prettymapr)
library(tidyterra) 

#Read in site data with coordinates of sampling points 
site_data <- read.csv("PSD25_site_data.csv")

# Convert to a spatial dataframe
site_data_sf <- st_as_sf(site_data, coords = c("longitude", "latitude"), crs = 4326)

#Filter for just Site 1 data (sites are too far apart to see individual sampling
#points across all 3 sites in a single map)
site1 <- site_data %>%
  filter(site == "1")

#Convert to a spatial dataframe
site1_sf <- st_as_sf(site1, coords = c("longitude", "latitude"), crs = 4326)

#Plot points without basemap to check sampling point orientation
ggplot(site1_sf) + 
  geom_sf(aes(color = site_position,
              shape = treatment))

#Pull basemap for Site 1 from esri world imagery (satellite imagery)
basemap <- get_tiles(site1_sf, provider = "Esri.WorldImagery", zoom = 16) #fits basemap tiles
#to area where site1_sf points are located using lat, long

#Plot sampling points from site 1 and basemap together
ggplot() +
  geom_spatraster_rgb(data = basemap) + #use geom_spatraster_rgb because basemap class = spatraster
  geom_sf(data = site1_sf, 
          color = "red", #color sampling points red
          size = 1.5) +
  annotation_scale(location = "bl", width_hint = 0.25,
                   pad_x = unit(0.25, "in"), pad_y = unit(0.4, "in")) + # scale bar (bottom left)
  annotation_north_arrow(location = "bl", which_north = "true",
                         pad_x = unit(0.35, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering()) +  # north arrow style
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  labs(
    x = "Longitude",
    y = "Latitude",
    color = "Sampling Points",
    caption = "Figure 1. Sampling points (red dots) at Site 1 near Anne's Beach in 
    the Florida Keys, USA. Basemap obtained from Esri World Imagery."
  )


#Repeat code for Site 2 data
site2 <- site_data %>%
  filter(site == "2")

#Convert to a spatial dataframe
site2_sf <- st_as_sf(site2, coords = c("longitude", "latitude"), crs = 4326)

#Plot points without basemap to check sampling point orientation
ggplot(site2_sf) + 
  geom_sf(aes(color = site_position,
              shape = treatment))

#Pull basemap for Site 1 from esri world imagery (satellite imagery)
basemap <- get_tiles(site2_sf, provider = "Esri.WorldImagery", zoom = 17) #fits basemap tiles
#to area where site1_sf points are located using lat, long

#Plot sampling points from site 1 and basemap together
ggplot() +
  geom_spatraster_rgb(data = basemap) + #use geom_spatraster_rgb because basemap class = spatraster
  geom_sf(data = site2_sf, 
          color = "red", #color sampling points red
          size = 1.5) +
  annotation_scale(location = "bl", width_hint = 0.25,
                   pad_x = unit(0.25, "in"), pad_y = unit(0.4, "in")) + # scale bar (bottom left)
  annotation_north_arrow(location = "bl", which_north = "true",
                         pad_x = unit(0.35, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering()) +  # north arrow style
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  labs(
    x = "Longitude",
    y = "Latitude",
    color = "Sampling Points",
    caption = "Figure 1. Sampling points (red dots) at Site 2 near Craig Key in 
    the Florida Keys, USA. Basemap obtained from Esri World Imagery."
  )


#Repeat code for Site 3 data
site3 <- site_data %>%
  filter(site == "3")

#Convert to a spatial dataframe
site3_sf <- st_as_sf(site3, coords = c("longitude", "latitude"), crs = 4326)

#Plot points without basemap to check sampling point orientation
ggplot(site3_sf) + 
  geom_sf(aes(color = site_position,
              shape = treatment))

#Pull basemap for Site 1 from esri world imagery (satellite imagery)
basemap <- get_tiles(site3_sf, provider = "Esri.WorldImagery", zoom = 17) #fits basemap tiles
#to area where site1_sf points are located using lat, long

#Plot sampling points from site 1 and basemap together
ggplot() +
  geom_spatraster_rgb(data = basemap) + #use geom_spatraster_rgb because basemap class = spatraster
  geom_sf(data = site3_sf, 
          color = "red", #color sampling points red
          size = 2) +
  annotation_scale(location = "bl", width_hint = 0.25,
                   pad_x = unit(0.25, "in"), pad_y = unit(0.4, "in")) + # scale bar (bottom left)
  annotation_north_arrow(location = "bl", which_north = "true",
                         pad_x = unit(0.35, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering()) +  # north arrow style
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  labs(
    x = "Longitude",
    y = "Latitude",
    color = "Sampling Points",
    caption = "Figure 1. Sampling points (red dots) at Site 3 near Little Conch in 
    the Florida Keys, USA. Basemap obtained from Esri World Imagery."
  )
