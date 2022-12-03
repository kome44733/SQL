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