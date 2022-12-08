show tables;

describe people;

alter table people add age int after name;

insert into people values(1,"Jhon",18,"2001-01-01");
insert into people values(2,"Alice",15,"2001-01-01");
insert into people values(3,"Paul",19,"2001-01-01");
insert into people values(4,"Chris",17,"2001-01-01");
insert into people values(5,"Vette",20,"2001-01-01");
insert into people values(6,"Jhon",21,"2001-01-01");

select*from people;

#降順
select*from people order by age desc;

#昇順 (asc書かなくても良い)
select*from people order by age　asc;

select*from people order by name;

#2つカラム カラム１つに対して（降順、昇順）指定
select*from people order by birth_day desc, name desc;

#asc昇順
#desc降順

#disntict
select distinct birth_day from people order by birth_day;

select distinct name, birth_day from people;

#limitは最初の行だけ表示 limit 表示数
select*from people limit 3;

#飛ばして表示　limit ３飛ばす数、２表示数
select*from people limit 3,2;
#飛ばして表示　limit 2飛ばす数、4表示数
select*from people limit 4 offset 2;
#