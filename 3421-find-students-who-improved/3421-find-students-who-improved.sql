WITH ScoreRankings AS (
    SELECT 
        student_id, 
        subject, 
        score,
        -- Get the first score ever recorded for this student/subject
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject 
            ORDER BY exam_date ASC
        ) AS first_score,
        -- Get the latest score ever recorded for this student/subject
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject 
            ORDER BY exam_date DESC
        ) AS latest_score,
        -- Count how many exams they took in this subject
        COUNT(score) OVER (
            PARTITION BY student_id, subject
        ) AS exam_count
    FROM Scores
)
SELECT DISTINCT
    student_id,
    subject,
    first_score,
    latest_score
FROM ScoreRankings
WHERE exam_count >= 2 
  AND latest_score > first_score
ORDER BY student_id, subject;