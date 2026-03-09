-- 1 --

-- SELECT * FROM categories;

-- SELECT * FROM brands;

-- SELECT * FROM products WHERE model_year = 2018;

-- SELECT first_name, last_name, email FROM customers WHERE city = 'New York';

-- 2 --

-- SELECT category_id, COUNT(*) AS product_count FROM products GROUP BY category_id;

-- SELECT AVG(list_price) AS average_price FROM products;

-- SELECT customer_id, COUNT(*) AS total_orders FROM orders GROUP BY customer_id;

-- SELECT COUNT(*) AS total_orders FROM orders;

-- SELECT SUM(list_price) AS total_list_prices FROM order_items;

-- 3 --

SELECT order_items.order_id,
   products.product_name,
   order_items.quantity,
   order_items.list_price,
   order_items.discount
FROM order_items
JOIN products ON order_items.product_id = products.product_id;


SELECT DISTINCT 
    c.first_name,
    c.last_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
WHERE cat.category_name = 'Mountain Bikes';

SELECT 
    s.staff_id,
    s.first_name,
    s.last_name,
    SUM(oi.quantity) AS total_bicycles_sold
FROM staffs s
JOIN orders o 
    ON s.staff_id = o.staff_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY total_bicycles_sold DESC;

SELECT 
    s.staff_id,
    s.first_name,
    s.last_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS revenue
FROM staffs s
JOIN orders o 
    ON s.staff_id = o.staff_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
WHERE o.order_status = 4
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY revenue DESC;

SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
JOIN orders o 
    ON oi.order_id = o.order_id
WHERE o.order_status = 4
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 5;