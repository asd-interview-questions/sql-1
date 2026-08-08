/*
  Problem 4: Update Product Price
  Target Environment: MySQL Workbench (MySQL 8.0+)
  
  Approach:
  1. Use the `UPDATE` statement on the `inventories` table.
  2. Modify the `price` column for a specific `product_id` using a `WHERE` clause.

  Bonus Approach:
  - Omit the `WHERE` clause (or target all active records) to update the price of all products,
    multiplying the existing price by 1.10 (a 10% increase).
*/

USE general_coding_logic;

-- ============================================================================
-- 1. Standard Solution (Update price for a specific product)
-- ============================================================================
-- Example: Update product_id = 201 (Laptop) to new price 1250.00
UPDATE inventories
SET price = 1250.00
WHERE product_id = 201;

-- Verify update
SELECT * FROM inventories WHERE product_id = 201;


-- ============================================================================
-- 2. Bonus Solution (Increase price of ALL products by 10%)
-- ============================================================================
-- Note: If MySQL Workbench safe-update mode is enabled, temporarily disable it:
SET SQL_SAFE_UPDATES = 0;

UPDATE inventories
SET price = ROUND(price * 1.10, 2);

-- Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;

-- Verify global price increase
SELECT product_id, product_name, price FROM inventories;