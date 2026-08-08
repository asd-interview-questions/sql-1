/*
  Problem 5: Department Statistics
  Target Environment: MySQL Workbench (MySQL 8.0+)
  
  Approach:
  1. Group the `employees` table by `department`.
  2. Compute `AVG(salary)` to find the average salary per department.

  Bonus Approach:
  - Use the `DENSE_RANK()` window function partitioned by `department` and ordered by `salary DESC`.
  - Filter for top-ranked employees (`rank_num = 1`) to retrieve the employee name(s) earning the maximum salary in each department.
*/

USE general_coding_logic;

-- ============================================================================
-- 1. Standard Solution (Average Salary per Department)
-- ============================================================================
SELECT 
    department,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department;


-- ============================================================================
-- 2. Bonus Solution (Highest Salary and Corresponding Employee(s) per Department)
-- ============================================================================
WITH RankedSalaries AS (
    SELECT 
        department,
        name AS employee_name,
        salary,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_num
    FROM employees
)
SELECT 
    department,
    employee_name,
    salary AS highest_salary
FROM RankedSalaries
WHERE rank_num = 1;