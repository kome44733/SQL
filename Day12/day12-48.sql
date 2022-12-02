
#with とは 一時的なテーブルに格納する。稼働句性が高い構文
/*with 中間テーブル名1 as(
	select 〇〇
),中間テーブル名2 as (
	select 〇〇
)
select * 
from テーブル
inner join 中間テーブル1　on テーブル.id = 中間テーブル1.id
inner join 中間テーブル2　on 中間テーブル1.id = 中間テーブル2.id
*/

-- with

-- department から営業部の人を取り出して、employeesと結合する

select 
*
from employees e 
inner join departments d 
on e.department_id = d.id 
where d.name = "営業部";


with tmp_departments as(
	select * from departments where name = "営業部"
)
select * from employees as e inner join tmp_departments
on e.department_id = tmp_departments.id;


# stores テーブルからid,1,2,3のものを取り出す(where)
# items テーブルと紐づけ、itemsテーブルとordersテーブルを紐づける(inner join)
# orders テーブルのorder_amount* order_priceの合計をstoresテーブルのstore_name毎に集計する.(group by sm)

#絞り込み→結合→並び替え
with tmp_stores as(
select * from stores where id in(1,2,3)
),tmp_items_orders as(
	select items.id as item_id,
	tmp_stores.id as store_id,
	orders.id as order_id,
	orders.order_amount as order_amount,
	orders.order_price as order_price,
	tmp_stores.name as store_name
	from tmp_stores
	inner join items 
	on tmp_stores.id = items.store_id 
	inner join orders 
	on items.id = orders.item_id 
)
select store_name ,sum(order_amount+order_price)
from tmp_items_orders group by store_name;