# Write your MySQL query statement below

select employee_id, department_id
from employee 
where primary_flag = 'Y' or 
      employee_id in (select employee_id
                      from employee
                      group by employee_id
                      having count(*) = 1
                      )


















-- with testing as (
-- select employee_id, department_id, primary_flag, count(*) as n_c
-- from employee
-- group by employee_id
-- having n_c = 1 and primary_flag = 'N'
-- ),

-- t2 as (
-- select employee_id, department_id
-- from employee
-- where employee_id not in (select employee_id from testing) and primary_flag = 'Y'
-- )

-- select employee_id, department_id
-- from testing
-- union all 
-- select employee_id, department_id
-- from t2