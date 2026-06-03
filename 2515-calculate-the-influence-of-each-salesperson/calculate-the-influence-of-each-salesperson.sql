# Write your MySQL query statement below

select sp.salesperson_id, sp.name, ifnull(t.tot, 0) as total
from salesperson as sp
left join (select c.salesperson_id, sum(s.price) as tot
from sales as s
left join customer as c
on s.customer_id = c.customer_id
group by c.salesperson_id) as t
on sp.salesperson_id = t.salesperson_id
