# Write your MySQL query statement below

-- select distinct c1.user_id
-- from confirmations as c1
-- left join confirmations as c2
-- on c1.user_id = c2.user_id and c1.time_stamp < c2.time_stamp and c1.action is not null and c2.action is not null
-- where c2.user_id is not null and timestampdiff(second, c1.time_stamp, c2.time_stamp) <= 86400

select distinct t.user_id
from (select *, 
       lead(time_stamp, 1) over (partition by user_id order by time_stamp asc) as tst
from confirmations
where action is not null ) as t
where t.tst is not null and timestampdiff(second, t.time_stamp, t.tst) <= 86400
