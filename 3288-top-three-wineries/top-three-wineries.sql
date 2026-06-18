# Write your MySQL query statement below

with testing as (
select t.*, row_number() over (partition by t.country order by t.tot desc, t.winery asc) as dr
from (select country, winery, sum(points) as tot
from wineries 
group by country, winery) as t
), 

testing2 as (
select country, 
max(case when dr = 1 then concat(winery, ' (', tot, ')') else null end) as top_winery, 
max(case when dr = 2 then concat(winery, ' (', tot, ')') else null end) as second_winery, 
max(case when dr = 3 then concat(winery, ' (', tot, ')') else null end) as third_winery
from testing
group by country
)

select country, ifnull(top_winery, NULL) as top_winery, 
       ifnull(second_winery , 'No second winery') as second_winery, 
       ifnull(third_winery, 'No third winery') as third_winery   
from testing2
order by country asc

