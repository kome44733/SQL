show databases();
use day_4_9_db;

start transaction;

show tables;

select *from customers;

#主キーでupdate（行ロック）
update customers set age =43 where id =1;

rollback;

start transaction;

#テーブル全体がロック
update customers set age =42 
#where id=1;
where name ="河野 文典";

rollback;

#delete 
start transaction;

#行ロックがかかる
delete from customers where id = 1;
commit;

#insert 

start transaction;

insert into customers values(1,"田中 一郎",21,"1999-00-01");
select *from customers;

commit;

#selectのロック 
#共有ロックfor share
#排他ロック for update 

start transaction;
select * from customers where id =1 for share;

rollback;


start transaction;
select * from customers where id =1 for update;

rollback;