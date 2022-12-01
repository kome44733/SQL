use day_10_14_db;

select * from departments;

select * from employees;

#exists

select * from employees as em
where exists(
select * from departments as dt where em.department_id = dt.id 
);

#in 

select * from employees as em
where em.department_id in(select id from departments);

select * from employees as em
where exists(
select * from departments as dt where dt.name in ('営業部','開発部') and em.department_id = dt.id
);

