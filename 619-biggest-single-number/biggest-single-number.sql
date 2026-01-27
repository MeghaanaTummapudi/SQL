# Write your MySQL query statement below

-- select coalesce(max(t.num), null) as num
-- from (select num
--         from mynumbers
--         group by num
--         having count(num) = 1) as t

-- select max(case when m.dr = 1 then m.num else null end) as num
-- from (
-- select t.num, dense_rank() over (order by num desc) as dr
-- from (select *
-- from mynumbers
-- group by num 
-- having count(num) = 1 ) as t
-- ) as m

select max(case when num is not null then num else null end) as num
from mynumbers
where num in (select max(num) from mynumbers group by num having count(num) = 1)