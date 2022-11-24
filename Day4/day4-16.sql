#in
select*from users where age in(12,24,36);

select*from users where birth_place in("France","Italy");

#select + in
select*from customers where id in(select customer_id from receipts);
select*from customers where id in(select customer_id from receipts where id<10);

#all any
select*from users where age> all(select age from employees where salary > 5000000);

select*from users where age= any(select age from employees where salary > 5000000);

#and or

select*from employees;

select * from employees where department = " 営業部 " and (name like "%田%"or name like "%西%") and age<35;

select * from employees where department = " 営業部 " or department = " 開発部 ";
select * from employees where department in(" 営業部 "," 開発部 ");

#not 直後の否定
select *from employees where not department = " 営業部 "