CREATE TABLE inventories (
    product_id INT,
    product_name VARCHAR(10),
    quantity INT,
    price numeric,
    PRIMARY KEY (product_id)
);
INSERT INTO inventories (product_id, product_name, quantity, price)
VALUES (201, 'Product A', 100, 10.99);

INSERT INTO inventories (product_id, product_name, quantity, price)
VALUES (202, 'Product B', 50, 25.99);

INSERT INTO inventories (product_id, product_name, quantity, price)
VALUES (203, 'Product C', 200, 5.99);

INSERT INTO inventories (product_id, product_name, quantity, price)
VALUES (204, 'Product D', 75, 15.49);

INSERT INTO inventories (product_id, product_name, quantity, price)
VALUES (205, 'Product E', 300, 8.99);
