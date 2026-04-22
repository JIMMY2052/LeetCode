# Write your MySQL query statement below
with a as (SELECT book_id,
count(*) as total,
SUM(CASE WHEN session_rating >= 4 THEN 1 END) as high,
SUM(CASE WHEN session_rating <= 2 THEN 1 END) as low
FROM reading_sessions 
GROUP BY book_id)
,
b as (SELECT b.*, 
max(r.session_rating) - min(r.session_rating) as rating_spread,
round((high + low) / total,2) as polarization_score
FROM a 
JOIN reading_sessions r ON a.book_id = r.book_id
JOIN books b ON a.book_id = b.book_id
WHERE total >= 5 and high IS NOT NULL and low IS NOT NULL
GROUP BY a.book_id
ORDER BY polarization_score desc, b.title desc)

SELECT * FROM b where polarization_score >= 0.6