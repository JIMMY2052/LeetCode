with temp as (
select * , count(primary_flag)over(partition by employee_id ) as cnt
from Employee)

select employee_id , department_id
from temp
where (cnt = 1) or (cnt >1 and primary_flag = 'Y')