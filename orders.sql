CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    total_amount NUMERIC,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Set the session date format
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

INSERT INTO orders (order_id, order_date, customer_id, total_amount)
VALUES (1001, '01-08-2023', 101, 500.00);

INSERT INTO orders (order_id, order_date, customer_id, total_amount)
VALUES (1002, '05-08-2023', 103, 750.00);

INSERT INTO orders (order_id, order_date, customer_id, total_amount)
VALUES (1003, '10-08-2023', 102, 300.00);

INSERT INTO orders (order_id, order_date, customer_id, total_amount)
VALUES (1004, '15-08-2023', 104, 1000.00);

INSERT INTO orders (order_id, order_date, customer_id, total_amount)
VALUES (1005, '20-08-2023', 111, 450.00);

