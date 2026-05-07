# Write your MySQL query statement below

with expn as (
select 'Reading' as exp_name
union all
select 'Sports' as exp_name
union all
select 'Programming' as exp_name
), 

plat as (
select 'IOS' as plat_name
union all
select 'Android' as plat_name
union all
select 'Web' as plat_name
)

select e.exp_name as experiment_name, p.plat_name as platform, ifnull(count(expn.experiment_id), 0) as num_experiments
from expn as e
cross join plat as p
left join experiments as expn
on e.exp_name = expn.experiment_name and p.plat_name = expn.platform
group by e.exp_name, p.plat_name

