# Write your MySQL query statement below

with recursive testing(task_id, subtasks_count) as (

select task_id, 1
from tasks 

union all

select t.task_id, t.subtasks_count + 1
from testing as t
join tasks as t2
on t.task_id = t2.task_id
where t.subtasks_count < t2.subtasks_count

)

select t.task_id, t.subtasks_count as subtask_id
from testing as t
left join executed as e
on t.task_id = e.task_id and t.subtasks_count = e.subtask_id
where e.task_id is null and e.subtask_id is null
order by t.task_id, t.subtasks_count asc