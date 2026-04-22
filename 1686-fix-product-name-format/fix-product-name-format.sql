# Write your MySQL query statement below

select rtrim(ltrim(lower(product_name))) as product_name, date_format(sale_date, '%Y-%m') as sale_date, count(*) as total
from sales
group by rtrim(ltrim(lower(product_name))), date_format(sale_date, '%Y-%m')
order by product_name asc, sale_date asc