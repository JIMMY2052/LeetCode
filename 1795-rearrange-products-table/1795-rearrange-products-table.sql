SELECT p1.product_id, 'store1' as store, p1.store1 AS price FROM products as p1
WHERE p1.store1 IS NOT NULL
UNION
SELECT p2.product_id, 'store2' as store, p2.store2 AS price FROM products as p2
WHERE p2.store2 IS NOT NULL
UNION
SELECT p3.product_id, 'store3' as store, p3.store3 AS price FROM products as p3
WHERE p3.store3 IS NOT NULL