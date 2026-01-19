SELECT c.name as Customers
FROM Customers c
WHERE id NOT IN (SELECT customerId FROM Orders)