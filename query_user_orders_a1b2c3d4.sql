-- SQL查询：连接用户表和订单表
-- 假设用户表为 users，订单表为 orders
-- 假设连接字段为 user_id

SELECT 
    users.user_id,
    users.username,
    users.email,
    orders.order_id,
    orders.order_date,
    orders.total_amount
FROM 
    users
INNER JOIN 
    orders 
ON 
    users.user_id = orders.user_id;