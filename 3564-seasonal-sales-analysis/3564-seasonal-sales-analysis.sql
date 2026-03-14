# Write your MySQL query statement below
with cte as (SELECT p.product_id, quantity, price, category,
CASE 
WHEN month(sale_date) IN (12,1,2) THEN 'Winter'
WHEN month(sale_date) IN (3,4,5) THEN 'Spring'
WHEN month(sale_date) IN (6,7,8) THEN  'Summer'
WHEN month(sale_date) IN (9,10,11) THEN 'Fall' END as season
FROM sales s JOIN products p ON s.product_id = p.product_id),
cta as(
SELECT season, category,sum(quantity) as total_quantity, sum(quantity * price) as total_revenue
FROM cte
GROUP BY season, category
),


ranked as (
select *,
row_number() over (partition by season order by total_quantity desc, total_revenue desc, category asc) as rn
from cta
)
select
season,
category,
total_quantity,
total_revenue
from ranked
where rn = 1;