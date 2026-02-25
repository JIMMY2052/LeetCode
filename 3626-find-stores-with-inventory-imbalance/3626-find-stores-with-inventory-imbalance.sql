with res
as (
select i.store_id,
store_name,
location,
product_name,
quantity,
price,
first_value(product_name) over(partition by i.store_id order by price desc) most_exp_product,
first_value(quantity) over(partition by i.store_id order by price desc) exp_p_quantity,
first_value(product_name) over(partition by i.store_id order by price ) cheapest_product,
first_value(quantity) over(partition by i.store_id order by price ) cheapest_p_quantity,
row_number() over(partition by i.store_id) rnk
from stores s
join inventory i
on s.store_id = i.store_id )
select store_id,store_name,location,most_exp_product,
cheapest_product,
round((cheapest_p_quantity/exp_p_quantity),2) imbalance_ratio
from res
where
(rnk = 1 and exp_p_quantity < cheapest_p_quantity) and
store_id in (select i.store_id
from stores s
join inventory i
on s.store_id = i.store_id
group by 1
having count(distinct product_name) >= 3 )
order by (cheapest_p_quantity/exp_p_quantity) desc ,store_name ;