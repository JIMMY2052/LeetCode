with cte AS (
    select num, lead(num, 1) over () as num1,lead(num, 2) over () as num2
    from logs
)
select distinct num as ConsecutiveNums 
from cte 
WHERE num = num1 AND num1 = num2