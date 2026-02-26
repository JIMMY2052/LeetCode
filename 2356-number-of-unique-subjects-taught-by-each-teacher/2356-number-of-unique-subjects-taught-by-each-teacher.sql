# Write your MySQL query statement below



SELECT teacher_id, count(*) as cnt
FROM
(
SELECT teacher_id, subject_id
FROM teacher
GROUP BY teacher_id,subject_id
)t
GROUP By teacher_id