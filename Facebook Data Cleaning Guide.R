#Facebook Data cleaning

#This is a a guide with suggestions on how to prepare data to be uploaded to facebook via custom audience manager

####################  Manipulation  #################### 

##### Header Manipulation
#Last Name
colnames(FILENAME)[variable_number]<- "ln"
#First Name
colnames(FILENAME)[variable_number]<- "fn"
#City
colnames(FILENAME)[variable_number]<- "ct"
#Date of Birth
colnames(FILENAME)[variable_number]<- "dob"
#Zip Code
colnames(FILENAME)[variable_number]<- "zip"
#Email
colnames(FILENAME)[variable_number]<- "email"
#phone number
colnames(FILENAME)[variable_number] <- "phone"
#gender
colnames(FILENAME)[variable_number]<- "gen"

##EXAMPLE:
  colnames(Iowa2017)[1]<- "country"
  
# Use this in order to find number position of variable
  list(colnames(Iowa2017)) 

##### Additional Columns

#Important: Always include your customers’ countries in their own column in your file, even if all of your data is from the same country. Because we match on a global scale, this simple step helps us match as many people as possible from your customer list.

colnames(FILENAME) <- c("country")

Iowa2017$country <= "US"
