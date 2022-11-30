show tables;

select * from employees;


#部署一覧
select * from departments;

# inで絞込
select * from employees where department_id in(1,2);



# 別のテーブルから問い合わせ　#服問い合わせ
select * from departments where name in('経営企画部','営業部');
select * from employees where department_id in(select id from departments where name in('経営企画部','営業部'));



select * from students;
select  * from users;

#複数カラムのin #服問い合わせ
select * from students 
where (first_name,last_name)in (
select first_name,last_name from users
);

#　副問い合わせ3: 集計
select max(age) from employees;

select * from employees where age = (select max(age) from employees);

