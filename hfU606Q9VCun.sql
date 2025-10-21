SELECT u.id, u.name, u.email, o.id AS order_id, o.order_date, o.total_amount
FROM users u
JOIN orders o ON u.id = o.user_id;
