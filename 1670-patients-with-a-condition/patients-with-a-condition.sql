# Write your MySQL query statement below

select *
from patients
where conditions regexp '^DIAB1| DIAB1'
--  '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$’