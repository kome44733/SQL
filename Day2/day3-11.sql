show tables;

#全レコード
select *from people;

#カラムの一部
select name, id,birth_day,name from people;

select id as "番号" ,name as "名前" from people;

#where句 where後に条件
select*from people where id <= 3;

#update
update people set birth_day="1900-01-01",name="";
select*from people;

#update where
update people set name = "Taro",birth_day="2000-01-01" where id=3;
select*from people;

update people set name = "Taro",birth_day="2000-01-01" where id>4;
select*from people;

#delete
delete from people where id>4;
select*from people;

delete from people;