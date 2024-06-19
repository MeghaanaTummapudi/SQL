# Write your MySQL query statement below

with testing as (
select *,
       sum(weight) over (order by turn asc) as wc
from queue
)

select person_name
from testing 
where wc <= 1000
order by turn desc
limit 1

