/*
  Problem 2: Retrieve Orders from 'New York'
  Target Environment: MySQL Workbench (MySQL 8.0+)
  
  Approach:
  1. Join the `orders` and `customers` tables on `customer_id`.
  2. Filter the records using a WHERE clause to select only customers living in 'New York'.
  3. Select `customer_name`, `order_date`, and `total_amount`.
  
  Bonus Approach:
  - Utilize a SQL Window Function `AVG(o.total_amount) OVER (PARTITION BY c.customer_id)` 
    to calculate each customer's average order amount alongside their individual order details.
*/

USE general_coding_logic;

-- ============================================================================
-- 1. Standard Solution
-- ============================================================================
SELECT 
    c.customer_name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'New York';


-- ============================================================================
-- 2. Bonus Solution (Includes Average Total Amount Per Customer)
-- ============================================================================
SELECT 
    c.customer_name,
    o.order_date,
    o.total_amount,
    ROUND(AVG(o.total_amount) OVER (PARTITION BY c.customer_id), 2) AS avg_total_amount_per_customer
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'New York';