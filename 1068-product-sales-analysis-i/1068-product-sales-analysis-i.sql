# Write your MySQL query statement below
SELECT p.product_name , s.year, s.price
FROM product p JOIN Sales s ON p.product_id = s.product_id
