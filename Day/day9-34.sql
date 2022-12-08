#having
select department, avg(salary) from employees group by department having avg(salary) > 3980000;

select *from users;

#ごとと　人数
select birth_place,age,count(*) from users
group by birth_place, age 
having count(*)>2
order by age;

#
select 
"重複なし"
from 
users 
having
count(distinct name) = count(name);