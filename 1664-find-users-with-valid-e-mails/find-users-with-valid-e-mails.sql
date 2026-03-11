# Write your MySQL query statement below

-- concat
-- format
-- left
-- right
-- trim
-- substr
-- length
-- position
-- replace
-- reverse

-- ex: shapiro@gmail@leetcode.com

-- where right(mail, 13)  like '@leetcode.com'

select *
from users
where left(mail, length(mail) - 13) regexp '^[a-zA-Z]+[_.-]*[a-zA-Z0-9]*$' and binary (right(mail, 13)) = '@leetcode.com'