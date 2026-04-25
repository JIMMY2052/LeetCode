# Write your MySQL query statement below

with a as (SELECT customer_id, 
count(*) as total_orders,
ROUND(SUM(CASE WHEN (DATE_FORMAT(order_timestamp, '%H:%i') BETWEEN '11:00' AND '14:00' )  OR (DATE_FORMAT(order_timestamp, '%H:%i') BETWEEN '18:00' AND '21:00') THEN 1 END)/ COUNT(*) * 100)  AS peak_hour_percentage,
ROUND(AVG(order_rating),2)  as average_rating,
SUM(CASE WHEN order_rating IS NOT NULL THEN 1 END ) / count(*) as no_rate
FROM restaurant_orders  
GROUP BY customer_id
HAVING count(*) >= 3)

SELECT customer_id, total_orders, peak_hour_percentage, average_rating
FROM a
WHERE peak_hour_percentage >= 60 AND no_rate >= 0.5 AND average_rating >= 4
ORDER BY average_rating desc, customer_id desc

