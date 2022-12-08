#order by case 
select *,
case 
 when name in("香川県","愛知県","徳島県","高知県") then "四国"
 when name in("兵庫県","大阪府","京都府","滋賀県","奈良県","三重県","和歌山県") then "近畿"
 else "その他" end as "地域名"
from prefectures
order by
case 
 when name in("香川県","愛知県","徳島県","高知県") then 1
 when name in("兵庫県","大阪府","京都府","滋賀県","奈良県","三重県","和歌山県") then 0
 else 2
end desc;

# update +case
select +from users;

alter table users add birth_era varchar(2) after birth_day;

update users 
set birth_era =case
	when birth_day < "1989-01-07"then "昭和"
	when birth_day < "2019-05-01"then "平成"
	when birth_day >= "2019-05-01"then "令和"
	else "不明"
	end;

select *from users;

