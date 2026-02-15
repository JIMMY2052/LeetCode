# Write your MySQL query statement below
SELECT sell_date , count(*) as num_sold, group_concat(distinct product) as products
FROM (SELECT distinct sell_date,product FROM activities) t
GROUP BY sell_date