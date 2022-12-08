use day_4_9_db;

select database();

show tables;

#if (条件式、新、偽)
select if(10<20,"B","A");

select *from users;

select *,if(birth_place="日本","日本人","その他")as "国籍" from users;

select name, age,if(age<20,"未成年","成人") from users;

select *from students;

select *,if(class_no=6 and height >170, "6組-170以上","その他")from students;

select *from users;

select name,if(name like "%田%","田を含む","その他")as name_check from users;