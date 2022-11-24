show databases;


#usersの定義
describe users;

select*from users limit 10;

#=で絞込
select*from users where name = "奥村 成美";

select*from users where birth_place = "日本";

#from>where>order by> limit
select*from users where birth_place <> "日本" order by age limit 10;

#<,>,<=,>=,<>
select *from users where age<50 limit 10;

describe users;

#日付の取り出し
select *from users where birth_day >= "2011-04-03";

#tinyint 1or0
select *from users where is_admin=0;

#update
update users set name= "奥山　成美"where id = 1;

select*from users where id=1;

#delete
select *from users order by id desc limit 1;

delete from users where id = 190;