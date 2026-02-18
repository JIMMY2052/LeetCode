# Write your MySQL query statement below



with cte as (SELECT product_id, new_price, row_number() over (partition by product_id order by change_date desc) as 'num' FROM products WHERE change_date <= '2019-08-16'),
p as (SELECT DISTINCT product_id FROM products)

SELECT p.product_id, coalesce(t.new_price,10) as price
FROM (SELECT product_id FROM p) p LEFT JOIN  (SELECT product_id, new_price FROM cte WHERE num =1) t
ON p.product_id = t.product_id



