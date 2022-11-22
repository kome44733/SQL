#char型　ディスク量　多くなる　パフォーマンス良い　末尾スペース削除　データ長さある程度固定
#varchar型 ディスク量　少なくなる　パフォーマンス悪い　末尾スペース　データ長さが変わるとき
#移動
use my_db;
select database();

#studentsテーブル作成
create table students(
 id int primary key,
 name char(10)
);

#char型は末尾スペースが削除
insert into students values(1,"ABSDEF ")

select*from students;

#char => var
alter table students modify name varchar(10);

insert into students values(2,"ABCDEF ")
select*from students;

insert into students values(3,"ABCDEF")
select*from students;

insert into students values(4,"ABCDEFG")
select*from students;

#nameの文字数を表示
select name, char_length(name) from students;
