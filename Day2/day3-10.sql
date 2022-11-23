select database();
use my_db;

create table people(
 id int primary key,
 name varchar(50),
 birth_day date default "1990-01-01"
);

insert into people values(1,"tao","2001-01-01");

#select
select*from people;

#insert カラム指定
insert  into people(id,name) values(2,"Jiro");

#シングルクォーテーション
insert  into people(id,name) values(3,'Saburou');

insert  into people values(4,'John''s son','2021-01-01');

insert  into people values(5,'John"s son','2021-01-01');

insert  into people values(6,"John's son","2021-01-01");