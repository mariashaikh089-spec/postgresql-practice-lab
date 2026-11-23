-- Creating a table
CREATE TABLE analytical_sales (
transaction_id INT PRIMARY KEY,
product_category VARCHAR(50),
units_sold INT,
total_revenue NUMERIC(10,2)
);
-- Inserting sample data 
INSERT INTO analytical_sales
(transaction_id, product_category, units_sold, total_revenue)
VALUES
(1, 'Electronics', 2, 500),
(2, 'Electronics', 1, 200),
(3, 'Clothing', 3, 300),
(4, 'Clothing', 1, 100),
(5, 'Food', 5, 250),
(6, 'Food', 2, 150),
(7, 'Books', 4, 400),
(8, 'Books', 1, 100),
(9, 'Furniture', 2, 600),
(10, 'Furniture', 1, 250),
(11, 'Electronics', 3, 750),
(12, 'Clothing', 4, 400),
(13, 'Food', 1, 50),
(14, 'Book', 3, 300),
(15, 'Furniture', 3, 900);
-- Display all records from the sales table
SELECT *
FROM analytical_sales;
--Calculate total, average, count, highest and lowest revenue
SELECT
SUM(total_revenue) AS total_revenue,
AVG(total_revenue) AS average_revenue,
COUNT(*) AS total_transaction,
MAX(total_revenue) AS highest_revenue,
MIN(total_revenue) AS lowest_revenue
FROM analytical_sales;
-- Count the number of unique product categories
SELECT
COUNT(DISTINCT product_category) AS unique_categories
FROM analytical_sales;
-- Group sales by product category
-- Calculate total revenue and units sold for each category
SELECT product_category,
SUM(total_revenue) AS category_revenue,
SUM(units_sold) AS total_units_sold
FROM analytical_sales
GROUP BY product_category;
-- Group by category
SELECT product_category,
SUM(total_revenue) AS category_revenue
FROM analytical_sales
GROUP BY product_category
ORDER BY category_revenue DESC;
-- Display transactions where more than one unit was sold
SELECT
transaction_id,
product_category,
units_sold,
total_revenue
FROM analytical_sales
WHERE units_sold > 1;
-- Display categories whose total revenue is greater than 300
SELECT product_category,
SUM(total_revenue) AS category_revenue
FROM analytical_sales
GROUP BY product_category
HAVING SUM(total_revenue) > 300
ORDER BY category_revenue DESC;
-- Analyse transactions where more than one unit was sold
-- Group the transactions by category
-- Display categories whose filtered revenue exceeds 250
SELECT product_category,
SUM(total_revenue) AS category_revenue
FROM analytical_sales
WHERE units_sold > 1
GROUP BY product_category
HAVING SUM(total_revenue) > 250
ORDER BY category_revenue DESC;
-- Display only top two rows
SELECT product_category,
SUM(total_revenue) AS category_revenue
FROM analytical_sales
WHERE units_sold > 1
GROUP BY product_category
HAVING SUM(total_revenue) > 250
ORDER BY category_revenue DESC
LIMIT 2;
-- ERROR: transaction_id is not grouped or aggregated
SELECT
product_category,
transaction_id,
SUM(total_revenue) AS category_revenue
FROM analytical_sales
GROUP BY product_category;
-- Each category
SELECT
product_category,
SUM(total_revenue) AS category_revenue
FROM analytical_sales
GROUP BY product_category;
SELECT
product_category,
transaction_id,
SUM(total_revenue) AS category_revenue
FROM analytical_sales
GROUP BY product_category, transaction_id;



