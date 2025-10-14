SELECT u.name, u.email, o.product_name, o.amount, o.order_date FROM users u JOIN orders o ON u.id = o.user_id;
