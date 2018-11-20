# Data Wrangling Projects

These are all of the projects I have done in the QBS181: Data Wrangling course at Dartmouth.

## Overview

The purpose of this repository is to show all the projects I have done in QBS181 as part of the final.

I have received permission from the instructor to make my code public.

## Description of subdirectories

The tasks for each subdirectory in this repository are as follows:


1. For the project 1:

(1) Rename all the columns in the table Demographics

(2) Create a new column “Enrollment Status” and insert different status in this column

(3) Create a new Column “Sex” and insert different values for sex in this column

(4) Create a new column “Age group” and create age groups with an interval of 25 yrs 


2. For the project 2:

(1) Create a new column “Enrollment group” in the table Phonecall and insert different group names in this column

(2) Obtain the # of records for each enrollment group

(3) Merge the Phone call encounter table with Call duration table

(4) Find out the # of records for different call outcomes and call type. Use 1- Inbound and 2-Outbound, for call types; use 1-No response,2-Left voice mail and 3 successful. Please also find the call duration for each of the enrollment groups

(5) Merge the tables Demographics, Chronic Conditions and TextMessages. Find the # of texts/per week, by the type of sender

(6) Obtain the count of texts based on the chronic condition over a period of time (say per week)


3. For the project 3:

(1) Compute the rate for table2, and table4a+table4b in the tidyr package and perform the four operation

a.	Extract the number of TB cases per country per year

b.	Extract the matching population per country per year

c.	Divide cases by population, and multiply by 10,000

d.	Store back in appropriate place.

(2) Why does this code fail?

table4a%>%gather(1999,2000,key="year",value="cases")

(3) Use the flights dataset in the nycflights13 library and answer the following

a.	How does the distribution of flights times within a day change over the course of the year

b.	Compare dep_time,sched_dep_time, and dep_delay. Are they consistent. Explain your findings

c.	Confirm my hypothesis that the early departures of flights in minutes 20-30 and 50-60 are caused by scheduled flights that leave early. Hint:create a binary variable that tells whether or not a flight was delayed.

(4) Follow the lecture notes/R file on text scraping and scrape this webpage to extract useful information--https://geiselmed.dartmouth.edu/qbs/


4. For the midterm project:

Visit the website https://wwwn.cdc.gov/Nchs/Nhanes/2015-2016/DIQ_I.htm#Data_Processing_and_Editing

(1)	The DIQ_I.xpt file has some problems with its data (e.g., missing values, numeric columns stored as chars, etc.) and need to be cleaned before further use

a.	List the data-related issues you see in this data set

b.	How will you address each data-related issue?

c.	Give justification for why you chose a particular way to address each issue. For example, if you decide to address missing values by removing rows or filling empty data cells, justify your decision or if you want to create a PHI field like year of Birth

(2)	Clean the data by addressing each point listed in 1

(3) Verify that whether the counts of each code or value for various variables are correct as mentioned in the website


5. For the final project:

(1) Consider the following blood pressure dataset (IC_BP.csv). Perform the following operations

a. Convert BPalerts to BPstatus

b. Define Hypotension-1 & Normal as Controlled blood pressure Hypotension-2, Hypertension-1, Hypertension-2 & Hypertension-3 as Uncontrolled blood pressure: Controlled & Uncontrolled blood pressure as 1 or 0 (Dichotomous Outcomes)

c. Merge this table with demographics (SQL table) to obtain their enrollment dates

d. Create a 12-week interval of averaged scores of each customer

e. Compare the scores from baseline (firstweek) to follow-up scores (12 weeks)

f. How many customers were brought from uncontrolled regime to controlled regime after 12 weeks of intervention?

(2) Merge the tables Demographics, Chronic Conditions and TextMessages. Obtain the final dataset such that we have 1 Row per ID by choosing on the latest date when the text was sent (if sent on multiple days)

(3) Repeat Question 2 in R. The answer should reflect use of ODBC drivers to connect to SQL raw tables and import data into the R environment before the wrangling process. Hint: You might want to use tidyr/dplyr packages

(4) Set up a public Git Hub repository to share your code



