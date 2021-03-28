#Calculate Age
install.packages("lubridate")
library(lubridate)

df <- append(df, 1)
df <- data.frame(df)
names(df)[names(df) == "X1"] <- "age"

age <- function(dob, age.day = today(), units = "years", floor = TRUE) {
  calc.age = interval(dob, age.day) / duration(num = 1, units = units)
  if (floor) return(as.integer(floor(calc.age)))
  return(calc.age)
}

my.dob <- as.Date(df$dob)
df$age <- age(my.dob)


########## Example
IA_CD4 <- append(IA_CD4, 1)
IA_CD4 <- data.frame(IA_CD4)
names(IA_CD4)[names(IA_CD4) == "X1"] <- "age"

age <- function(dob, age.day = today(), units = "years", floor = TRUE) {
  calc.age = interval(dob, age.day) / duration(num = 1, units = units)
  if (floor) return(as.integer(floor(calc.age)))
  return(calc.age)
}

my.dob <- as.Date(IA_CD4$dob)
IA_CD4$age <- age(my.dob)

########## 
########## 
########## 
########## 
########## Capture year of birth from age

IA_CD4 <- append(IA_CD4, 1)
IA_CD4 <- data.frame(IA_CD4)
names(IA_CD4)[names(IA_CD4) == "X1"] <- "doby" # date of birth year

my.dob <- IA_CD4$dob
IA_CD4$doby <- substring(my.dob,1,4) #This takes string and only keeps the characters beginning in position 1 to position 4


#Example
a <- c("2009-01-01", "2010-01-01" , "2011-01-01")
substring(a,1,4) #This takes string and only keeps the characters beginning in position 1 to position 4
