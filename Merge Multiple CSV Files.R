# Using R to Merge the CSV Files
# https://towardsdatascience.com/using-r-to-merge-the-csv-files-in-code-point-open-into-one-massive-file-933b1808106

# set working directory to folder where files are
setwd("~/Temp")

# pass all the filenames of everything in that folder into a variable
filenames <- list.files(full.names = TRUE)

# creates function that iterates each file in the filenames variable, reads the data in, and applys it into the All variable
All <- lapply(filenames,function(i) {read.csv(i, header = FALSE, skip = 4)})

# converts All into a data fram
df <- do.call(rbind.data.frame, All)

write.csv(df,"all.csv", row.names = FALSE)

