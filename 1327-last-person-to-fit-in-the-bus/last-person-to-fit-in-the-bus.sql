# Write your MySQL query statement below

-- select t.person_name
-- from (select *, sum(weight) over (order by turn asc) as sum_weight
-- from queue) as t
-- where t.sum_weight <= 1000
-- order by t.sum_weight desc
-- limit 1

with testing as (
select *, sum(weight) over (order by turn asc) as s
from queue 
)

select person_name
from testing 
where turn in (select max(turn) from testing where s <= 1000)


