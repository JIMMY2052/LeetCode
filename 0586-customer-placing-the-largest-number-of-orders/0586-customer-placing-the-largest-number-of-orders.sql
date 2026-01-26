# Write your MySQL query statement below
SELECT customer_number
FROM Orders
GROUP BY customer_number
order by count(customer_number) desc limit 1;