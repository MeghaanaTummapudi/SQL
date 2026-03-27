# Write your MySQL query statement below

-- select *, 
--        (case when sex = 'm' then 'f' 
--             when sex = 'f' then 'm'
--         else null end) as tst
-- from salary

update salary
set sex = 
case sex when 'm' then 'f' else 'm' end
