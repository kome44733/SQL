show databases;

use day_10_14_dbb;

select * from employees;

-- update更新したいテーブルset更新した列

update employees set age = age+1 where id=1;

select *from employees;

select 
* 
from 
employees as e
where e.department_id =(select id from departments where name = "営業部");

#営業部年齢２＋
update employees e
set e.age = e.age+2
where e.department_id =(select id from departments where name = "営業部");

select * from employees e ;


#innner join 
select * from employees;



alter table employees add department_name varchar(255);

#left join
select e.*,coalesce(d.name,"不明") from 
employees e 
left join departments d 
on e.department_id = d.id;



update
employees e 
left join departments d 
on e.department_id = d.id
set e.department_name = coalesce(d.name,"不明");

select * from employees;