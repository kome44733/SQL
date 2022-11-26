#
select database();

select *from users;

select 
 *,
 case birth_place
 when "日本" then "日本人"
 when "Iraq" then "イラク人"
 else "外人"
 end as "国籍"
from
 users
where id>30;

select *from prefectures;

select 
 name,
 case 
  when name in("香川県","愛知県","徳島県","高知県") then "四国"
  else "その他"
  end as "地域名"
from 
prefectures; 

#計算
select 
 name,
 birth_day,
 case 
 	when date_format(birth_day,"%Y")%4 = 0 and date_format(birth_day,"%Y")%100 <> 0 then "うるう年"
 	else"うるう年でない"
 	end as "うるう年か"
 from users;

select 
 *,
 case
 	when student_id % 3 = 0 then test_score_1
 	when student_id % 3 = 1 then test_score_2
 	when student_id % 3 = 2 then test_score_3
 end as score
from tests_score;
 
