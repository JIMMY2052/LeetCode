# Write your MySQL query statement below
SELECT ls.book_id, title , author, genre, publication_year, count(*) as current_borrowers
FROM library_books ls JOIN borrowing_records b
ON ls.book_id = b.book_id
WHERE return_date is  null
GROUP BY ls.book_id, b.return_date,ls.total_copies
HAVING count(*) = ls.total_copies
ORDER BY current_borrowers desc, title asc