select l.book_id, title, author, genre, publication_year, count(l.book_id) as current_borrowers
from library_books l
join borrowing_records b on l.book_id = b.book_id
where return_date is null
group by 1,2,3,4,total_copies
having count(b.book_id) = l.total_copies
order by current_borrowers desc, title asc