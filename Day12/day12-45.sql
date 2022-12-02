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

#left (outer) join複数のテーブルを結合して、左はすべて、右は紐づけのできたレコードのみを取り出し、それ以外はNULL

# left join 

select emp.id, emp.first_name ,emp.last_name ,coalesce(dt.id,"該当なし") as department_id ,dt.name as department_name
from employees as emp
left join departments as dt 
on emp.department_id = dt.id;

select * from students as st
left join enrollments as enr
on st.id = enr.student_id 
left join 
classes as cs 
on enr.class_id = cs.id;

# right join 
select * from students as st
right join enrollments as enr
on st.id = enr.student_id 
right join 
classes as cs 
on enr.class_id = cs.id;


# full join 両方から取り出して、取得できないものはNULL
select * from students as st
left join enrollments as enr
on st.id = enr.student_id 
left join 
classes as cs 
on enr.class_id = cs.id
union
select * from students as st
right join enrollments as enr
on st.id = enr.student_id 
right join 
classes as cs 
on enr.class_id = cs.id;