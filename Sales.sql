CREATE TABLE sales (
    order_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    PRIMARY KEY (order_id, customer_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

INSERT INTO sales (order_id, customer_id, product_id, quantity, sale_date)
VALUES (1001, 101, 201, 5, '15-08-2023');

INSERT INTO sales (order_id, customer_id, product_id, quantity, sale_date)
VALUES (1002, 111, 202, 3, '15-08-2023');

INSERT INTO sales (order_id, customer_id, product_id, quantity, sale_date)
VALUES (1003, 102, 203, 2, '16-08-2023');

INSERT INTO sales (order_id, customer_id, product_id, quantity, sale_date)
VALUES (1004, 103, 204, 7, '17-08-2023');

INSERT INTO sales (order_id, customer_id, product_id, quantity, sale_date)
VALUES (1005, 104, 205, 4, '17-08-2023');
