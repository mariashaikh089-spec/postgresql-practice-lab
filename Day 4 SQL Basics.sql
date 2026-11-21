CREATE TABLE product_inventory(
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100),
wholesale_cost NUMERIC(10,2)
);
INSERT INTO product_inventory (product_name,wholesale_cost)
VALUES
('Laptop', 75000),
('Mobile Phone',45000),
('Tablet',30000),
('Monitor',25000),
('Keyboard',5000),
('Mouse',2000),
('Headphones',8000);
SELECT*FROM product_inventory;
SELECT
product_name,
wholesale_cost
FROM product_inventory
ORDER BY wholesale_cost DESC
LIMIT 3;
SELECT
product_name,
wholesale_cost
FROM product_inventory
ORDER BY wholesale_cost DESC
LIMIT 2 OFFSET 3;


