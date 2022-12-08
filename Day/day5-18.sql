#算術演算子
#+,-,*./.%
use day_4_9_db;

select 1+1;

select name, age, age+3 as age_3 from users limit 10;

select 10-5;

select age-1 as age_1 from users;

select birth_day, birth_day+3 from users;

select 3*5;

select *from employees;

select department, name ,salary,salary*1.1 as salary_next_year from employees;

select department, name ,salary,salary*0.9 as salary_next_year from employees;

select 10/3;

select salary/10 from employees;

select 10%3;

select age%12 from users;

#concat
select concat(department,": ",name)as "部署:名前" from employees;
select concat(name,"(",age,")")as "名前（年齢）"from users;

#now curdate date_format
select now(); -- 現時刻
select now(),name,age from users;

select curdate(); -- 日付

select date_format(now(),"%Y/%m/%d %H");
