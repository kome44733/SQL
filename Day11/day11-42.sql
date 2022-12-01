# exists nullの存在する場合
select * from customers as c1
where exists (
select * from customers_2 as c2 where c1.first_name = c2.first_name and c1.last_name = c2.last_name and
(c1.phone_number = c2.phone_number or(c1.phone_number is null and c2.phone_number is null))
);

# not exists
select * from customers as c1
where not exists(
select * from customers_2 as c2 where c1.first_name = c2.first_name and c1.last_name = c2.last_name and
c1.phone_number = c2.phone_number
);

#not in の場合

#first_name!=customers_2.first_name OR last_name! = customers_2.last.name or phone_number! = customers_2.phone_number
select 	* from customers  as c1
where (first_name,last_name,phone_number) not in
(select first_name,last_name,phone_number from customers_2);
#not exist の場合
# existsで紐づかなかったレコード

#exists in
select 	* from customers  as c1
where (first_name,last_name,phone_number) in
(select first_name,last_name,phone_number from customers_2);
#exists in　上と意味は同じ
select * from customers as c1
where exists (
select * from customers_2 as c2 where c1.first_name = c2.first_name and c1.last_name = c2.last_name and
(c1.phone_number = c2.phone_number or(c1.phone_number is null and c2.phone_number is null))
);