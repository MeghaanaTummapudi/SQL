# Write your MySQL query statement below

with testing as (
select t.id, t.drink, cast(t.rn as signed) as rn
from (select *, row_number() over () as rn
from coffeeshop ) as t

), 

testing2 as (
select *, sum(drink is not null) over (order by rn) as tst
from testing
)

select id, max(drink) over (partition by tst order by rn asc) as drink
from testing2