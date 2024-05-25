# Write your MySQL query statement below

with testing as (
select person_id, person_name, weight, turn,
       sum(weight) over(order by turn asc) as tot
from queue
)

select person_name
from testing 
where tot <= 1000
order by tot desc
limit 1