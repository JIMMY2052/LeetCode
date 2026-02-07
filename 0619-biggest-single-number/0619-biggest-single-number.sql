with cte as(
select num as num
from MyNumbers
group by num
having count(1) = 1)
select max(num) as num from cte;