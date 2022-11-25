#length, char_length
select length("ABC");
select length("あいう"); -- 9バイト

select name,length(name) from users;


select char_length("ABC");
select char_length("あいう")as length; -- 3文字

select name,char_length(name) from users;

# trim ,ltim, rtrim 空白削除
select ltrim(" ABC ");
select rtrim(" ABC ");
select trim(" ABC ");

select name, char_length(name) as name_length 
from employees 
where char_length(name) <> char_length(trim(name)); 

# updateして空白を削除
update employees 
set name = trim(name)
where char_length(name) <> char_length(trim(name)); 

#replace: 置換
select replace("I like an apple","apple","lemon");

select replace(name,"Mrs","Ms") from users where name like "Mrs%";

update users set name = replace(name,"Mrs","Ms") where name like "Mrs%";

select*from users;

#upper, lower
select upper("apple");
select lower("APPLE");

select name, upper(name),lower(name) from users;

#substring 一部取り出し
select substring(name,2,3), name from employees;

select * from employees where substr(name,2,1)= "田" ;

#reverse　逆順
select reverse(name),name from employees;