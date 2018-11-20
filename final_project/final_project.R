install.packages("RODBC")
install.packages("dplyr")
install.packages("tidyr")
library(RODBC)
library(dplyr)
library(tidyr)
#connect to odbc
myconn <- odbcConnect("dartmouth1",uid="mzhu",pwd="mzhu@qbs181")
#import data from Demographics
demo <- sqlQuery(myconn,"SELECT * From Demographics")
#import data from ChronicConditions
chronic <- sqlQuery(myconn,"SELECT * from ChronicConditions")
#import data from Text
text <- sqlQuery(myconn,"SELECT * from Text")
#delete the column gh1, gh2, pf02,gh3,gh4,gh5,test in Demographics
demo <- demo[,-9:-15]
#merge table Demographics and table ChronicConditions by contactid and tri_patientid
join <- merge(x=demo,y=chronic,by.x="contactid",by.y="tri_patientid")
#mergethe above new table and table Demographics and table Text by contactid and tri_contactId
join2 <- merge(x=join,y=text,by.x="contactid",by.y="tri_contactId")
#Obtaining 1 Row per ID by choosing on the latest date when the text was sent
join3 <- join2 %>% 
  group_by(contactid) %>% 
  slice(which.max(TextSentDate))

