# Write your MySQL query statement below

-- select *
-- from cinema
-- where description <> 'boring' and id regexp '[^02468]'
-- order by rating desc


select *
from cinema 
where description <> 'boring' and id not like '%0' 
                              and id not like '%2'
                              and id not like '%4'
                              and id not like '%6'
                              and id not like '%8' 
order by rating desc