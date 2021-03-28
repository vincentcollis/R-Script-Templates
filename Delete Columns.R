#Delete Columns

myData <- select(myData, -B)

IA_CD4 <- select(IA_CD4, -LAST_UPDATED_DATE)
