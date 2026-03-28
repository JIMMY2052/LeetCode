WITH cte as 
    (   
        SELECT
            p1.product_id as product1_id, 
            p2.product_id as product2_id,
            COUNT(p1.user_id) as customer_count
        FROM ProductPurchases as p1 LEFT JOIN ProductPurchases as p2 ON p1.user_id=p2.user_id
        WHERE p1.product_id<p2.product_id
        GROUP BY p1.product_id, p2.product_id
        HAVING COUNT(p1.user_id)>=3
    )

SELECT 
    product1_id,
    product2_id,
    p1.category as product1_category,
    p2.category as product2_category,
    customer_count
FROM 
    cte 
    JOIN ProductInfo AS p1 on product1_id=p1.product_id
    JOIN ProductInfo AS p2 on product2_id=p2.product_id
ORDER BY customer_count DESC, product1_id ASC, product2_id ASC