with cte as(SELECT  p1.product_id as p1, p2.product_id as p2
FROM ProductPurchases p1 
JOIN ProductPurchases p2 ON p1.user_id = p2.user_id and P1.product_id < p2.product_id)
,cta as (SELECT *, count(*) as 'customer_count'
FROM cte 
GROUP BY p1,p2)

SELECT p1 as product1_id, p2 as product2_id, (SELECT category  FROM productInfo WHERE product_id = c.p1) as product1_category,
(SELECT category FROM productInfo WHERE product_id = c.p2) as product2_category,
customer_count 
FROM cta c 
WHERE customer_count >= 3
ORDER BY customer_count desc, product1_id, product2_id


