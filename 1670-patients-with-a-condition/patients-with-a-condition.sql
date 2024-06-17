# Write your MySQL query statement below

-- select *
-- from patients
-- where conditions regexp '^DIAB1| DIAB1'

select *
from patients
where conditions like 'DIAB1%' or conditions like '% DIAB1%'