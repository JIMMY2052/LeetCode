
select
case 
when id % 2 = 0 then id-1
when id % 2 = 1 and id < (SELECT MAX(id) FROM Seat) THEN id + 1
else id end as id, student
from seat
order by id

-- select 
-- case 
-- when id % 2 = 0 then id-1
-- when id % 2 = 1 and id < (SELECT MAX(id) FROM Seat) THEN id + 1
-- else id
-- end as id,
-- student
-- from seat
-- order by id 