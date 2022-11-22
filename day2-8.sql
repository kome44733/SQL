#移動
use my_db;

select database();

#テーブル一覧
show tables;

#テーブル名変更
alter table users rename to users_table;

#テーブル確認
describe users_table;

#カラムの削除drop column
alter table users_table drop column message;

#カラムの追加(add)
alter table users_table
add post_code char(8);

alter table users_table
add gender char(1) after age;

#一番最初に追加(add)
alter table users_table
add new_id int first;

alter table users_table drop column new_id;

#カラムの定義変更(modify)
alter table users_table modify name varchar(50);

#カラム名変更(change column)
alter table users_table change column name 名前 varchar(50);

#カラム位置変更
alter table users_table change column gender gender char(1)after post_code;

#主キー削除
alter table users_table drop primary key;

#テーブル確認
describe users_table;
