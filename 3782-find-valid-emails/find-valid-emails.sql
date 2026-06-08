# Write your MySQL query statement below

-- select *
-- from users
-- where char_length(email) - char_length(replace(email, '@', '')) = 1 and right(email, 4) = '.com' and left(email, position('@' in email) - 1) regexp '^[a-z0-9_]+$' and mid(email, position('@' in email) + 1, length(email) - length(left(email, position('@' in email) - 1)) - 5) regexp '^[a-z]+$'
-- order by user_id asc


select *
from users
where email regexp '^[a-z0-9_]+@[a-z]+\\.com$'
order by user_id