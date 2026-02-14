# Write your MySQL query statement below
SELECT product_name, sum(unit) as unit
FROM (SELECT p.product_name, o.unit as unit
FROM products p JOIN orders o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29') t
GROUP BY product_name
HAVING sum(unit) >= 100 



