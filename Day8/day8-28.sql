show databases;

use day_4_9_db;

show tables;

select * from users;

#transactionの開始
start transaction;

# upadate
update users set name= "中山 成美" where id = 1;

select * from users;

#rollbackトランザクション開始前に戻す
rollback;

#commit DBに反映

commit;

#rollbackトランザクション開始前に戻す
rollback;

select * from students;

delete from students where id=300;

#autocommit確認
show variables where variable_name = "autocommit";

set autocommit=0;

delete from students where id =298;



#sqlの反映
commit;
select *from students order by id desc limit 5

#autocommit
set autocommit=1;
