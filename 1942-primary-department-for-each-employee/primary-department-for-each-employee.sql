# Write your MySQL query statement below

-- select (case when primary_flag = 'Y' then department_id
--              when count(department_id) = 1 and primary_flag = 'N' then department_id
--              end) as department_id
-- from employee 
-- group by employee_id

-- with testing as (
-- select employee_id, count(*) as n_c
-- from employee 
-- group by employee_id
-- )


-- (select distinct employee_id, department_id
-- from employee
-- where primary_flag = 'N' and employee_id in (select employee_id from testing where n_c = 1))

-- union 

-- (select distinct employee_id, department_id
-- from employee
-- where primary_flag = 'Y')

select employee_id, department_id
from employee
where primary_flag = 'Y' or (employee_id, department_id) in (select employee_id, department_id from employee group by employee_id having count(*) = 1 and primary_flag = 'N')



