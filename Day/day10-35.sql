show databases;
create database day_10_14_db;

use day_10_14_db;

show tables;

#テーブルに別名をつける
select 
	cs_2.id,
	cs_2.name
from 
	classes as cs_2;