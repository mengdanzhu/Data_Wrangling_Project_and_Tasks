--1a
SELECT * From mzhu.IC_BP
Alter table mzhu.IC_BP
ADD BPStatus Int
--1b
UPDATE mzhu.IC_BP
SET BPStatus='0'
WHERE BPAlerts='Hypo1' OR BPAlerts='Normal'
UPDATE mzhu.IC_BP
SET BPStatus='1'
WHERE BPAlerts='Hypo2' OR BPAlerts='HTN1' OR BPAlerts='HTN2' or BPAlerts='HTN3'
--random 10 rows
SELECT TOP 10 * FROM mzhu.IC_BP
ORDER BY NEWID()
--1c
SELECT * into mzhu.final FROM mzhu.IC_BP
INNER JOIN Demographics ON demographics.contactid= IC_BP.ID 
--drop the blank columns 
Alter table mzhu.final
DROP COLUMN gh1, gh2, pf02,gh3,gh4,gh5,test
--random 10 rows
SELECT TOP 10 * FROM mzhu.final
ORDER BY NEWID()
--1d
select ID, DATEDIFF(week, MinDate, ObservedTime) as WeekOrder, AVG(BPStatus) as Average
from (
select mzhu.final.*, a.MinDate as MinDate 
from mzhu.final
inner join
(
SELECT ID, MIN(ObservedTime) as MinDate
FROM mzhu.final
group by ID) a
on mzhu.final.contactid = a.ID
 )AA
WHERE DATEDIFF(week, MinDate, ObservedTime) <= 12
group by ID, DATEDIFF(week, MinDate, ObservedTime)
--1e
--append minimum of the ObservedTime for each user id to the original table
SELECT * into mzhu.MinDate from (
select mzhu.final.*, a.MinDate as MinDate 
from mzhu.final
inner join
(
SELECT ID, MIN(ObservedTime) as MinDate
FROM mzhu.final
group by ID) a
on mzhu.final.contactid = a.ID
 )AA
--create a new table showing the first-week score and the twelfth-week score
SELECT A.ID, A.Firstweek, B.ID As UserID, B.TwelfthWeek into mzhu.compare
from (
SELECT ID, AVG(BPStatus) as FirstWeek
from mzhu.MinDate
where ObservedTime <= DATEADD(week,1,TRY_CONVERT(date,MinDate))
group by ID) A
inner join
(SELECT ID, AVG(BPStatus) as TwelfthWeek 
from mzhu.MinDate
where ObservedTime between DateAdd(week,11,TRY_CONVERT(date,MinDate)) and DateAdd(week,12,TRY_CONVERT(date,MinDate))
Group by ID) B
on A.ID=B.ID
--random 10 rows
SELECT TOP 10 * FROM mzhu.compare
ORDER BY NEWID()
--1f
SELECT * from mzhu.compare
where FirstWeek=0 and TwelfthWeek=1

--2
--merge the Demographics, ChronicConditions and Text
SELECT A.*,B.*,C.* into mzhu.final2 FROM Demographics A
inner join 
ChronicConditions B
on A.contactid = B.tri_patientid
inner join 
Text C
on A.contactid=C.tri_contactid
--drop the blank columns
Alter table mzhu.final2
DROP COLUMN gh1, gh2, pf02,gh3,gh4,gh5,test
--To obtain 1 Row per ID by choosing on the latest date when the text was sent
SELECT mzhu.final2.*, D.* into mzhu.final3 FROM mzhu.final2 
inner join
(
select tri_contactid As id, MAX(TextSentDate) AS LatestDate
   FROM mzhu.final2
   GROUP BY tri_contactid
) D
on (mzhu.final2.TextSentDate = D.LatestDate and mzhu.final2.tri_contactId = D.id)
--delete extra column id and TextSentDate
ALTER TABLE mzhu.final3 DROP Column id, TextSentDate
--show random order 
SELECT TOP 10 * FROM mzhu.final3
ORDER BY NEWID()

