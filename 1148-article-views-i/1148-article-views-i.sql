# Write your MySQL query statement below
SELECT DISTINCT author_id as id
FROM views v1 WHERE author_id = viewer_id
ORDER BY id ASC