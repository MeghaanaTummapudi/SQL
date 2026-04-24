# Write your MySQL query statement below

-- with testing as (
-- select user1_id as p1, user2_id as frnd
-- from friendship 

-- union 

-- select user2_id as p1, user1_id as frnd
-- from friendship 
-- ), 


-- testing2 as (
-- select t.frnd, l.page_id
-- from testing as t
-- left join likes as l
-- on t.p1 = l.user_id

-- )

-- select frnd as user_id, page_id, count(*) as friends_likes
-- from testing2
-- where (frnd, page_id) not in (select user_id, page_id from likes)
-- group by frnd, page_id


-- with testing as (
-- select user1_id as p1, user2_id as frnd
-- from friendship 

-- union all

-- select user2_id as p1, user1_id as frnd
-- from friendship 
-- )


-- select t.frnd as user_id, l.page_id, count(*) as friends_likes
-- from testing as t
-- left join likes as l
-- on t.p1 = l.user_id
-- where (t.frnd, l.page_id) not in (select user_id, page_id from likes)
-- group by t.frnd, l.page_id


-- select *
-- from friendship as f1
-- left join friendship as f2
-- on f1.user1_id  = f2.user2_id or f1.user2_id = f2.user1_id

WITH friends AS (
    SELECT user1_id AS user_id, user2_id AS friend_id
    FROM friendship

    UNION ALL

    SELECT user2_id AS user_id, user1_id AS friend_id
    FROM friendship
)

SELECT 
    f.user_id,
    l.page_id,
    COUNT(*) AS friends_likes
FROM friends f
JOIN likes l
    ON f.friend_id = l.user_id
LEFT JOIN likes self_likes
    ON f.user_id = self_likes.user_id
   AND l.page_id = self_likes.page_id
WHERE self_likes.user_id IS NULL
GROUP BY f.user_id, l.page_id;