# Write your MySQL query statement below

select tst.event_day as day, tst.emp_id, sum(tst.time_diff) as total_time
from (select *, (out_time - in_time) as time_diff
      from employees) as tst
group by tst.event_day, tst.emp_id

