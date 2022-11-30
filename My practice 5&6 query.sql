--From the login_details table, fetch the users who logged in consecutively 3 or more times.

create table login_details
(login_id int PRIMARY key,
 name varchar(50) not null,
 login_date date)
 
 SELECT * from login_details
 
 insert into login_details
 values
 (101, 'Michael', current_date),
(102, 'James', current_date),
(103, 'Stewart', current_date+1),
(104, 'Stewart', current_date+1),
(105, 'Stewart', current_date+1),
(106, 'Michael', current_date+2),
(107, 'Michael', current_date+2),
(108, 'Stewart', current_date+3),
(109, 'Stewart', current_date+3),
(110, 'James', current_date+4),
(111, 'James', current_date+4),
(112, 'James', current_date+5),
(113, 'James', current_date+6);


SELECT * from login_details






select distinct repeated_names
from (
select *,
case when name = lead(name) over(order by login_id)
and  name = lead(name,2) over(order by login_id)
then name else null end as repeated_names
from login_details) x
where x.repeated_names is not null;



--From the students table, write a SQL query to interchange the adjacent student names.

--Note: If there are no adjacent student then the student name should stay the same.

--Table Structure:

drop table students;
create table students
(
id int primary key,
student_name varchar(50) not null
);
insert into students values
(1, 'James'),
(2, 'Michael'),
(3, 'George'),
(4, 'Stewart'),
(5, 'Robin');

select * from students;


SELECT *,
case
 when id%2 !=0 then lead(student_name,1, student_name)over(order by id)
 when id%2=0 then lag(student_name,1, student_name)over(order by id)
end as adjusted_name
from students
--from students