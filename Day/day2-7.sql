use my_db;

select database();

#テーブル作成
create table users(
 id INT, #idカラム
 name VARCHAR(10),#名前、可変長文字列
 age INT,
 phone_number CHAR(13),#固定長
 message TEXT
)

#テーブル一覧
show tables;

#テーブルの定義確認
describe users;

#テーブルの削除

drop table users;

show tables;

#テーブル作成　主キー
create table users(
 id INT primary key, #idカラム
 name VARCHAR(10),#名前、可変長文字列
 age INT,
 phone_number CHAR(13),#固定長
 message TEXT
)

describe users;