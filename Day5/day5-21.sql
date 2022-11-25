#round ,floor, ceiling

select round(13.14,-1); #四捨五入

select floor(3.14); #切り捨て

select floor(2.84); #切り捨て

select ceiling(3.14); #切り上げ

select rand(); #0~1
select floor(rand()*10) #0~10

#power　べき乗

select power(3,4);

select weight /power(height/100,2)as bmi from students;

#coalesce :nullではない最初の値を返す
select * from tests_score;
select coalesce(null,null,null,"a",null,"b");

select coalesce(test_score_1,test_score_2,test_score_3),test_score_1,test_score_2,test_score_3 as score from tests_score;