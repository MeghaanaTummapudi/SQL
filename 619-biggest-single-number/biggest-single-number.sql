# Write your MySQL query statement below

select coalesce(max(t.num), null) as num
from (select num
        from mynumbers
        group by num
        having count(num) = 1) as t