8日目-13日目までの講座内容について復習を行います



以下の問題にご回答ください。

use day_10_14_db;
select *from employees;
select *from customers;
select * from orders;

1. employeesテーブルとcustomersテーブルの両方から、それぞれidが10より小さいレコードを取り出します。
両テーブルのfirst_name, last_name, ageカラムを取り出し、行方向に連結します。
連結の際は、重複を削除するようにしてください。


select id,first_name,last_name,age from employees where id<10
union
select id,first_name,last_name,age from customers where id<10;


2. departmentsテーブルのnameカラムが営業部の人の、月収の最大値、最小値、平均値、合計値を計算してください。
employeesテーブルのdepartment_idとdepartmentsテーブルのidが紐づけられ
salariesテーブルのemployee_idとemployeesテーブルのidが紐づけられます。
月収はsalariesテーブルのpaymentカラムに格納されています

select * from departments;
select *from employees;
select * from salaries;


with tmp_departments as(
	select * from departments where name = "営業部" 
),table2 as(
select 
payment, 
name,
e.id as eid
from employees as e inner join tmp_departments
on e.department_id = tmp_departments.id
inner join salaries s
on e.id = s.employee_id
)
select max(payment),min(payment),floor(avg(payment)),sum(payment) 
,name,eid from table2 group by eid
;

select max(payment),min(payment),avg(payment),sum(payment)
from salaries as sa
inner join employees as emp
on sa.employee_id = emp.id
inner join departments as dt
on emp.department_id = dt.id
where dt.name = "営業部";


3. classesテーブルのidが、5よりも小さいレコードとそれ以外のレコードを履修している生徒の数を計算してください。
classesテーブルのidとenrollmentsテーブルのclass_id、enrollmentsテーブルのstudent_idとstudents.idが紐づく
classesにはクラス名が格納されていて、studentsと多対多で結合される

select * from students;
select * from enrollments;


select 
case
  when cls.id < 5 then "クラス1"
  else "クラス2"
end as "クラス分類",
count(std.id) as "人数"
from classes as cls
inner join enrollments as enr
on cls.id = enr.class_id
inner join students as std
on enr.student_id = std.id
group by 
case
    when cls.id < 5 then "クラス1"
    else "クラス2"
end;



4. ageが40より小さい全従業員で月収の平均値が7,000,000よりも大きい人の、月収の合計値と平均値を計算してください。
employeesテーブルのidとsalariesテーブルのemployee_idが紐づけでき、salariesテーブルのpaymentに月収が格納されています

select * from employees;
select * from salaries;


select emp.id,sum(payment),avg(payment) from salaries as sal
inner join employees as emp
on sal.employee_id = emp.id
where age < 40
group by employee_id
having avg(payment) > 7000000;





5. customer毎に、order_amountの合計値を計算してください。
customersテーブルとordersテーブルは、idカラムとcustomer_idカラムで紐づけができます
ordersテーブルのorder_amountの合計値を取得します。
SELECTの対象カラムに副問い合わせを用いて値を取得してください。

select * from orders;

select *,
(select sum(order_amount) from orders as od
where od.customer_id = cst.id) as sum_order_amount
from customers as cst;




6. customersテーブルからlast_nameに田がつくレコード、
ordersテーブルからorder_dateが2020-12-01以上のレコード、
storesテーブルからnameが山田商店のレコード同士を連結します
customersとorders, ordersとitems, itemsとstoresが紐づきます。
first_nameとlast_nameの値を連結(CONCAT)して集計(GROUP BY)し、そのレコード数をCOUNTしてください。


select 
*
from
(select * from customers where last_name like "%田%")as c
inner join(select * from orders where order_date >= "2020-12-01")as o
on c.id = o.customer_id 
inner join items i 
on o.item_id = i.id
inner join (select * from stores where name = "山田商店")as s
on s.id = i.store_id
group by concat(c.last_name,c.first_name);




7. salariesのpaymentが9,000,000よりも大きいものが存在するレコードを、employeesテーブルから取り出してください。
employeesテーブルとsalariesテーブルを紐づけます。
EXISTSとINとINNER JOIN、それぞれの方法で記載してください

select * from employees
where id in(select employee_id from salaries where payment > 9000000);

select distinct e.* from employees e 
inner join salaries s 
on e.id = s.employee_id
where s.payment > 9000000;

select * from employees e 
where 
exists(
select 
1
from 
salaries s 
where e.id = s.employee_id and s.payment >9000000
);


8. employeesテーブルから、salariesテーブルと紐づけのできないレコードを取り出してください。
EXISTSとINとLEFT JOIN、それぞれの方法で記載してください

select * from employees
where id not in(select employee_id from salaries);

select * from employees e 
left join salaries s 
on e.id =s.employee_id 
where s.id is null;


select *  from employees e 
where 
not exists(
select 
1
from
salaries s 
where 
s.employee_id =e.id 
);




9. employeesテーブルとcustomersテーブルのage同士を比較します
customersテーブルの最小age, 平均age, 最大ageとemployeesテーブルのageを比較して、
employeesテーブルのageが、最小age未満のものは最小未満、最小age以上で平均age未満のものは平均未満、
平均age以上で最大age未満のものは最大未満、それ以外はその他と表示します
WITH句を用いて記述します

with customers_age as(
select max(age) as max_age, min(age)as min_age,avg(age) as avg_age
from customers
)
select
* ,
case 
	when e.age < ca.min_age then "最小未満"
	when e.age < ca.avg_age then "平均未満"
	when e.age < ca.max_age then "最大未満"
	else "その他"
end
from 
employees e 
cross join customers_age as ca;







