#group by
show databases;
select age,count(*),max(birth_day),min(birth_day) from users 
where birth_place ="日本" 
group by age
order by count(*)
;

select department, sum(salary), avg(salary), min(salary) from employees
where age > 40
group by department;

select 
*
from
	users
group by
	case 
		when birth_place ="日本"　then "日本人"
		else "その他"
	end;
	
select 
	case
	when birth_place="日本"　then "日本人"
	else "その他"
end as "国籍",
count(*),
max(age)
from 
	users
group by
	case 
		when birth_place="日本"　then "日本人"
		else "その他"
	end;
	
select 
case
	when name in ("香川県","高知県","愛媛県","徳島県") then "四国"
	else "その他"
end as "地域名",
count(*)
from prefectures
group by 
case
	when name in ("香川県","高知県","愛媛県","徳島県") then "四国"
	else "その他"
end;

#case
	select 
	age,
	case 
			when age < 20 then "未成年"
			else "成人"
			end as "分類",
			count(*)
	from users 
	group by age


