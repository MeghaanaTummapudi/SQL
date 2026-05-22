# Write your MySQL query statement below

with testing as (
select first_col, 
       row_number() over (order by first_col asc) as dr1
from data
), 

testing2 as (
select second_col, 
       row_number() over (order by second_col desc) as dr2
from data
)

select t1.first_col, t2.second_col
from testing as t1
join testing2 as t2
on t1.dr1 = t2.dr2