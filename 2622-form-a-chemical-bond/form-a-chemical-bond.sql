# Write your MySQL query statement below

-- with testing as (
-- select symbol as metal
-- from elements
-- where type = 'Metal'
-- ), 

-- testing2 as (
-- select symbol as nonmetal
-- from elements
-- where type = 'Nonmetal'
-- )

-- select *
-- from testing
-- cross join testing2 

select m1.symbol as metal, m2.symbol as Nonmetal
from elements as m1
cross join elements as m2
where m1.type = 'Metal' and m2.type = 'Nonmetal'