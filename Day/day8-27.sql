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

