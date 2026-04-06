# Write your MySQL query statement below

-- with recursive testing as (
-- select 1 as n
-- union all
-- select n + 1
-- from testing
-- where n < 12
-- ), 

-- testing2 as (
-- select distinct id as id
-- from employee
-- ),

-- testing3 as (
-- select t2.id, t1.n, ifnull(e.salary, 0) as salary
-- from testing2 as t2
-- cross join testing as t1
-- left join employee as e
-- on t2.id = e.id and t1.n = e.month
-- ),

-- testing4 as (
-- select id, max(n) as max_t
-- from testing3
-- where salary <> 0
-- group by id
-- ), 

-- testing5 as (
-- select t3.id, t3.n, t3.salary
-- from testing3 as t3
-- join testing4 as t4
-- on t3.id = t4.id and t3.n < t4.max_t
-- ),

-- testing6 as (
-- select *,
--         SUM(salary) OVER (partition by id
--         ORDER BY n asc
--         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
--     ) AS rolling_3_month_sum
-- from testing5
-- -- where salary <> 0
-- order by id, n
-- )

-- select id, n as month, rolling_3_month_sum as salary
-- from testing6
-- where salary <> 0
-- order by id asc, n desc

select e1.id, e1.month, (e1.salary + ifnull(e2.salary, 0) + ifnull(e3.salary, 0)) as salary
from employee as e1
left join employee as e2
on e1.id = e2.id and e2.month = e1.month - 1
left join employee as e3
on e1.id = e3.id and e3.month = e1.month - 2
where e1.month < (select max(e4.month) from employee as e4 where e4.id = e1.id)
order by e1.id asc, e1.month desc