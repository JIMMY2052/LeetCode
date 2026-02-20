# Write your MySQL query statement below
with totalUnit as (SELECT product_id, sum(units) as units FROM unitssold GROUP BY product_id), unitPriceList as (
SELECT p.product_id, (units * price) as unitprice
FROM prices p LEFT JOIN unitssold u
ON p.product_id = u.product_id AND purchase_date BETWEEN start_date AND end_date
)

SELECT u.product_id , coalesce(round(sum(unitprice)/ units, 2),0) as average_price
FROM totalUnit t RIGHT JOIN unitPriceList u 
ON t.product_id = u.product_id
GROUP BY u.product_id






