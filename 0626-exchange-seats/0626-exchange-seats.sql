with cte as(select id,student,coalesce(lead(student)over(order by id),student) as next,ifnull(lag(student) over(order by id),student) as prev
from seat)
select id,case when id%2=1 then next
when id%2=0 then prev
else student end as student
from cte
order by id