# Write your MySQL query statement below
with temp as (SELECT machine_id,
round( 
(SELECT timestamp
 FROM activity 
 WHERE activity_type = 'end' 
 AND machine_id = a1.machine_id 
 AND process_id = a1.process_id
) 
- 
(SELECT timestamp 
FROM activity 
WHERE activity_type = 'start'
AND machine_id = a1.machine_id 
AND process_id = a1.process_id
),3) as processing_time
FROM activity a1 
GROUP BY machine_id, processing_time
)

SELECT machine_id , round(SUM(processing_time) / count(*),3) as processing_time
FROM (SELECT machine_id,processing_time FROM temp) t
GROUP BY machine_id



