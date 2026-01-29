# Write your MySQL query statement below

select t.person_name
from (select *, sum(weight) over (order by turn asc) as sum_weight
from queue) as t
where t.sum_weight <= 1000
order by t.sum_weight desc
limit 1
