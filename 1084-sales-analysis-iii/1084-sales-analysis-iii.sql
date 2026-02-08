# Write your MySQL query statement below
-- SELECT p.product_id , p.product_name FROM (SELECT * FROM product p JOIN sales s WHERE s.sale_date NOT between '2019-01-01' AND '2019-03-31') t WHERE


SELECT p.product_id , p.product_name FROM product p JOIN sales s ON p.product_id = s.product_id GROUP BY p.product_id , p.product_name having min(s.sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31'