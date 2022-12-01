# create select insert 
show tables;
#名前の違うコピー　プライマリーキーはつかない
create table tmp_students
select * from students ;

select * from tmp_students;

describe tmp_students;

describe students;

drop table tmp_students;

create table tmp_students
select * from students where id <10;

select * from tmp_students;



select id+9 as id ,first_name ,last_name ,2 as grade from users;


drop table tmp_students;
create table tmp_students
select  first_name,last_name from students 
union
select first_name ,last_name from employees 
union
select first_name ,last_name from customers;

select * from tmp_students;

