# Write your MySQL query statement below

-- select group_concat(distinct concat_ws(',', t1.topping_name, t2.topping_name, t3.topping_name) order by t1.topping_name asc, t2.topping_name asc, t3.topping_name asc) as pizza, round(sum(t1.cost + t2.cost + t3.cost), 2) as total_cost
-- from toppings as t1
-- join toppings as t2
-- on t1.topping_name < t2.topping_name
-- join toppings as t3
-- on t1.topping_name < t3.topping_name and t2.topping_name < t3.topping_name
-- group by t1.topping_name, t2.topping_name, t3.topping_name 
-- order by total_cost desc, pizza asc


select concat_ws(',', t1.topping_name, t2.topping_name, t3.topping_name) as pizza, round((t1.cost + t2.cost + t3.cost), 2) as total_cost
from toppings as t1
join toppings as t2
on t1.topping_name < t2.topping_name
join toppings as t3
on t1.topping_name < t3.topping_name and t2.topping_name < t3.topping_name
order by total_cost desc, pizza asc