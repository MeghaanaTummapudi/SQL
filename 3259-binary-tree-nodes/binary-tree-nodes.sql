# Write your MySQL query statement below

-- with testing as (
-- select distinct n, 'Leaf' as type
-- from tree
-- where n not in (select distinct p from tree where p is not null) and p is not null

-- union 

-- select n, 'Root' as type
-- from tree 
-- where p is null
-- )

-- select n as N, 'Inner' as Type
-- from tree
-- where n not in (select n from testing)

-- union 

-- select *
-- from testing
-- order by N asc

select N, 
    (case when p is null then 'Root'
          when n not in (select distinct p from tree where p is not null) then 'Leaf' 
          else 'Inner' end) as type
from tree
order by N asc