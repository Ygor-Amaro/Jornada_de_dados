-- Section 1: Focus on JOINs (The Bridge).
-- 1 - The Ghost Customers: List all Customers who have never placed an order.

-- most performatic query.
SELECT 
    c.contact_name
FROM customers as c
LEFT JOIN orders as o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--
SELECT 
    c.contact_name,
    count(o.order_id) as orders_by_customer
FROM customers as c
LEFT JOIN orders as o ON c.customer_id = o.customer_id
GROUP BY c.contact_name
HAVING count(o.order_id) = 0
ORDER BY orders_by_customer;

--
WITH customer_counts AS (
    SELECT 
        c.contact_name,
        COUNT(o.order_id) AS orders_by_customer
    FROM customers AS c
    LEFT JOIN orders AS o ON c.customer_id = o.customer_id
    GROUP BY c.contact_name
)
SELECT * FROM customer_counts 
WHERE orders_by_customer = 0;

-- 2 - The Management TreeShow the name of every Employee and the name of their Manager.

SELECT 
	m.first_name AS manager,
	e.first_name AS employee,
	e.title AS job_role
FROM employees AS e
LEFT JOIN employees AS m ON e.reports_to = m.employee_id
ORDER BY manager

-- 3 - The Revenue ReporterFind the total revenue (Price × Quantity) per Category in the year 1997.categories, products, order_details, orders.

WITH revenue_per_product AS (
    SELECT 
        d.product_id,
        SUM(d.unit_price * d.quantity) AS total_revenue
    FROM order_details d
    INNER JOIN orders o ON d.order_id = o.order_id
    WHERE o.order_date >= '1997-01-01' AND o.order_date < '1998-01-01'
    GROUP BY d.product_id
),
category_mapping AS (
    SELECT 
        p.product_id,
        c.category_name
    FROM products p
    INNER JOIN categories c ON p.category_id = c.category_id
)
SELECT 
    m.category_name,
    SUM(r.total_revenue) AS category_revenue
FROM category_mapping AS m
INNER JOIN revenue_per_product AS r ON m.product_id = r.product_id
GROUP BY m.category_name
ORDER BY category_revenue DESC;

-- Section 2: Focus on Window Functions (The Magic Glass).
-- 4 - Cumulative RevenueShow each order's freight cost and a running total of freight paid by that specific customer.SUM(freight) OVER (PARTITION BY customer_id ORDER BY order_date).
-- 5 - The Price GapShow each product, its price, and the average price of its category in the same row.AVG(unit_price) OVER (PARTITION BY category_id).
-- 6 - The VIP FilterIdentify the Top 3 most expensive products within each Category.DENSE_RANK() OVER (PARTITION BY category_id ORDER BY unit_price DESC).
 
-- Section 3: Advanced "Engineer" Level (Mixing Concepts).
-- 7 - The Top SalespersonFor each year, find the Employee who handled the most orders.You need to GROUP BY first, then RANK() over the result.
-- 8 - The Last Order LogicShow every customer and the Date of their most recent order without using MAX().Use ROW_NUMBER() to find the "latest" version of a record—a classic data cleaning task.