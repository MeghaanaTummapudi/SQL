# Write your MySQL query statement below

with testing as (
select distinct c1.seat_id as c1s, c2.seat_id as c2s
from cinema as c1
join cinema as c2 
on c1.seat_id < c2.seat_id and (c2.seat_id - c1.seat_id = 1) 
where c1.free = c2.free and c1.free = 1
)

select c1s as seat_id
from testing 
union 
select c2s as seat_id
from testing 
order by seat_id