# Write your MySQL query statement below

--  500,000 total, 555.2 tot
with testing as (
select item_type, count(*) as n_c, floor(500000 / sum(square_footage)) as comb, floor(500000 / sum(square_footage)) * sum(square_footage) as tst
from inventory
where item_type = 'prime_eligible'
group by item_type
), 



testing2 as (
select item_type, count(*) as n_c, sum(square_footage) as tot_np, 
       floor((500000 - (select tst from testing)) / (sum(square_footage))) as remain
from inventory
where item_type = 'not_prime'
group by item_type
), 

test as (
select item_type, ifnull(n_c * comb, 0) as item_count
from testing

union all

select item_type, ifnull(n_c * remain, 0) as item_count
from testing2
)

select *
from test
order by item_count desc