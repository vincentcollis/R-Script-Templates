IA_CD4$PRECINCT <- as.character(IA_CD4$PRECINCT)
IA_CD4$PRECINCT[IA_CD4$PRECINCT == "DA/BU"] <- "DA-BU"

IA_CD4$PRECINCT <- as.character(IA_CD4$PRECINCT)
IA_CD4$PRECINCT[IA_CD4$PRECINCT == "OT/PV"] <- "OT-PV"

IA_CD4$PRECINCT <- as.character(IA_CD4$PRECINCT)
IA_CD4$PRECINCT[IA_CD4$PRECINCT == "BD/NWC"] <- "BD-NWC"

IA_CD4 <- append(IA_CD4, 1)
IA_CD4 <- data.frame(IA_CD4)
names(IA_CD4)[names(IA_CD4) == "X1"] <- "County_Precinct"

IA_CD4$County_Precinct <- paste(IA_CD4$COUNTY, IA_CD4$PRECINCT, sep = "_")

DEM_IA_CD4 <- subset(IA_CD4, IA_CD4$PARTY == "DEM")
IND_IA_CD4 <- subset(IA_CD4, IA_CD4$PARTY == "NP")
REP_IA_CD4 <- subset(IA_CD4, IA_CD4$PARTY == "REP")


#Subsetting data by unique entries
#
#Writing each subset of data to csv in working directory

library(tidyverse)

REP_IA_CD4 %>%
  group_by(County_Precinct) %>%
  do(
    write_csv(., sprintf("IA_CD4_%s_REP_08.04.2019.csv", .$County_Precinct[1]))
  ) %>% 
  invisible()

