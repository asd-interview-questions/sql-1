/*
  Problem 3: Sales Analysis
  Target Environment: MySQL Workbench (MySQL 8.0+)
  
  Approach:
  1. Aggregate the `sales` table using `SUM()` for total quantity and `AVG()` for average quantity sold per order.
  2. Use `COUNT(DISTINCT order_id)` to ensure average calculation correctly reflects per-order metrics.

  Bonus Approach:
  - Join `sales` with `inventories` to compute total sales revenue (`quantity * price`).
  - Calculate total sales amount and average sales amount per order.
*/

USE general_coding_logic;

-- ============================================================================
-- 1. Standard Solution (Quantity Metrics)
-- ============================================================================
SELECT 
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS avg_quantity_sold_per_order
FROM sales;


-- ============================================================================
-- 2. Bonus Solution (Including Total & Average Sales Revenue)
-- ============================================================================
SELECT 
    SUM(s.quantity) AS total_quantity_sold,
    ROUND(SUM(s.quantity) / COUNT(DISTINCT s.order_id), 2) AS avg_quantity_sold_per_order,
    SUM(s.quantity * i.price) AS total_sales_amount,
    ROUND(SUM(s.quantity * i.price) / COUNT(DISTINCT s.order_id), 2) AS avg_sales_amount_per_order
FROM sales s
JOIN inventories i ON s.product_id = i.product_id;