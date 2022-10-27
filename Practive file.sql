
--website : https://www.sql-practice.com/

SELECT * FROM patients;

/*
  Start by selecting a question by pressing 'Start' or 'View All Questions'.
  Use the resources and information about the database from the left panel to help.
  Press the run button to execute the query.
  Question is automatically validated every time you execute the query.
  Make your output match the expected output.
 
  If you can't solve a question you can press 'Skip Question' to view the solution.
 
  Keybinds:
    [ctrl + enter]: Execute the SQL
    [ctrl + q]: Auto-format the SQL
*/

select first_name, last_name, gender from patients
where gender ='M'

select first_name, last_name from patients
where allergies is  Null

select first_name from patients
where first_name like 'C%'

select first_name, last_name from patients
where weight between 100 and 120

update patients
set Null="NKA"
where allergies=null

select concat(first_name," ", last_name)as full_name from patients

select first_name, last_name, province_name from patients
inner join province_names
on patients.province_id=province_names.province_id

select count(*) from patients
where year(birth_date)=2010

select first_name, last_name, max(height) from patients

select * from patients
where patient_id in (1,45,534,879,1000)

select count(*) from admissions 

select * from admissions
where admission_date = discharge_date

select patient_id, count(*) as total_admissions from admissions
where patient_id = 579

select distinct(city) from patients
where province_id ='NS'

select first_name, last_name, birth_date from patients
where weight > 70 and height >160

select first_name, last_name, allergies from patients
where city='Hamilton' and allergies is not null

select distinct(year(birth_date))as birth_year from patients
order by birth_year asc

SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(first_name) = 1

select patient_id, first_name from patients
where first_name like 's____%s'

select admissions.patient_id, first_name, last_name from patients
inner join admissions
on patients.patient_id=admissions.patient_id
where diagnosis='Dementia'

select first_name from (select first_name, len(first_name) as lengths from patients) 
--order by (len(first_name)) asc
order by lengths,first_name asc

select male.male_count, female.female_count from 
(select count(*) as male_count from patients where gender='M')as male,
(select count(*) as female_count from patients where gender='F') as female

select first_name, last_name, allergies from patients
where allergies in('Penicillin', 'Morphine')
order by allergies ,first_name,last_name

select patient_id, diagnosis from admissions
group by diagnosis
having 

select city, count(*) as total from patients
group by city
order by total desc, city asc

SELECT first_name, last_name, 'Patient' as role FROM patients
    union all
select first_name, last_name, 'Physician' from physicians;

select allergies, count(*) as total_diagnosis from patients
where allergies is not null
group by allergies
order by total_diagnosis desc

select first_name, last_name,birth_date from patients
where birth_date between '1970-01-01' and '1979-12-31'
order by birth_date asc

select upper(last_name)|| ","|| lower(first_name) from patients
order by first_name desc

select province_id, ceil(sum(height))as total from patients
group by province_id 
having total >= 7000

select (max(weight)-min(weight))as difference_weight from patients
where last_name ='Maroni'

select day(admission_date) as days, count(*) as total_admissions from admissions
group by days
order by total_admissions desc

select * from admissions
where patient_id =542
order by admission_date desc
limit 1

select patient_id,attending_physician_id,diagnosis from admissions
where (patient_id %2 !=0 and attending_physician_id in (1,5,19))
OR 
(attending_physician_id like '%2%' and len(patient_id)=3)

select first_name, last_name, count(*)as total_admissions from admissions
 join physicians
 on physicians.physician_id=admissions.attending_physician_id
 group by attending_physician_id

select physician_id, (first_name || " " ||last_name)as full_name, min(admission_date)as first_admissions, max(admission_date) as last_admissions
 from admissions
 join physicians
 on admissions.attending_physician_id=physicians.physician_id
 group by full_name

select province_name, count(*) as patient_count from patients
join province_names
on province_names.province_id=patients.province_id
group by province_name
order by patient_count desc


select (patients.first_name || " " || patients.last_name) as full_name,
diagnosis,(physicians.first_name ||" " || physicians.last_name)as phy_full_name
from patients
join admissions
on patients.patient_id=admissions.patient_id
join physicians
on physicians.physician_id=admissions.attending_physician_id























