# Write your MySQL query statement below

with testing as (
select *,
       sum(weight) over (order by turn asc) as tot_sum
from Queue 
)

select person_name
from testing
where tot_sum <= 1000
order by tot_sum desc
limit 1
