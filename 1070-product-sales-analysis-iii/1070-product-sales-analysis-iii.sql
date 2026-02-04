# Write your MySQL query statement below
select product_id,first_year,price,quantity
from
(select product_id,year as first_year,price,quantity,rank() over (partition by product_id order by year) as rank1
from sales) as a
where rank1=1

