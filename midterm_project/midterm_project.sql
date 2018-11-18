SELECT * from mzhu.midterm_data 
Alter table mzhu.midterm_data
drop column column1

UPDATE mzhu.midterm_data
SET diq175x='NULL' WHERE diq175x='NA'
--count
SELECT COUNT(diq160) FROM mzhu.midterm_data WHERE diq160=1
SELECT COUNT(diq160) FROM mzhu.midterm_data WHERE diq160=2
SELECT COUNT(diq160) FROM mzhu.midterm_data WHERE diq160=7
SELECT COUNT(diq160) FROM mzhu.midterm_data WHERE diq160=9
SELECT COUNT(diq170) FROM mzhu.midterm_data WHERE diq170=1
SELECT COUNT(diq170) FROM mzhu.midterm_data WHERE diq170=2
SELECT COUNT(diq170) FROM mzhu.midterm_data WHERE diq170=7
SELECT COUNT(diq170) FROM mzhu.midterm_data WHERE diq170=9
SELECT COUNT(diq172) FROM mzhu.midterm_data WHERE diq172=1
SELECT COUNT(diq172) FROM mzhu.midterm_data WHERE diq172=2
SELECT COUNT(diq172) FROM mzhu.midterm_data WHERE diq172=7
SELECT COUNT(diq172) FROM mzhu.midterm_data WHERE diq172=9
--change the value and name to a more reasonable one
UPDATE mzhu.midterm_data
SET did040=90 WHERE did040=80
UPDATE mzhu.midterm_data
SET did040=0.5 WHERE did040=666
SELECT AVG(did040) FROM mzhu.midterm_data
WHERE (did040>=0 and did040<=90);

ALTER TABLE mzhu.midterm_data
ALTER COLUMN did040 nvarchar(50);
UPDATE mzhu.midterm_data
SET did040='Refused' WHERE did040=777
UPDATE mzhu.midterm_data
SET did040='Dont know' WHERE did040=999

--fill the missing value with mean
SELECT AVG(did250) FROM mzhu.midterm_data
WHERE (did250>=0 and did250<=60);
UPDATE mzhu.midterm_data
SET did250=4 WHERE did250 is NULL
--delete the rows with limited information
DELETE FROM mzhu.midterm_data
WHERE (diq010=2 and diq050=2 and diq160 is NULL and diq170 is NULL and diq172 is NULL); 
--unit of measure
UPDATE mzhu.midterm_data
SET did060=did060*12 WHERE diq060u=2
UPDATE mzhu.midterm_data
SET did350=did350*365 WHERE diq350u=4
UPDATE mzhu.midterm_data
SET did350=did350*30 WHERE diq350u=3
UPDATE mzhu.midterm_data
SET did350=did350*7 WHERE diq350u=2
UPDATE mzhu.midterm_data
SET did260=did260*365 WHERE diq260u=4
UPDATE mzhu.midterm_data
SET did260=did260*30 WHERE diq260u=3
UPDATE mzhu.midterm_data
SET did260=did260*7 WHERE diq260u=2
--change column names 
sp_rename 'mzhu.midterm_data.diq010', 'diabetes', 'COLUMN'
sp_rename 'mzhu.midterm_data.did040', 'age_diabetes', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq160', 'evertold_prediabetes', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq170', 'evertold_risk', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq172', 'feelrisk', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175a', 'familyhistory', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175b', 'overweight', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175c', 'age', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175d', 'poordiet', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175e', 'race', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175f', 'babyover9lbs', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175g', 'lackofPhysicalActivity', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175h', 'HighBloodPressure', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175i', 'HighBloodSugar', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175j', 'HighCholesterol', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175k', 'Hypoglycemic', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175l', 'ExtremeHunger', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175m', 'numbness', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175n', 'blurredVision', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175o', 'increasedFatigue', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175p', 'anyone', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175q', 'warning', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175r', 'other', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175s', 'gestationalDiabetes', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175t', 'frequentUrination', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175u', 'thirst', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175v', 'sweet', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175w', 'medication', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq175x', 'PolycysticOvarianSyndrome', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq180', 'BloodTested3yrs', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq050', 'insulin', 'COLUMN'
sp_rename 'mzhu.midterm_data.did060', 'insulin_time', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq060u', 'UnitofMeasure', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq070', 'diabeticpills', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq230', 'specialist', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq240', 'oneDr', 'COLUMN'
sp_rename 'mzhu.midterm_data.did250', 'doctor_times', 'COLUMN'
sp_rename 'mzhu.midterm_data.did260', 'checkblood', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq260u', 'UnitofMeasure2', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq275', 'checkedforA1C', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq280', 'A1Clevel', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq291', 'A1CDr', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq300s', 'recentSBP', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq300d', 'recentDBP', 'COLUMN'
sp_rename 'mzhu.midterm_data.did310s', 'SBP_Dr', 'COLUMN'
sp_rename 'mzhu.midterm_data.did310d', 'DBP_Dr', 'COLUMN'
sp_rename 'mzhu.midterm_data.did320', 'recentLDL', 'COLUMN'
sp_rename 'mzhu.midterm_data.did330', 'LDL_Dr', 'COLUMN'
sp_rename 'mzhu.midterm_data.did341', 'sores', 'COLUMN'
sp_rename 'mzhu.midterm_data.did350', 'feet', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq350u', 'UnitofMeasure3', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq360', 'dilatedforexam', 'COLUMN'
sp_rename 'mzhu.midterm_data.diq080', 'retinopathy', 'COLUMN'
