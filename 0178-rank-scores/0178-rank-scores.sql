SELECT
    s.Score as score,
    (
        SELECT COUNT(DISTINCT s2.Score)
        FROM Scores s2
        WHERE s2.Score > s.Score
    ) + 1 AS 'rank'
FROM Scores s
ORDER BY s.Score DESC;
