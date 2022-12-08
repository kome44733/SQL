select database();

describe customers;

#is nullでないと取り出せない
select * from customers where name is null;

select null=null;
select null is null;

#is not null
select * from customers where name is not null;

select *from prefectures;

select*from prefectures where name is null;

select*from prefectures where name = "";


#between ,not between 以上　以下
select*from users where age between 5 and 10;

#like ,not like
select *from users where name like "村%"; -- 前方一致

select *from users where name like "%郎";　-- 後方一致

select *from users where name like "%ab%"; -- 中間一致

select *from prefectures where name like "福_%" order by name; -- _は任意の１文字