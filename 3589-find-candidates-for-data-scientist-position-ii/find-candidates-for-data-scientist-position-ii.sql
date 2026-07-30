# Write your MySQL query statement below

-- select project_id, count(distinct skill) as n_c
-- from projects
-- group by project_id 

-- select candidate_id, count(distinct skill) as n_c
-- from candidates
-- group by candidate_id

with all_cases as (
select p.project_id as pid, p.skill as pskill, p.importance as imp, c.candidate_id as cid, c.skill as cskill, c.proficiency as prof
from projects as p
cross join candidates as c
-- on p.skill = c.skill
), 

matches as (
select p.project_id as pid, p.skill as pskill, p.importance as imp, c.candidate_id as cid, c.skill as cskill, c.proficiency as prof
from projects as p
left join candidates as c
on p.skill = c.skill
), 

matched as (
select distinct pid, cid, pskill
from all_cases 
where (pid, pskill, cid) not in (select pid, cskill, cid from all_cases)
), 

fin as (
select *, 
       (case when prof > imp then 10 
            when prof < imp then -5
            else 0 end) as tsts
from matches as m1
where cid not in (select cid from matched where pid = m1.pid)
order by pid, cid
), 

final as (
select t.*, row_number() over (partition by pid order by tot desc, cid asc) as rn
from (select pid, cid, 100 + sum(tsts) as tot
from fin
group by pid, cid) as t
)

select pid as project_id, cid as candidate_id, tot as score
from final
where rn = 1 and cid is not null
order by pid asc
-- cid = 2 and pid = 3
-- select *
-- from all_cases 
-- -- where cid = 2 and pid = 3
-- where (pid, pskill, cid) not in (select pid, cskill, cid from all_cases) and cid = 2 and pid = 3 

