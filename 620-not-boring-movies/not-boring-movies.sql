# Write your MySQL query statement below

select *
from cinema
where description not like '%boring%' and 
      mod(id, 2) <> 0 
    --   AND id NOT LIKE '%[02468]'
    --   id not like '%0'  and 
    --   id not like '%2' and
    --   id not like '%4' and
    --   id not like '%6' and
    --   id not like '%8' 
order by rating desc
      
      