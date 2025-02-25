# Write your MySQL query statement below

-- with testing as (
-- select num
-- from MyNumbers 
-- group by num
-- having count(num) < 2
-- )

-- select max(num) as num
-- from testing

select max(sub.num) as num
from (select num
from MyNumbers 
group by num
having count(num) < 2) as sub