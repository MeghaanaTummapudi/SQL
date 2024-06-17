# Write your MySQL query statement below

select *
from cinema
where description <> 'boring' and id regexp '[13579]'
order by rating desc

-- select *
-- from cinema
-- where description not like 'boring' and (id like '%1' or id like '%3' or 
--                                          id like '%5' or id like '%7' or 
--                                          id like '%9')
-- order by rating desc
