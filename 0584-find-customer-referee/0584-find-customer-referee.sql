# Write your MySQL query statement below

-- select name
-- from Customer
-- where referee_id is NULL or referee_id <> 2


# with coalesce
select name
from Customer
where ifnull(referee_id, 0) <> 2