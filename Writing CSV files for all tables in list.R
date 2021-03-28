#writing csv files for all tables in list

#First save all the tables youn want to write into a list
list.of.tables <- list(dfc1, dfc2, dfc3, dfc4, dfc5, dfc6, dfc7, dfc8, dfc9)

#Write for loop for lenght of list.of.tables
for(i in 1:length(list.of.tables)){
  write.csv(list.of.tables[[i]], paste0('dfc',i,".csv"))
}