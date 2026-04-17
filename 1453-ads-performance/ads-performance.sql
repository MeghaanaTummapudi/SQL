# Write your MySQL query statement below

with testing as (
select ad_id, sum(if(action = 'Clicked', 1, 0)) as click_cnt, 
          sum(if(action = 'Viewed', 1, 0)) as view_cnt
from ads
group by ad_id
)

select ad_id, ifnull(round(((click_cnt / (click_cnt + view_cnt)) * 100), 2), 0) as ctr
from testing
order by ctr desc, ad_id asc
