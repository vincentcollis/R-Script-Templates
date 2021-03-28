#Clean Up NJ Data

#Add State
FILENAME$state <- "NJ"
FILENAME$country <- "US"


####################  Manipulation  #################### 

##### Header Manipulation
#Last Name
colnames(FILENAME)[4]<- "ln"
#First Name
colnames(FILENAME)[5]<- "fn"
#City
colnames(FILENAME)[13]<- "ct"
#Date of Birth
colnames(FILENAME)[16]<- "dob"
#Zip Code
colnames(FILENAME)[15]<- "zip"

##### Column data Manipulation
# Add leading zeros
as.character(FILENAME$zip)
FILENAME$zip <- paste0(
  "0", FILENAME$zip)


####################  After subsetting & auto write multiple CSV  ####################  

library(tidyverse)

FILENAME %>%
  group_by(party, con_dist) %>%
  do(
    write_csv(., sprintf("FILENAME_%s_dist%s.csv", .$party[1], .$con_dist[1]))
  ) %>% 
  invisible()

#Example
Bergen %>%
  group_by(V21) %>%
  do(
    write.csv(., sprintf("FILENAME_dist_%s.csv", .$V21[1]))
  ) %>%
  invisible()

####################  Subsetting Single  ####################

#Sort by Party....V17
#CNV, CON, DEM, GRE, LIB, NAT, REP, RFP, SSP, UNA
dem_FILENAME <- subset(FILENAME, V17 == "DEM")

#sort by Ward....V18
ward_FILENAME <-subset(FILENAME, V18 == "##")

#Sort by District....V19
Dist_FILENAME <-subset(FILENAME, V19 == "##")

#Sort by Congressional....V21
cong_FILENAME <- subset(FILENAME, V21 == "##")

#Sort by Legislative....V22
Legi_FILENAME <- subset(FILENAME, V22 == "##")

########## Subsetting using For Loop ##########

for (i in FILENAME$COLUMN) {
  nam <- paste("NEW_FILENAME", i, sep = "_")
  assign(nam, FILENAME[
    FILENAME$COLUMN==i,])
}




