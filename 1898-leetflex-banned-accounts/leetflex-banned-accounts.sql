# Write your MySQL query statement below

select distinct l1.account_id
from loginfo as l1
join loginfo as l2
on l1.account_id = l2.account_id and l1.ip_address <> l2.ip_address
where l2.login between l1.login and l1.logout or l2.logout between l1.login and l1.logout