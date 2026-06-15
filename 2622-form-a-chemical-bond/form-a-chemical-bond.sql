# Write your MySQL query statement below

with testing as (
select symbol as metal
from elements
where type = 'Metal'
), 

testing2 as (
select symbol as nonmetal
from elements
where type = 'Nonmetal'
)

select *
from testing
cross join testing2 