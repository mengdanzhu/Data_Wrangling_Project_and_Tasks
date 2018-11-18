install.packages('Hmisc')
library(Hmisc)
library(dplyr)
data <- sasxport.get("/Users/mengdan/Desktop/DIQ_I.xpt")
write.csv(data,file="/Users/mengdan/Desktop/midterm_data.csv")
#count the number
table(data$diq160)
sum(is.na(data$diq160))
table(data$diq170)
sum(is.na(data$diq170))
table(data$diq172)
sum(is.na(data$diq172))
#change into factor
cols <- c("diq175a","diq175b","diq175c","diq175d","diq175e","diq175f","diq175g","diq175h",
          "diq175i","diq175j","diq175k","diq175l","diq175m","diq175n","diq175o","diq175p",
          "diq175q","diq175r","diq175s","diq175t","diq175u","diq175v","diq175w","diq175x")
data[cols] <- lapply(data[cols], factor)
str(data)
#change the value and name to a more reasonable one
data[data$DID040==80,]$DID040 <- 90
data[data$DID040==666,]$DID040 <- 0.5
data[data$DID040==777,]$DID040 <- "Refused"
data[data$DID040==999,]$DID040 <- "Don't Know"
mean(data$did040[data$did040>=0 & data$did040<=90],na.rm=TRUE)
#fill the missing value with mean
m <- mean(data$did250[data$did250>=0 & data$did250<=60],na.rm=TRUE)
data[is.na(data$did250),]$did250 <- m
table(data$did250)
#delete the rows with limited information
delete <- subset(data,data$diq010==2 & data$diq050==2 & is.na(data[4]) & is.na(data[5]) & is.na(data[6]))
data <- anti_join(data,delete)
#unit of measure
data$did060 <- data$did060 * ifelse(data$diq060u==2,12,1)
data$did350 <- data$did350 * ifelse(data$diq350u==4,365,1)
data$did350 <- data$did350 * ifelse(data$diq350u==3,30,1)
data$did350 <- data$did350 * ifelse(data$diq350u==2,7,1)
data$did260 <- data$did260 * ifelse(data$diq260u==4,365,1)
data$did260 <- data$did260 * ifelse(data$diq260u==3,30,1)
data$did260 <- data$did260 * ifelse(data$diq260u==2,7,1)
#change the column name
names(data)[2]<-"diabetes"
names(data)[3]<-"age_diabetes"
names(data)[4]<-"evertold_prediabetes"
names(data)[5]<-"evertold_risk"
names(data)[6]<-"feelrisk"
names(data)[7]<-"familyhistory"
names(data)[8]<-"overweight"
names(data)[9]<-"age"
names(data)[10]<-"poordiet"
names(data)[11]<-"race"
names(data)[12]<-"babyover9lbs"
names(data)[13]<-"lackofPhysicalActivity"
names(data)[14]<-"HighBloodPressure"
names(data)[15]<-"HighBloodSugar"
names(data)[16]<-"HighCholesterol"
names(data)[17]<-"Hypoglycemic"
names(data)[18]<-"ExtremeHunger"
names(data)[19]<-"numbness"
names(data)[20]<-"blurredVision"
names(data)[21]<-"increasedFatigue"
names(data)[22]<-"anyone"
names(data)[23]<-"warning"
names(data)[24]<-"other"
names(data)[25]<-"gestationalDiabetes"
names(data)[26]<-"frequentUrination"
names(data)[27]<-"thirst"
names(data)[28]<-"sweet"
names(data)[29]<-"medication"
names(data)[30]<-"PolycysticOvarianSyndrome"
names(data)[31]<-"BloodTested3yrs"
names(data)[32]<-"insulin"
names(data)[33]<-"insulin_time"
names(data)[34]<-"UnitofMeasure"
names(data)[35]<-"diabeticpills"
names(data)[36]<-"specialist"
names(data)[37]<-"oneDr"
names(data)[38]<-"doctor_times"
names(data)[39]<-"checkblood"
names(data)[40]<-"UnitofMeasure"
names(data)[41]<-"checkedforA1C"
names(data)[42]<-"A1Clevel"
names(data)[43]<-"A1CDr"
names(data)[44]<-"recentSBP"
names(data)[45]<-"recentDBP"
names(data)[46]<-"SBP_Dr"
names(data)[47]<-"DBP_Dr"
names(data)[48]<-"recentLDL"
names(data)[49]<-"LDL_Dr"
names(data)[50]<-"sores"
names(data)[51]<-"feet"
names(data)[52]<-"UnitofMeasure"
names(data)[53]<-"dilatedforexam"
names(data)[54]<-"retinopathy"
