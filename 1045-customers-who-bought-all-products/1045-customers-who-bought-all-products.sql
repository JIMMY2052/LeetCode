# Write your MySQL query statement below
SELECT DISTINCT customer_id
FROM customer c JOIN
product p ON c.product_key = p.product_key
GROUP BY c.customer_id
HAVING count(distinct p.product_key) = (SELECT COUNT(*) FROM product)
