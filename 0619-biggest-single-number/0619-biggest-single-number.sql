# Write your MySQL query statement below
SELECT MAX(num)  as num FROM (SELECT count(*) as cnt,num FROM mynumbers GROUP BY num) as t WHERE cnt = 1