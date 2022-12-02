show databases;
use day_10_14_db;

show tables;

select * from  employees;

select * from departments;


#通常のjoin
select * from employees as emp
inner join departments as dt 
on emp.department_id = dt.id;

#特定のカラムを取り出す
select emp.id, emp.first_name ,emp.last_name ,dt.id as department_id ,dt.name as department_name
from employees as emp
inner join departments as dt 
on emp.department_id = dt.id;

#複数のレコードで紐づける
select * from students as st
inner join
users as user
on st.first_name =user.first_name and st.last_name = user.last_name;

# =以外で紐づける
select * from employees as emp
inner join 
students as st
on emp.id < st.id;

#left (outer) join複数のテーブルを結合して、左はすべて、右は紐づけのできたレコードのみを取り出し、それ以外はNULL

# left join 

select emp.id, emp.first_name ,emp.last_name ,coalesce(dt.id,"該当なし") as department_id ,dt.name as department_name
from employees as emp
left join departments as dt 
on emp.department_id = dt.id;

select * from students as st
left join enrollments as enr
on st.id = enr.student_id 
left join 
classes as cs 
on enr.class_id = cs.id;

# right join 
select * from students as st
right join enrollments as enr
on st.id = enr.student_id 
right join 
classes as cs 
on enr.class_id = cs.id;


# full join 両方から取り出して、取得できないものはNULL
select * from students as st
left join enrollments as enr
on st.id = enr.student_id 
left join 
classes as cs 
on enr.class_id = cs.id
union
select * from students as st
right join enrollments as enr
on st.id = enr.student_id 
right join 
classes as cs 
on enr.class_id = cs.id;

#customer ,orders.items,storesを紐づけ
#customers.idで並び替え order by
#customers.id が１０で。orders.order_date が2020-0801で絞る

select 
 ct.id , ct.last_name ,od.item_id ,od.order_amount ,od.order_price ,od.order_date ,it.name, st.name
from 
	 customers as ct
	 inner join orders as od 
	 on ct.id = od.customer_id 
	 inner join items as it
	 on od.item_id = it.id 
	 inner join stores as st 
	 on it.store_id = st.id
	 where ct.id = 10 and od.order_date >"2020-08-01"
	order by ct.id;
	 

#サブクエリ
select 
 ct.id , ct.last_name ,od.item_id ,od.order_amount ,od.order_price ,od.order_date ,it.name, st.name
from 
	 (select * from customers where id =10) as ct
	 inner join (select * from orders where order_date >"2020-08-01") as od 
	 on ct.id = od.customer_id 
	 inner join items as it
	 on od.item_id = it.id 
	 inner join stores as st 
	 on it.store_id = st.id
	order by ct.id;
	
#group by の紐づけ
select*from customers as ct 
inner join 
(select customer_id, sum(order_amount*order_price)as summary_price
from orders
group by customer_id) as order_summary
on ct.id = order_summary.customer_id
order by ct.age
limit 5;


#self join (自己結合)

select 
concat(e1.last_name,e1.first_name)as "部下の名前",
e1.age as "部下の名前",
coalesce (concat(e2.last_name,e2.first_name),"該当なし")as "上司の名前" ,
e2.age as "上司の名前" 
from employees as e1
left join employees e2
on e1.manager_id =e2.id;

#交差結合 cross join 左のカラムに右のすべてが紐づく

select * from employees as emp1, employees as emp2
where emp1.id = 1;

select * from employees as emp1 cross join employees as emp2
on emp1.id < emp2.id;


#計算結果とcaseで紐づけ
select 
*,
case 
	when cs.age > summary_customers.avg_age then "o"
	else "x"
	end as "平均年齢よりも年齢が高いか"
from customers as cs
cross join(
select avg(age) as avg_age from customers
)as summary_customers

select 
emp.id,
avg(payment),
summary.avg_payment,
case 
	when avg(payment) >=summary.avg_payment then "o"
	else "x"
	end as "平均月収以上か"
from employees as emp 
inner join salaries as sa
on emp.id =sa.employee_id 
cross join
(select avg(payment) as avg_payment from salaries)as summary
group by emp.id;
