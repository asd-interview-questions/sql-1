/*
  Problem 1: Table Creation (DDL) & Dummy Data Insertion
  Target Environment: MySQL Workbench (MySQL 8.0+)
  
  Approach:
  1. Create database schema and tables (employees, sales, customers, orders, inventories).
  2. Map generic data types to MySQL equivalents (INTEGER, VARCHAR/TEXT, DECIMAL, DATE).
  3. Include primary keys and foreign key constraints (Bonus Requirement).
  4. Provide dummy INSERT statements for testing subsequent SQL problems.
*/

-- Create and use database
CREATE DATABASE IF NOT EXISTS general_coding_logic;
USE general_coding_logic;

-- Drop existing tables to ensure clean setup (order matters due to FK constraints)
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS inventories;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

-- ============================================================================
-- 1. Table Creation DDL (including Bonus Primary & Foreign Keys)
-- ============================================================================

-- Table: employees
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(255),
    department VARCHAR(255),
    salary DECIMAL(10, 2)
);

-- Table: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    city VARCHAR(255)
);

-- Table: inventories (Products)
CREATE TABLE inventories (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    price DECIMAL(10, 2) NOT NULL
);

-- Table: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Table: sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES inventories(product_id) ON DELETE CASCADE
);

-- ============================================================================
-- 2. Dummy Data Insertion Script
-- ============================================================================

-- Insert Employees
INSERT INTO employees (id, name, position, department, salary) VALUES
(1, 'Alice Smith', 'Software Engineer', 'Engineering', 85000.00),
(2, 'Bob Jones', 'Data Analyst', 'Analytics', 65000.00),
(3, 'Charlie Brown', 'Project Manager', 'Management', 95000.00),
(4, 'Diana Prince', 'Sales Lead', 'Sales', 72000.00);

-- Insert Customers
INSERT INTO customers (customer_id, customer_name, city) VALUES
(101, 'John Doe', 'New York'),
(102, 'Jane Doe', 'Los Angeles'),
(103, 'Michael Scott', 'Scranton'),
(104, 'Pam Beesly', 'Scranton');

-- Insert Inventories
INSERT INTO inventories (product_id, product_name, quantity, price) VALUES
(201, 'Laptop', 50, 1200.00),
(202, 'Smartphone', 100, 800.00),
(203, 'Headphones', 200, 150.00),
(204, 'Monitor', 75, 300.00);

-- Insert Orders
INSERT INTO orders (order_id, order_date, customer_id, total_amount) VALUES
(1, '2026-01-15', 101, 1350.00),
(2, '2026-01-18', 102, 800.00),
(3, '2026-02-01', 103, 300.00),
(4, '2026-02-10', 101, 150.00);

-- Insert Sales
INSERT INTO sales (sale_id, order_id, customer_id, product_id, quantity, sale_date) VALUES
(1, 1, 101, 201, 1, '2026-01-15'),
(2, 1, 101, 203, 1, '2026-01-15'),
(3, 2, 102, 202, 1, '2026-01-18'),
(4, 3, 103, 204, 1, '2026-02-01'),
(5, 4, 101, 203, 1, '2026-02-10');