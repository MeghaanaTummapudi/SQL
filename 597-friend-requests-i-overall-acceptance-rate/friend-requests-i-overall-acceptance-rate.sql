# Write your MySQL query statement below

-- with testing as (
-- select count(*) as tot
-- from (select distinct sender_id, send_to_id
--     from friendrequest) as t1
-- )

-- select ifnull(round(count(*) / (select tot from testing), 2), 0.0) as accept_rate
-- from (select distinct requester_id, accepter_id
--      from requestaccepted) as t

select ifnull(round(count(distinct requester_id, accepter_id) / (select count(distinct sender_id, send_to_id) from friendrequest), 2), 0.0) as accept_rate
from requestaccepted
