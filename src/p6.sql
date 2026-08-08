/*
  Problem 6: Retrieve Employees with High Salary
  Target Environment: MySQL Workbench (MySQL 8.0+)
  
  Approach:
  1. Query the `employees` table for `name` and `position`.
  2. Filter using a `WHERE` clause where `salary > 50000`.

  Bonus Approach:
  - Sort all employees by `salary DESC`.
  - Use `LIMIT 3` to extract the top three highest-paid employees.
*/

USE general_coding_logic;

-- ============================================================================
-- 1. Standard Solution (Employees with Salary > $50,000)
-- ============================================================================
SELECT 
    name,
    position
FROM employees
WHERE salary > 50000;


-- ============================================================================
-- 2. Bonus Solution (Top Three Highest-Paid Employees)
-- ============================================================================
SELECT 
    name,
    position,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 3;