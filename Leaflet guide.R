library(leaflet)

#################### Create a leaflet map ####################

#####Create a leaflet map with default map tile using addTiles()
leaflet() %>%
  addTiles()

#####Call names of map providers for leaflet
names(providers)

#####Create a leaflet map that uses specific provider tile group
leaflet() %>% 
  addProviderTiles(provider = "CartoDB")

#####Create a leaflet map that uses tile from provider tile group
leaflet() %>% 
  addProviderTiles("CartoDB.PositronNoLabels")










#################### set default view of map ####################

setView()

leaflet() %>%
  addTiles() %>%
  setView(lng = -73.98575,
          lat = 40.74856,
          zoom = 13)

#or
fitBounds()

leaflet() %>%
  addTiles() %>%
  fitBounds(
    lng1 = -73.910, lat1 = 40.773,
    lng2 = -74.060, lat2 = 40.723)

#or Set Max bounds

#save location to use as reference for bounds
school <- c("Seton Hall","Fordam", "Harvard")
longditude <- c(-74.2, -73.9, -71.1)
laditude <- c(40.7, 40.9, 42.4)
school.location <- data.frame(school, longditude, laditude, stringsAsFactors = FALSE)

leaflet(options = leafletOptions(minZoom = 12,
                                 dragging = TRUE)) %>%
  addProviderTiles("CartoDB") %>%
  setView(lng = school.location$longditude[1], lat = school.location$laditude[1], zoom = 5) %>%
  setMaxBounds(lng1 = school.location$longditude[1] + .08,
               lat1 = school.location$laditude[1] + .08,
               lng2 = school.location$longditude[1] - .08,
               lat2 = school.location$laditude[1] -.08)










#################### Focusing map by using leaflet options ####################

# |dragging = FALSE| will prevent panning
# |min and max zoom will limit zoom range|
# |more options on http://leafletjs.com/reference-1.3.0.html or https://rstudio.github.io/leaflet/
leaflet(options = leafletOptions(dragging = FALSE,
                                 minZoom = 14,
                                 maxZoom = 18)) %>%
  addProviderTiles("CartonDB") %>%
  setView(lng = -73.98575, lat = 40.74856, zoom = 18)










#################### Plotting a point #################### 

###### Approach 1:
# add marker layer to map

leaflet() %>%
  addTiles() %>%
  addMarkers( lng = -73.98575,  # addMarkers will automatically 
              lat = 40.74856)   # center on a single point & zoom to fit all points

# add multiple markers
# geocode locations using ggmaps geocode function from google API

uni_names <- tibble(Uni = c("Montclair State University", #save each school location
               "NJIT",                                    #into a variable
               "Rutgers University", 
               "Princeton", 
               "Seton Hall University", 
               "Stevens University"))

Uni_locations <- geocode(location = c("Montclair State University", #save each school location
                                      "NJIT",                                    #into a variable
                                      "Rutgers University", 
                                      "Princeton",
                                      "Seton Hall University",
                                      "Stevens University"),
                         nameType = "long",
                         output = "more")

Uni_data <- cbind(uni_names, Uni_locations)

Uni_data %>% #Pipe data 
  leaflet() %>%
  addProviderTiles(provider = "CartoDB") %>%
  addMarkers(
    popup = Uni_data$Uni
  )
