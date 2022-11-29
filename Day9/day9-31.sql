show databases;
use day_4_9_db;

#union :重複は削除
select * from new_students
union
select * from students;

/*
341|堀川 迪子 |   177|    77|       5|
  4|黒沢 敬正 |   163|    74|       1|
  5|中谷 純典 |   159|    62|       2|
  7|吉川 一樹 |   169|    68|       4|
*/
select * from new_students
union
select * from students
order by id;

#union :重複削除しない
select * from new_students
union all
select*from students
order by id;

select * from students where id <10
union all 
select * from students where id >250;

select id , name from users where id < 10
union
select age, name from users where id <10;

# カラム数が一緒ではないとエラーになる
select *id,name,height from students
union
selecct age, name from users;