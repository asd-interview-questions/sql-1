/*
  Problem 7: Delete Customer
  Target Environment: MySQL Workbench (MySQL 8.0+)
  
  Approach:
  1. Execute a `DELETE` statement targeting `customers` with a specific `customer_id`.

  Bonus Approach:
  - When we created the `orders` and `sales` tables in Problem 1, we specified `ON DELETE CASCADE` 
    on the foreign key constraints referencing `customer_id`.
  - Executing a `DELETE FROM customers WHERE customer_id = ...` automatically cascades 
    and removes all associated records in `orders` and `sales`, preserving referential integrity.
*/

USE general_coding_logic;

-- ============================================================================
-- 1. Standard & Bonus Solution
-- ============================================================================
-- Deleting customer_id = 101 will automatically delete their orders and sales 
-- due to foreign key 'ON DELETE CASCADE' constraints set during table creation.

DELETE FROM customers 
WHERE customer_id = 101;

-- Verification Queries:
SELECT * FROM customers WHERE customer_id = 101;
SELECT * FROM orders WHERE customer_id = 101;
SELECT * FROM sales WHERE customer_id = 101;