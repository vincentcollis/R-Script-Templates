

#This formula will change data in a new column based on another columns value


#df = the main data frame
#x1 is the column that will recieve the change
#y2 is the column from which the decision is being based on

df <- within(df, X1[Y2 == "M"] <- "Male")
df <- within(df, X1[Y2 == "F"] <- "Female")
                          