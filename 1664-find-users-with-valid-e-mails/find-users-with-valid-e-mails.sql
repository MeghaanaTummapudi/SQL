# Write your MySQL query statement below

select *
from users
where right(mail, 13) = '@leetcode.com' and  left(mail, length(mail) - 13) regexp  '^[a-zA-Z][a-zA-Z0-9_.-]*$'
-- right(mail, 13) = '@leetcode.com' and