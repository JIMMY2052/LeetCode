# Write your MySQL query statement below
with cte as (
    SELECT buyer_id, order_date, count(*) as count
    FROM orders 
    WHERE year(order_date) = '2019'
    GROUP BY buyer_id)

SELECT u.user_id as buyer_id, join_date, COALESCE(count,0) as orders_in_2019
FROM users u LEFT JOIN (SELECT buyer_id, order_date, count FROM cte) o 
ON u.user_id = o.buyer_id