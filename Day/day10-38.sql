show tables;

select * from employees;


#部署一覧
select * from departments;

# inで絞込
select * from employees where department_id in(1,2);



# 別のテーブルから問い合わせ　#服問い合わせ
select * from departments where name in('経営企画部','営業部');
select * from employees where department_id in(select id from departments where name in('経営企画部','営業部'));



select * from students;
select  * from users;

#複数カラムのin #服問い合わせ
select * from students 
where (first_name,last_name)in (
select first_name,last_name from users
);

#　副問い合わせ3: 集計
select max(age) from employees;

select * from employees where age = (select max(age) from employees);

# from を用いた服問い合わせ
select 
max(avg_age) as "部署ごとの平均年齢の最大",
min(avg_age)
from
(select department_id, avg(age) as avg_age from employees group by department_id) as tmp_emp ;

#floor 切り捨て　年代ごとの集計
select
max(age_count),min(age_count)
from
(select floor(age/10)*10,count(*) as age_count from employees
group by floor(age/10))as age_summary;

#服問い合わせ select の中に書く
select * from customers;

select * from orders;


select 
cs.first_name,
cs.last_name,
(select max(order_date)from orders as order_max where cs.id = order_max.customer_id)as "最近の注文日",
(select min(order_date)from orders as order_max where cs.id = order_max.customer_id)as "古い注文日",
(select sum(order_amount * order_price) from orders as tmp_order where cs.id = tmp_order.customer_id)as "全支払金額"
from customers as cs
where
cs.id< 10


select * from orders;

#副問い合わせ case
select 
	emp.*,
	case 
		when emp.department_id = (select id from departments where name= '経営企画部')
	then "役割"
	else "その他"
	end as "役割"
from
employees as emp;

select 
emp.*,
case 
	when emp.id in(
	select distinct employee_id from salaries where payment > (select avg(payment) from salaries)
	)then "o"
	else "x"
	end as "給料が平均より高い"
from
employees as emp;


