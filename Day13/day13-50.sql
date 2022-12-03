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
