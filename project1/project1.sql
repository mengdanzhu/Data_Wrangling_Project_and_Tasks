SELECT * into mzhu.demo from Demographics
select top 10 * from mzhu.demo
select * from mzhu.demo
select * from demographics

Alter table mzhu.demo
DROP COLUMN gh1, gh2, pf02,gh3,gh4,gh5,test
--question1
sp_RENAME 'mzhu.demo.tri_age', 'age', 'COLUMN'
sp_RENAME 'mzhu.demo.gendercode', 'Gender', 'COLUMN'
sp_RENAME 'mzhu.demo.contactid', 'id', 'COLUMN'
sp_RENAME 'mzhu.demo.address1_stateorprovince', 'State', 'COLUMN'
sp_RENAME 'mzhu.demo.tri_imaginecareenrollmentemailsentdate', 'EmailSentdate', 'COLUMN'
sp_RENAME 'mzhu.demo.tri_enrollmentcompletedate', 'Completedate', 'COLUMN'

Alter table mzhu.demo
add timeforcompletion as DATEDIFF(day, try_convert(date, EmailSentdate), try_convert(date,Completedate)) 
--question2
Alter table mzhu.demo
ADD EnrollmentStatus NVARCHAR(50) 
UPDATE mzhu.demo
SET EnrollmentStatus='Complete'
WHERE tri_imaginecareenrollmentstatus=167410011
UPDATE mzhu.demo
SET EnrollmentStatus='Email'
WHERE tri_imaginecareenrollmentstatus=167410001
UPDATE mzhu.demo
SET EnrollmentStatus='Non responder'
WHERE tri_imaginecareenrollmentstatus=167410004
UPDATE mzhu.demo
SET EnrollmentStatus='Facilitated Enrollment'
WHERE tri_imaginecareenrollmentstatus=167410005
UPDATE mzhu.demo
SET EnrollmentStatus='Incomplete Enrollments'
WHERE tri_imaginecareenrollmentstatus=167410002
UPDATE mzhu.demo
SET EnrollmentStatus='Opted Out'
WHERE tri_imaginecareenrollmentstatus=167410003
UPDATE mzhu.demo
SET EnrollmentStatus='Unprocessed'
WHERE tri_imaginecareenrollmentstatus=167410000
UPDATE mzhu.demo
SET EnrollmentStatus='Second email sent'
WHERE tri_imaginecareenrollmentstatus=167410006
--question3
Alter table mzhu.demo
ADD SEX NVARCHAR(50) 
UPDATE mzhu.demo
SET SEX='Female'
WHERE Gender='2'
UPDATE mzhu.demo
SET SEX='Male'
WHERE Gender='1'
UPDATE mzhu.demo
SET SEX='Other'
WHERE Gender='167410000'
UPDATE mzhu.demo
SET SEX='Unknown'
WHERE Gender='NULL'
--question4
Alter table mzhu.demo
ADD AgeGroup NVARCHAR(50)
UPDATE mzhu.demo
SET AgeGroup='0-25'
WHERE age>=0 AND age<=25
UPDATE mzhu.demo
SET AgeGroup='26-50'
WHERE age>=26 AND age<=50
UPDATE mzhu.demo
SET AgeGroup='51-75'
WHERE age>=51 AND age<=75
UPDATE mzhu.demo
SET AgeGroup='76-100'
WHERE age>=76 AND age<=100
