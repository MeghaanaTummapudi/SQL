# Write your MySQL query statement below

WITH latest_prices AS (
    SELECT product_id, new_price
    FROM Products
    WHERE change_date <= '2019-08-16'
    AND (product_id, change_date) IN (
        SELECT product_id, MAX(change_date) 
        FROM Products 
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    )
)

SELECT p.product_id, COALESCE(lp.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN latest_prices lp ON p.product_id = lp.product_id

