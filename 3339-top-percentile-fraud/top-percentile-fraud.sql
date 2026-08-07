# Write your MySQL query statement below

select t.policy_id, t.state, t.fraud_score
from (select *, cume_dist() over (partition by state order by fraud_score asc) as pr
from Fraud) as t
-- where t.state = 'Alaska'
where t.pr >= 0.95
order by state asc, fraud_score desc, policy_id asc
