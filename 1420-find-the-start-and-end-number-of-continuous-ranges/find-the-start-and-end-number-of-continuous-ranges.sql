# Write your MySQL query statement below

select min(log_id) as start_id, max(log_id) as end_id
from (select *, 
       row_number() over (order by log_id) as r
      from logs) as t
group by (t.log_id - t.r)
order by start_id


