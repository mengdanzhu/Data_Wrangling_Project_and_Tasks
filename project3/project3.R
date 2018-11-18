library(dplyr)
library(tidyr)
#1
table_4a <- table4a%>%gather(`1999`,`2000`,key="year",value="cases") %>% arrange(desc(year))
table_4b <- table4b%>%gather(`1999`,`2000`,key="year",value="population") %>% arrange(desc(year))
sum <- table_4a%>%inner_join(table_4b,by=c("country","year"))
sum <- sum %>% mutate(rate=cases/population*10000)
#1a
table2
newdata <- table2 %>% spread(type,count) 
newdata %>% select(country,year,cases) %>% arrange(desc(year))
#1b
newdata %>% select(country,year,population) %>% arrange(desc(year))
#1c
newdata %>% mutate(rate = cases/population*10000)
#1d
newdf <- newdata %>% mutate(rate = cases/population*10000)
#2
#It should be: table4a %>% gather(`1999`,`2000`,key="year",value="cases"), because the key in the table4a include the single quotes.
#3a
library(nycflights13)
flights %>% group_by(month,day, air_time) %>% summarise(count=n())
distribution <- flights %>% group_by(month,day, air_time) %>% summarise(count=n())
distribution1 <- flights %>% filter(month==1) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution2 <- flights %>% filter(month==2) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution3 <- flights %>% filter(month==3) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution4 <- flights %>% filter(month==4) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution5 <- flights %>% filter(month==5) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution6 <- flights %>% filter(month==6) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution7 <- flights %>% filter(month==7) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution8 <- flights %>% filter(month==8) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution9 <- flights %>% filter(month==9) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution10 <- flights %>% filter(month==10) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution11 <- flights %>% filter(month==11) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
distribution12 <- flights %>% filter(month==12) %>% summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
summarize(mean=mean(air_time,na.rm=TRUE),sd=sd(air_time,na.rm=TRUE))
vector <- c(distribution1,distribution2,distribution3,distribution4,distribution5,distribution6,
            distribution7,distribution8,distribution9,distribution10,distribution11,distribution12)
vector
#3b
flightdata <- flights %>% mutate(deptime.hour=dep_time%/%100,deptime.min=dep_time %% 100,sch.deptime.hour=sched_dep_time%/%100,sch.deptime.min=sched_dep_time %% 100) %>%
  mutate(deptime.totalmin=deptime.hour*60+deptime.min) %>%
  mutate(sch.deptime.totalmin=sch.deptime.hour*60+sch.deptime.min) %>%
  mutate(diff = deptime.totalmin - sch.deptime.totalmin - dep_delay) %>%
  filter(diff != 0)
#Achieve the hour and minute from the dep_time and the sch.deptime, and convert into total minutes. 
#Then we could get the difference between deptime.totalmin and sch.deptime.totalmin. We sift through those differences that are not 0.
#Then, I found that part of the time in the dep_time is actually the next day. 
#So I did the conversion of this part again(see the below R code)and found the differences of this part were all 0, which indicates the calculation of the dep_delay column is right. 
#Therefore, dep_time,sched_dep_time, and dep_delay are consistent.
anotherday <- flightdata %>% mutate(another.diff = deptime.totalmin+24*60 - sch.deptime.totalmin - dep_delay) %>%
  filter(another.diff != 0)

#3c
delayornot <- flights %>% filter((minute >=20 & minute <=30) | (minute >=50 & minute <=60)) %>%
  mutate(delay=dep_delay>0)
#Create a binary variable called delay. In the delay column, “True” means the flight was delayed and “False” means the flight is not delayed.
twenty <- delayornot %>% filter((minute >=20 & minute <=30) & (delay==TRUE)) %>%
  summarise(count=n())
fifty <- delayornot %>% filter((minute >=50 & minute <=60) & (delay==TRUE)) %>%
  summarise(count=n())
#Therefore, we can find that flights leaving in 50-60min are less delayed compared to those leaving in 20-30min.

#4
library(rvest)
scraping_web <-  read_html("https://geiselmed.dartmouth.edu/qbs/")
head(scraping_web)
h1_text <- scraping_web %>% html_nodes("h1") %>% html_text()
h2_text <- scraping_web%>% html_nodes("h2") %>% html_text()
length(h2_text)
h3_text <- scraping_web %>% html_nodes("h3") %>% html_text()
h4_text <- scraping_web %>% html_nodes("h4") %>% html_text()
p_nodes <- scraping_web %>% html_nodes("p")
p_nodes[1:6]
p_text <- scraping_web %>% html_nodes("p") %>% html_text()
length(p_text)

ul_text <- scraping_web %>% html_nodes("ul") %>%html_text()
length(ul_text)

ul_text[1]
substr(ul_text[2],start=1,stop=19)
li_text <- scraping_web %>% html_nodes("li") %>%html_text()
length(li_text)
li_text[1:8]

# all text irrespecive of headings, paragrpahs, lists, ordered list etc..
all_text <- scraping_web %>%
  html_nodes("div") %>% 
  html_text()
all_text

p_text

body_text <- scraping_wiki %>%
  html_nodes("#mw-content-text") %>% 
  html_text()
substr(body_text, start = 1, stop = 57)
