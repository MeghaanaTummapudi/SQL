# Write your MySQL query statement below

select r.contest_id, coalesce(round(count(r.user_id) / (select count( distinct user_id) from Users) * 100, 2), 0) as percentage
from Users as u
left join Register as r
on u.user_id = r.user_id
where r.contest_id is not null
group by r.contest_id
order by percentage desc, r.contest_id asc

-- SELECT 
--     r.contest_id, 
--     COALESCE(
--         ROUND(
--             SUM(CASE WHEN r.contest_id IS NOT NULL THEN 1 ELSE 0 END) / 
--             (SELECT COUNT(DISTINCT user_id) FROM Users) * 100, 2
--         ), 0
--     ) AS percentage
-- FROM Users AS u
-- LEFT JOIN Register AS r
-- ON u.user_id = r.user_id
-- GROUP BY r.contest_id
-- ORDER BY percentage DESC, r.contest_id ASC