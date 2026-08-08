/*
  Problem 8: Query Performance Optimization
  Target Environment: MySQL Workbench (MySQL 8.0+)
  
  Query under evaluation:
  SELECT * FROM employees WHERE department = 'Sales' AND salary > 50000;
  
  ------------------------------------------------------------------------------
  1. QUERY ANALYSIS
  ------------------------------------------------------------------------------
  Without an index, the database engine executes a Full Table Scan (ALL), 
  reading every row in the `employees` table from disk to check both conditions:
    a) Equality condition: `department = 'Sales'`
    b) Range condition:    `salary > 50000`
    
  As the size of the table grows, query performance degrades linearly (O(N) time complexity).

  ------------------------------------------------------------------------------
  2. PROPOSED INDEX RECOMMENDATION
  ------------------------------------------------------------------------------
  Optimal Index: Composite Index on (department, salary)
*/

USE general_coding_logic;

-- Statement to create the recommended composite index:
CREATE INDEX idx_emp_dept_salary ON employees (department, salary);


/*
  ------------------------------------------------------------------------------
  3. EXPLANATION OF INDEX DESIGN & COLUMN ORDERING
  ------------------------------------------------------------------------------
  
  Why a Composite Index over Single-Column Indexes?
  - A single-column index on `department` or `salary` forces the optimizer to perform 
    "Index Merge" or evaluate one index and scan table records for the second filter.
  - A composite index containing both columns allows the B-Tree index to filter 
    by both fields simultaneously in a single tree traversal pass.

  Why `department` comes FIRST and `salary` comes SECOND?
  - Rule of Index Column Ordering (Equality First, Range Second):
    1. `department` uses an EQUALITY comparison (`= 'Sales'`). Placing it first 
       allows B-Tree search to immediately isolate the contiguous block of index 
       nodes belonging to the 'Sales' department.
    2. `salary` uses a RANGE comparison (`> 50000`). Once the B-Tree locates 
       the 'Sales' block, it can perform a range scan starting at `50000` to the end 
       of that department's block.
  - If `salary` (range) were placed first, the database could not use the subsequent 
    `department` part of the index effectively due to the B-Tree Leftmost Prefix rule.

  Selectivity Factor:
  - Filtering by `department = 'Sales'` narrows down the total dataset significantly.
  - Evaluating `salary > 50000` within that pre-filtered subset minimizes row checks.

  ------------------------------------------------------------------------------
  4. BONUS: TRADE-OFFS & DRAWBACKS
  ------------------------------------------------------------------------------
  
  a) Storage Overhead:
     - Additional disk space and memory (Buffer Pool) are required to maintain the 
       separate B-Tree structure for `idx_emp_dept_salary`.

  b) Write Performance Impact (INSERT, UPDATE, DELETE):
     - Every time a row is inserted, deleted, or updated in `department` or `salary`,
       the database engine must update both the table data and the B-Tree index.

  c) Index Maintenance Overhead:
     - As tables undergo frequent modification, the index can suffer from fragmentation, 
       requiring maintenance commands like `OPTIMIZE TABLE employees;`.
*/


-- ============================================================================
-- Verification: Check Query Execution Plan using EXPLAIN
-- ============================================================================
EXPLAIN SELECT * FROM employees WHERE department = 'Sales' AND salary > 50000;