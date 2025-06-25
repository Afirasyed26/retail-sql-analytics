USE retail_data_warehouse;

SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount / 100)), 2) AS total_revenue
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    order_month
ORDER BY 
    order_month;
SELECT 
    c.customer_name,
    c.region,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount / 100)), 2) AS total_spent
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    c.customer_name, c.region
ORDER BY 
    total_spent DESC
LIMIT 5;
UPDATE inventory 
SET stock_level = 10 
WHERE product_id = 101;

SELECT 
    p.product_name,
    i.stock_level,
    i.reorder_level
FROM 
    inventory i
JOIN 
    products p ON i.product_id = p.product_id
WHERE 
    i.stock_level < i.reorder_level;
SELECT 
    c.region,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount / 100)), 2) AS total_revenue
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    c.region
ORDER BY 
    total_revenue DESC;
SELECT 
    e.employee_name,
    e.region,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount / 100)), 2) AS total_revenue
FROM 
    employees e
JOIN 
    orders o ON e.employee_id = o.employee_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    e.employee_name, e.region
ORDER BY 
    total_revenue DESC;
