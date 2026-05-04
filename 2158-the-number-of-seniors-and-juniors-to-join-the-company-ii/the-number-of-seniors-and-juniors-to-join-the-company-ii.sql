# Write your MySQL query statement below

with testing as (
select *,  
       sum(salary) over (partition by experience order by salary asc) as rs
from candidates
), 

snr as (
select employee_id, (70000 - rs) as lft
from testing
where experience = 'Senior' and (70000 - rs) > 0
), 

jnr as (
select employee_id
from testing
where experience = 'Junior' and (ifnull((select min(lft) from snr), 70000) - rs) > 0
)

select employee_id
from snr

union all

select employee_id
from jnr

