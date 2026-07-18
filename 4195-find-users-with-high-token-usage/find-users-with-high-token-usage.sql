# Write your MySQL query statement below

with testing as (
select user_id, count(prompt) as n_c, avg(tokens) as avg_token
from prompts
group by user_id
having count(prompt) >= 3
)

select distinct t.user_id, t.n_c as prompt_count, round(t.avg_token, 2) as avg_tokens
from prompts as p
join testing as t
on p.user_id = t.user_id
where p.tokens > t.avg_token
order by t.avg_token desc, t.user_id asc
