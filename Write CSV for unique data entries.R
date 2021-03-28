#Subsetting data by unique entries
#
#Writing each subset of data to csv in working directory

library(tidyverse)

mtcars %>%
  group_by(gear, carb) %>%
  do(
    write_csv(., sprintf("new_mtcars_g%s_c%s.csv", .$gear[1], .$carb[1]))
  ) %>% 
  invisible()