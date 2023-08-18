CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(20),
    city VARCHAR(15),
    PRIMARY KEY (customer_id)
);
INSERT INTO customers (customer_id, customer_name, city)
VALUES (101, 'John Smith', 'New York');

INSERT INTO customers (customer_id, customer_name, city)
VALUES (102, 'Emily Johnson', 'Los Angeles');

INSERT INTO customers (customer_id, customer_name, city)
VALUES (103, 'David Brown', 'Chicago');

INSERT INTO customers (customer_id, customer_name, city)
VALUES (104, 'Sarah Williams', 'Houston');

INSERT INTO customers (customer_id, customer_name, city)
VALUES (111, 'Michael Davis', 'Miami');
