以下の演習問題を行います。

問題文に対応したSQLを作成してください。
SHOW DATABASES;
use day_4_9_db;

1. customersテーブルから、ageが28以上40以下でなおかつ、nameの末尾が「子」の人だけに絞り込んでください。

そして、年齢で降順に並び替え、検索して先頭の5件の人のnameとageだけを表示してください。

select name,age from customers where age<=40 and age>=28 and name like "%子" order by age desc limit 5;

2. receiptsテーブルに、「customer_idが100」「store_nameがStore X」「priceが10000」のレコードを挿入してください。
select*from receipts
# カラムの確認
describe receipts;
#最後のid確認
select * from receipts order by id desc limit 1;
insert into receipts(id,customer_id,store_name,price) values(301,100,"Store X",10000);
3. 2で挿入してレコードを削除してください

delete from receipts where id = 301;
select * from receipts order by id desc limit 1;

4. prefecturesテーブルから、nameが「空白もしくはNULL」のレコードを削除してください

select * from prefectures;

delete from prefectures where name = ""or name is null

5. customersテーブルのidが20以上50以下の人に対して、年齢を+1してレコードを更新してください

(ただし、BETWEENを使うこと)
select id from customers where id between 20 and 50;

update customers set age =age+1 where id between 20 and 50;

select age from customers where id between 20 and 50;

6. studentsテーブルのclass_noが6の人すべてに対して、1～5のランダムな値でclass_noを更新してください
select class_no from students;
update students set class_no = ceiling(rand()*5) where class_no = 6 ;


7. class_noが3または4の人をstudentsテーブルから取り出します。取り出した人のheightに10を加算して、その加算した全値よりも、heightの値が小さくてclass_noが1の人をstudentsテーブルから取り出してください。
select *from students
where height < all(select height + 10 from students where class_no in(3,4)) and class_no =1;
(ただし、IN, ALLを使うこと)


#select * from students where height and class_no =1 height < all(select height from students where class_no in(3,4) height +10);

8. employeesテーブルのdepartmentカラムには、「 営業部 」のような形で部署名の前後に空白が入っています。この空白を除いた形にテーブルを更新してください
select *from employees
update employees set department =trim(department);


9. employeesテーブルからsalaryが5000000以上の人のsalaryは0.9倍して、5000000未満の人のsalaryは1.1倍して下さい。
select *,if (salary>5000000,round(salary*1.1) ,round(salary*0.9)) from employees ;
(ただし、小数点以下は四捨五入します)

select *,round(salary*0.9) from employees where salary >= 5000000
select *,round(salary*1.1) from employees where salary <= 5000000

update employees set salary = 
	case
	when salary >= 5000000 then round(salary * 0.9)
	when salary < 5000000 then round(salary * 1.1)
end ;


10. customersテーブルにnameが「名無権兵衛」、ageが0、birth_dayが本日日付の人を挿入してください。

（ただし、日付関数を使うこと）
select * from customers
insert into customers(id,name,age,birth_day) values(101,"名無権兵衛",0,date_format(now(),"%Y/%m/%d %H"));


11. customersテーブルに新たなカラムとして、「name_length INT」を作成します。

name_lengthカラムをcustomersテーブルの各行の名前の文字数でアップデートしてください

alter table customers add name_length INT;
update customers set name_length = char_length(name);

12. tests_scoreテーブルに新たなカラムとして、「score INT」を作成します。

scoreカラムに、testsテーブルの各行のtest_score_1, test_score_2, test_score_3から、取り出したNULLでない最初の値で更新します。

ただし取り出したtestscore〇が、900以上の人は1.2倍して小数点以下を切り捨てて、600以下の人は0.8倍して小数点以下を切り上げてください。

alter table tests_score add score INT;

select *,COALESCE(test_score_1,test_score_2,test_score_3)*1.2 from tests_score;

update tests_score set score =
    case
        when COALESCE(test_score_1,test_score_2,test_score_3) > 600 then floor(COALESCE(test_score_1,test_score_2,test_score_3) * 1.2)
        when COALESCE(test_score_1,test_score_2,test_score_3) < 900 then ceiling(COALESCE(test_score_1,test_score_2,test_score_3) * 0.8)
        else COALESCE(test_score_1,test_score_2,test_score_3)
    end;
   
select * from tests_score;



13. employeesテーブルを、 departmentが、マーケティング部 、研究部、開発部、総務部、営業部、経理部の順になるように並び替えて表示してください。


select *
from employees
order by
    case department
        when "マーケティング部" then 0
        when "研究部" then 1
        when "開発部" then 2
        when "総務部" then 3
        when "営業部" then 4
        when "経理部" then 5
    end;