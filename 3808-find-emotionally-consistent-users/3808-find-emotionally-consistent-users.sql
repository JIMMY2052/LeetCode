# Write your MySQL query statement below
with a as (SELECT user_id, content_id
FROM reactions
GROUP BY user_id, content_id)
,b as (SELECT user_id
FROM a
GROUP BY user_id
HAVING count(*) >= 5)
,c as (
SELECT b.user_id,
IFNULL(SUM(CASE WHEN reaction = 'like' THEN 1 END),0) as 'like1',
IFNULL(SUM(CASE WHEN reaction = 'wow' THEN 1 END),0) as wow,
IFNULL(SUM(CASE WHEN reaction = 'love' THEN 1 END),0) as love,
IFNULL(SUM(CASE WHEN reaction = 'angry' THEN 1 END),0) as angry,
IFNULL(SUM(CASE WHEN reaction = 'sad' THEN 1 END),0) as sad
FROM b JOIN reactions r
on b.user_id = r.user_id
GROUP BY b.user_id
)
, d as (
SELECT user_id, 
CASE 
 WHEN (like1 / (like1 + wow + love + angry + sad)) >= .6 THEN 'like'
 WHEN (wow / (like1 + wow + love + angry + sad)) >= .6 THEN 'wow'
 WHEN (love / (like1 + wow + love + angry + sad)) >= .6 THEN 'love'
 WHEN (sad / (like1 + wow + love + angry + sad)) >= .6 THEN 'sad'
  WHEN (angry / (like1 + wow + love + angry + sad)) >= .6 THEN 'angry'
 END as dominant_reaction ,
 CASE 
 WHEN (like1 / (like1 + wow + love + angry + sad))>= .6 THEN round(like1 / (like1 + wow + love + angry + sad),2)
 WHEN (wow / (like1 + wow + love + angry + sad))>= .6 THEN round(wow / (like1 + wow + love + angry + sad),2)
 WHEN (love / (like1 + wow + love + angry + sad))  >= .6 THEN round(love / (like1 + wow + love + angry + sad),2)
 WHEN (sad / (like1 + wow + love + angry + sad))>= .6 THEN round(sad / (like1 + wow + love + angry + sad),2)
  WHEN (angry / (like1 + wow + love + angry + sad))>= .6 THEN round(angry / (like1 + wow + love + angry + sad),2)
 END as reaction_ratio
FROM c 
)


SELECT *
FROM d
WHERE reaction_ratio is not null
ORDER BY reaction_ratio desc , user_id asc






