show databases;
use day_10_14_db;

show tables;

select * from  employees;

select * from departments;


#通常のjoin
select * from employees as emp
inner join departments as dt 
on emp.department_id = dt.id;

#特定のカラムを取り出す
select emp.id, emp.first_name ,emp.last_name ,dt.id as department_id ,dt.name as department_name
from employees as emp
inner join departments as dt 
on emp.department_id = dt.id;

#複数のレコードで紐づける
select * from students as st
inner join
users as user
on st.first_name =user.first_name and st.last_name = user.last_name;

# =以外で紐づける
select * from employees as emp
inner join 
students as st
on emp.id < st.id;