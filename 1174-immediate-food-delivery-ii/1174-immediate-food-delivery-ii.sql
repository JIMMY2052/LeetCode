# Write your MySQL query statement below
with cte as (SELECT *, row_number() OVER(partition by customer_id ORDER BY order_date) as rn
FROM delivery)

SELECT  ROUND(avg(order_date= customer_pref_delivery_date) * 100,2)as immediate_percentage 
FROM cte
WHERE rn = 1

