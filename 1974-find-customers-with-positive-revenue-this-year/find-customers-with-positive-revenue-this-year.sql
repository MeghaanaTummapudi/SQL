# Write your MySQL query statement below

select distinct customer_id
from customers
where year = 2021 and (revenue is not null and revenue > 0)