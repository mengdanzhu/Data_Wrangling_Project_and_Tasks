--question1
SELECT * into mzhu.demo2 from Phonecall
Alter table mzhu.demo2
ADD EnrollmentGroup NVARCHAR(50)
UPDATE mzhu.demo2
SET EnrollmentGroup='Clinical Alert'
WHERE EncounterCode=125060000 
UPDATE mzhu.demo2
SET EnrollmentGroup='Health Coaching'
WHERE EncounterCode=125060001 
UPDATE mzhu.demo2
SET EnrollmentGroup='Technical Question'
WHERE EncounterCode=125060002 
UPDATE mzhu.demo2
SET EnrollmentGroup='Administrative'
WHERE EncounterCode=125060003 
UPDATE mzhu.demo2
SET EnrollmentGroup='Other'
WHERE EncounterCode=125060004 
UPDATE mzhu.demo2
SET EnrollmentGroup='Lack of engagement'
WHERE EncounterCode=125060005 
select top 10 * from mzhu.demo2
--question2
SELECT COUNT(EnrollmentGroup) FROM mzhu.demo2 
WHERE EnrollmentGroup='Clinical Alert'
SELECT COUNT(EnrollmentGroup) FROM mzhu.demo2 
WHERE EnrollmentGroup='Health Coaching'
SELECT COUNT(EnrollmentGroup) FROM mzhu.demo2 
WHERE EnrollmentGroup='Technical Question'
SELECT COUNT(EnrollmentGroup) FROM mzhu.demo2 
WHERE EnrollmentGroup='Administrative'
SELECT COUNT(EnrollmentGroup) FROM mzhu.demo2
WHERE EnrollmentGroup='Other'
SELECT COUNT(EnrollmentGroup) FROM mzhu.demo2 
WHERE EnrollmentGroup='Lack of engagement'
--question3
SELECT * into mzhu.demo3
FROM CallDuration
INNER JOIN mzhu.demo2 ON 
CallDuration.tri_CustomerIDEntityReference = mzhu.demo2.CustomerId;

select top 10 * from mzhu.demo3
--question4
SELECT COUNT(CallType) FROM CallDuration WHERE CallType=1
SELECT COUNT(CallType) FROM CallDuration WHERE CallType=2
SELECT COUNT(CallOutcome) FROM CallDuration WHERE CallOutcome=1
SELECT COUNT(CallOutcome) FROM CallDuration WHERE CallOutcome=2
SELECT COUNT(CallOutcome) FROM CallDuration WHERE CallOutcome=3
SELECT SUM(CallDuration) FROM mzhu.demo3 WHERE EnrollmentGroup='Clinical Alert';
SELECT SUM(CallDuration) FROM mzhu.demo3 WHERE EnrollmentGroup='Health Coaching';
SELECT SUM(CallDuration) FROM mzhu.demo3 WHERE EnrollmentGroup='Technical Question';
SELECT SUM(CallDuration) FROM mzhu.demo3 WHERE EnrollmentGroup='Administrative';
SELECT SUM(CallDuration) FROM mzhu.demo3 WHERE EnrollmentGroup='Other';
SELECT SUM(CallDuration) FROM mzhu.demo3 WHERE EnrollmentGroup='Lack of engagement';
--question5
SELECT * from demographics
SELECT * from ChronicConditions
SELECT * from Text
--5a
SELECT * into mzhu.demo4
FROM demographics
INNER JOIN ChronicConditions ON demographics.contactid= ChronicConditions.tri_patientid
INNER JOIN Text ON demographics.contactid= Text.tri_contactid;
Alter table mzhu.demo4
DROP COLUMN gh1, gh2, pf02,gh3,gh4,gh5,test
select top 10 * from mzhu.demo4
--5b
SELECT MIN(TextSentDate) FROM mzhu.demo4 WHERE SenderName='Clinician';
SELECT MAX(TextSentDate) FROM mzhu.demo4 WHERE SenderName='Clinician';
SELECT datediff(week,'2016/02/07','2017/02/03')
SELECT COUNT(TextSentDate)/51 As ClinicianTextPerWeek FROM mzhu.demo4
WHERE SenderName='Clinician'

SELECT MIN(TextSentDate) FROM mzhu.demo4 WHERE SenderName='System';
SELECT MAX(TextSentDate) FROM mzhu.demo4 WHERE SenderName='System';
SELECT COUNT(TextSentDate)/45 As SystemTextPerWeek FROM mzhu.demo4
WHERE SenderName='System'

SELECT MIN(TextSentDate) FROM mzhu.demo4
WHERE SenderName='Customer';
SELECT datediff(week,'2016/03/01','2017/02/03')
SELECT COUNT(TextSentDate)/48 As CustomerTextPerWeek FROM mzhu.demo4
WHERE SenderName='Customer'
--question6
--6a Activity Monitoring
SELECT MIN(TextSentDate) FROM mzhu.demo4 WHERE tri_name='Activity Monitoring';
SELECT MAX(TextSentDate) FROM mzhu.demo4 WHERE tri_name='Activity Monitoring';
SELECT datediff(week,'2016/02/07','2017/02/03')
SELECT COUNT(TextSentDate)/51
FROM mzhu.demo4
WHERE tri_name='Activity Monitoring'
--6b Hypertension
SELECT MIN(TextSentDate) FROM mzhu.demo4 WHERE tri_name='Hypertension';
SELECT MAX(TextSentDate) FROM mzhu.demo4 WHERE tri_name='Hypertension';
SELECT datediff(week,'2016/03/02','2017/02/03')
SELECT COUNT(TextSentDate)/48 FROM mzhu.demo4
WHERE tri_name='Hypertension'
--6c COPD
SELECT MIN(TextSentDate) FROM mzhu.demo4 WHERE tri_name='COPD';
SELECT MAX(TextSentDate) FROM mzhu.demo4 WHERE tri_name='COPD';
SELECT datediff(week,'2016/03/03','2017/02/03')
SELECT COUNT(TextSentDate)/48 FROM mzhu.demo4
WHERE tri_name='COPD'
--6d Congestive Heart Failure
SELECT MIN(TextSentDate) FROM mzhu.demo4 WHERE tri_name='Congestive Heart Failure';
SELECT MAX(TextSentDate) FROM mzhu.demo4 WHERE tri_name='Congestive Heart Failure';
SELECT datediff(week,'2016/03/15','2017/02/03')
SELECT COUNT(TextSentDate)/46
FROM mzhu.demo4
WHERE tri_name='Congestive Heart Failure'
--6e Diabetes
SELECT MIN(TextSentDate) FROM mzhu.demo4 WHERE tri_name='Diabetes';
SELECT MAX(TextSentDate) FROM mzhu.demo4 WHERE tri_name='Diabetes';
SELECT datediff(week,'2016/03/07','2017/02/03') 
SELECT COUNT(TextSentDate)/47
FROM mzhu.demo4
WHERE tri_name='Diabetes'

