select *from customers where name is null;

#count 
select count(*)from customers; -- 何行のデータが入っているか
select count(name) from customers; -- 列指定（この行に何行は言っているか）NULLカウントなし

select count(name) from customers where id >80;

select * from customers;

# max:最大　min:最小　
select max(age),min(age) from users where birth_place = "日本";

select max(birth_day), min(birth_day) from users;

#sum: 合計値
select sum(salary) from employees;

select * from employees;

select avg(salary) from employees;

#avg:null　が面倒
create table tmp_count(
	num int
);

show tables;

insert into tmp_count values(1); 
insert into tmp_count values(2);
insert into tmp_count values(3);
insert into tmp_count values(null);

#nullを判断しない
select * from tmp_count;

select avg(coalesce(num,0)) from tmp_count;