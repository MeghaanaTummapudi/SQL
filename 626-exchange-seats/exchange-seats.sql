# Write your MySQL query statement below

-- select *
-- from seat as s1
-- left join seat as s2
-- on s1.id < s2.id

with testing as (
select *,
       lag(id, 1) over (order by id asc) as lg,
       lead(id, 1) over (order by id asc) as ld
from seat
)

select  
       (case when ld is null and mod(id, 2) <> 0 then id
             when mod(id, 2) <> 0 then ld 
             when mod(id, 2) = 0 then lg
         end) as id, student
from testing
order by id asc

