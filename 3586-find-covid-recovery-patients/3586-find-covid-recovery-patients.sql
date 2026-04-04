# Write your MySQL query statement below
with cte as(SELECT patient_id, SUM(CASE WHEN result = 'positive' THEN 1  else  0 END) as positive,
SUM(CASE WHEN result = 'negative' THEN 1  else  0 END) as negative
FROM covid_tests
GROUP BY patient_id)

,cta as (SELECT c.patient_id, CASE WHEN result = 'positive' THEN ROW_NUMBER() OVER(partition by c.patient_id order by test_date) END as positive_date, CASE WHEN result = 'negative' THEN ROW_NUMBER() OVER(partition by c.patient_id order by test_date) END as negative_date,
test_date  
FROM cte c 
JOIN covid_tests i on c.patient_id = i.patient_id AND positive != 0 AND negative != 0)

,hh as(SELECT patient_id ,CASE WHEN positive_date IS NOT NULL THEN test_date END as positive_date1,
CASE WHEN negative_date IS NOT NULL THEN test_date END as negative_date1
FROM cta)

,p as (SELECT patient_id, min(positive_date1) as positive_date
FROM hh
GROUP BY patient_id)

,last as(SELECT p.patient_id , positive_date, negative_date1 
FROM p
JOIN hh  ON p.patient_id = hh.patient_id and hh.negative_date1 > positive_date)

,last1 as (
    SELECT *, row_number() OVER(partition by patient_id) as rn
    FROM last
)

SELECT l.patient_id,  patient_name, age, DATEDIFF(negative_date1, positive_date) AS recovery_time
FROM last1 l 
JOIN patients p ON l.patient_id = p.patient_id and rn =1
ORDER BY recovery_time, age

