-- SQL Query to join Users and Orders tables
-- This query joins the users table with the orders table based on the user_id foreign key

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    o.id AS order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
ORDER BY u.id, o.order_date DESC;

-- Alternative query with INNER JOIN (only users who have orders)
/*
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    o.id AS order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM users u
INNER JOIN orders o ON u.id = o.user_id
ORDER BY u.id, o.order_date DESC;
*/