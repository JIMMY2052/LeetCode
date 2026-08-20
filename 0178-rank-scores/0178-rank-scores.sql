# Write your MySQL query statement below
with a as (
    SELECT  *, dense_rank() over(ORDER BY score desc) as r FROM scores

)

SELECT score,  r as 'rank' FROM a ORDER BY score desc