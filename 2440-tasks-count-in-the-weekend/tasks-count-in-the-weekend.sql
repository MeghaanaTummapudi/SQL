# Write your MySQL query statement below

with testing as (
select t.*, (case when t.ind = 5 or t.ind = 6 then 'Y' else 'N' end) as cst
from (select *, weekday(submit_date) as ind
from tasks) as t
)

select sum(if(cst = 'N', 1, 0)) as working_cnt, sum(if(cst = 'Y', 1, 0)) as weekend_cnt
from testing


