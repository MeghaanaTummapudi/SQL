# Write your MySQL query statement below

WITH dailytotal AS (
    SELECT visited_on, SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
),
windowedsums AS (
    SELECT visited_on,
           SUM(total_amount) OVER (
               ORDER BY visited_on
               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
           ) AS amount,
           ROUND(AVG(total_amount) OVER (
               ORDER BY visited_on
               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
           ), 2) AS average_amount,
           ROW_NUMBER() OVER (ORDER BY visited_on) AS row_num
    FROM dailytotal
)
SELECT visited_on, amount, average_amount
FROM windowedsums
WHERE row_num >= 7
ORDER BY visited_on



