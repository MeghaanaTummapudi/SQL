# Write your MySQL query statement below

-- with testing as (
-- select sale_date, max(case when fruit = 'apples' then sold_num else null end) as apples_sold, max(case when fruit = 'oranges' then sold_num else null end) as oranges_sold
-- from sales
-- group by sale_date
-- )

-- select sale_date, (apples_sold - oranges_sold) as diff
-- from testing
-- order by sale_date

select sale_date, max(case when fruit = 'apples' then sold_num else null end) - max(case when fruit = 'oranges' then sold_num else null end) as diff
from sales
group by sale_date
order by sale_date