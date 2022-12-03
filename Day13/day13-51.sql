/*
#ウィンドウ関数
#一部の行に対して、集計した結果を表示するSQL。データ分析をする際によく用いられる

window関数 over(
	[partition by 対象] #集計対象のカラムを指定
	[order by 対象 [asc|desc]] #順番を並び替える
	[range | row　集計範囲] #集計範囲を絞る
)

#parttition by
#行を分割してグループ化し、各グループに対してwindow関数を適用する(オプション機能)
sum(給料) over (partition by 部署) #部署カラムの値ごとにグループ化する
*/
use day_10_14_db;

show tables;

select * from employees;


#windows 関数

select *,avg(age)over(),count(*)over()
from employees;

#partition by :分割して集計する
select *, avg(age)over(partition by department_id)as avg_age,count(*)over(partition by department_id)as count_department
from employees;

select distinct concat(count(*)over(partition by floor(age/10)),"人") as age_count,floor(age/10)*10 from employees;

select *, date_format(order_date,"%Y/%m"), sum(order_amount* order_price) over(partition by date_format(order_date,"%Y/%m")) from orders;


#パーティション → partition byによって、分割される行の塊のこと
#フレーム → パーティションの中で集計の対象とするさらに小さな集合

#order by
#指定した行で昇順か降順に順番を並び替えて、(デフォルトでは)パーティションの始めから現在の業と同じ値の行までをフレームとして集計する
#sum(給料) over(order by 年齢) 年齢カラムの値毎に並び替えて集計する


#order by
select 
*,
count(*)over(order by age) as tmp_count
from employees;

select *,sum(order_price) over(order by order_date, customer_id) from orders;

select 
floor(age/10),
count(*)over(order by floor(age/10))
from employees;

#partition byとorder byを併用する
#partition byで分割してパーティション化する対象を決め、order byで行を並び替えて集計する

sum(給料) over(partition by 部署 order by 年齢) #部署毎に分割して、年齢で並び替える

#partion by + order by 
select *,
count(*)over(partition by department_id order by age)as count_value
from employees;

#ひとごとの収入　、最大
select *,
max(payment) over(partition by em.id)
from employees as em 
inner join salaries as sa 
on em.id = sa.employee_id ;


#月ごとの収入　、最大
select *,
max(payment) over(partition by sa.paid_date order by em.id)
from employees as em 
inner join salaries as sa 
on em.id = sa.employee_id ;

#フレームの範囲を変更
#rows between → 現在の行を基準として、集計する対象の行を(フレーム)を変更する

#集計する対象の行を、直前の行と現在の行にする
 sum(数量) over(rows
 between 1 preceding and
 current row)
 
#rowsで指定する式の一覧
 # unbounded preceding 一番頭の行
 # n preceding 現在の行よりn行前の行
 # current row 現在の行
 # n following 現在の行よりn行後の行
 # unbounded following 一番最後の行
 
 
 #range BETWEEN 
 #現在の行の値を基準として、集計する対象の行(フレーム)を変更する(order by と一緒に使う)

 #7日間の平均　セールステーブルのorder_price*order_amount
 #日付ごとの合計値
 #７日平均
 select *,sum(order_price* order_amount)over(order by order_date rows between 6 preceding and current row) from orders;
 
with daily_summary as(
select 
order_date,sum(order_price*order_amount) as sale
from
orders
group by order_date
)
select 
*,
avg(sale)over(order by order_date rows between 6 preceding and current row)
from daily_summary;



select *,sum(summary_salary.payment) 
over(order by age range between unbounded preceding and 1 following) as p_summary
from employees as emp
inner join
(select employee_id,
		sum(payment) as payment
	from salaries
		group by employee_id) as summary_salary
	on emp.id = summary_salary.employee_id;




