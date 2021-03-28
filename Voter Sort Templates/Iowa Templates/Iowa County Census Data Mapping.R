install.packages("tidycensus")
install.packages('sf')
#Iowa income census data

library(tidycensus)
library(tidyverse)
library(tigris)

#census_api_key('f6c751d340180dc9732d3b60f48351973a8e4b80', install = TRUE)
census_api_key('f6c751d340180dc9732d3b60f48351973a8e4b80')

options(tigris_use_cache = TRUE)


Counties_IA <- get_acs(geography = "tract",
                       variables = "B21004_001",
                       county = "polk",
                       state = "Iowa",
                       geometry = TRUE)

head(Counties_IA)

library(leaflet)
library(stringr)
library(sf)

pal <- colorNumeric(palette = "viridis", domain = Counties_IA$estimate, n = 10)

Counties_IA %>%
  st_transform(crs = "+init=epsg:4326") %>%
  leaflet(width = "100%") %>%
  addProviderTiles(provider = "CartoDB") %>%
  addPolygons(popup = ~ str_extract(NAME, "^([^,]*)"),
              stroke = FALSE,
              smoothFactor = 0,
              fillOpacity = 0.7,
              color = ~ pal(estimate)) %>%
  
  addLegend("bottomright",
            pal = pal,
            values = ~ estimate,
            title = "Median Income Values",
            labFormat = labelFormat(prefix = "$"),
            opacity = 1)


