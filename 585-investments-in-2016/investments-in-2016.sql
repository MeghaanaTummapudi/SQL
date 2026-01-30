# Write your MySQL query statement below

-- select lat, lon
-- from insurance 
-- group by lat, lon
-- having count(*) = 1
-- round(sum(tiv_2016), 2) as tiv_2016
-- select *
-- from insurance 
-- where (lat, lon) in (select lat, lon
--                      from insurance 
--                      group by lat, lon
--                      having count(*) = 1)
-- group by tiv_2015

select round(sum(tiv_2016), 2) as tiv_2016
from insurance
where (lat, lon) in (select lat, lon
                     from insurance 
                     group by lat, lon
                     having count(*) = 1) and tiv_2015 in (select tiv_2015 
                                                           from insurance
                                                           group by tiv_2015
                                                           having count(*) > 1)
-- group by tiv_2015
-- having count(*) > 1) as t
-- select sum(tiv_2016) 
-- from insurance
-- where (lat, lon) in (select lat, lon
--                      from insurance 
--                      group by lat, lon
--                      having count(*) = 1)
-- group by tiv_2015
-- having count(*) > 1