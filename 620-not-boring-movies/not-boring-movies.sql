# Write your MySQL query statement below

select *
from cinema
where description not like '%boring%' and 
      id not like '%0'  and 
      id not like '%2' and
      id not like '%4' and
      id not like '%6' and
      id not like '%8' 
order by rating desc
      
      
    --   ('%0', '%2, %4', '%6', '%8')