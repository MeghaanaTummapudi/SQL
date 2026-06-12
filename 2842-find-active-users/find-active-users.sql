# Write your MySQL query statement below

select distinct t.user_id
from (select *, lead(created_at, 1) over (partition by user_id order by created_at asc) as l1
from users) as t
where datediff(t.l1, t.created_at) <= 7
