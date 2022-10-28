----website:  https://www.sql-practice.com/---
------Hard Level---
SELECT
  COUNT(*) AS patients_in_group,
  FLOOR(weight / 10) * 10 AS weight_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;

select distinct(specialty) from physicians

select patient_id,weight, height,(case when weight/POWER(height/100.0,2)>=30 then '1' else '0' end) as obese 
from patients

select patients.patient_id, patients.first_name,patients.last_name, specialty as attending_physician_specialty
from patients
join admissions
on admissions.patient_id = patients.patient_id
join physicians
on admissions.attending_physician_id = physicians.physician_id
where physicians.first_name ='Lisa' and diagnosis='Epilepsy'

select distinct(patients.patient_id), concat(patients.patient_id,len(patients.last_name),year(birth_date))as temporary_password
from patients
join admissions
on admissions.patient_id = patients.patient_id

select
(case  when patient_id %2=0 then 'yes' else 'No' end)as has_insurance,
--from admissions
sum(case
when patient_id %2 =0 then 10 
    else 50 end) as cost_insurance
from admissions
group by has_insurance


SELECT pr.province_name
FROM patients AS pa
  JOIN province_names AS pr ON pa.province_id = pr.province_id
GROUP BY pr.province_name
HAVING
  COUNT( CASE WHEN gender = 'M' THEN 1 END) > COUNT( CASE WHEN gender = 'F' THEN 1 END);


SELECT pr.province_name
FROM patients AS pa
  JOIN province_names AS pr ON pa.province_id = pr.province_id
GROUP BY pr.province_name
HAVING
  SUM(gender = 'M') > SUM(gender = 'F');
  
select * from patients
where first_name like '__r%'
and gender ='F'
AND month(birth_date) in (2,5,12)
and weight between 60 and 80
and patient_id %2!=0
and city ='Kingston'

SELECT CONCAT(
    ROUND(
      (
        SELECT COUNT(*)
        FROM patients
        WHERE gender = 'M'
      ) / CAST(COUNT(*) as float),
      4
    ) * 100,
    '%'
  ) as percent_of_male_patients
FROM patients;

SELECT
 admission_date,
 count(admission_date) as admission_day,
 count(admission_date) - LAG(count(admission_date)) OVER(ORDER BY admission_date) AS admission_count_change 
FROM admissions
 group by admission_date
 
 WITH admission_counts_table AS (
  SELECT admission_date, COUNT(patient_id) AS admission_count
  FROM admissions
  GROUP BY admission_date
  ORDER BY admission_date DESC
)
select
  admission_date, 
  admission_count, 
  admission_count - LAG(admission_count) OVER(ORDER BY admission_date) AS admission_count_change 
from admission_counts_table
