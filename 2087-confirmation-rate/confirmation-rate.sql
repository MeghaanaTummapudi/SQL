# Write your MySQL query statement below
-- select user_id, 
--        sum(case when action = 'confirmed' then 1 else 0 end) as con,
--        count(distinct time_stamp) as tot
-- from confirmations
-- group by user_id

with testing as (
select s.user_id, 
    --    round(sum(case when c.action = 'confirmed' then 1 else 0 end) / count(distinct c.time_stamp),2) as confirmation_rate
       sum(case when c.action = 'confirmed' then 1 else 0 end) as con,
       count(distinct c.time_stamp) as tot
from signups as s
left join confirmations as c
on s.user_id = c.user_id
group by user_id
)

-- select user_id, round(con/tot, 2) as confirmation_rate
-- from testing
select user_id, 
       (case when con = 0  and tot = 0 then 0.00 else round(con/tot, 2) end ) as confirmation_rate
from testing