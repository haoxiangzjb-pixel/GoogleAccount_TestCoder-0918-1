-- Mock data for orders table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orders (id, user_id, product_name, amount, order_date) VALUES
(101, 1, 'Laptop', 1200.00, '2023-10-01'),
(102, 2, 'Book', 15.99, '2023-10-02'),
(103, 1, 'Mouse', 25.00, '2023-10-03'),
(104, 3, 'Keyboard', 75.50, '2023-10-04');