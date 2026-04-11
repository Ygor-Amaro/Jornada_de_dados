-- Focus on Window Functions (The Magic Glass).
/*4 - Cumulative Revenue
Show each order's freight cost and a running total of freight paid by that specific customer.
SUM(freight) OVER (PARTITION BY customer_id ORDER BY order_date).*/

SELECT
    customer_id,
    order_date,
    freight,
    ROUND(
        SUM(freight) OVER (PARTITION BY customer_id ORDER BY order_date)::numeric, 
        2
    ) AS running_total_freight
FROM orders
ORDER BY customer_id, order_date;

/*5 - The Price Gap
Show each product, its price, and the average price of its category in the same row.
AVG(unit_price) OVER (PARTITION BY category_id).*/

SELECT 
	product_name,
	category_id,
	unit_price,
	ROUND(AVG(unit_price) OVER (PARTITION BY category_id)::numeric,2) AS avg_price_by_category
FROM products
ORDER BY avg_price_by_category DESC;

/*6 - The VIP Filter
Identify the Top 3 most expensive products within each Category.
DENSE_RANK() OVER (PARTITION BY category_id ORDER BY unit_price DESC).*/

WITH ranked_products AS (
    SELECT 
        product_name,
        unit_price,
        category_id,
        DENSE_RANK() OVER (PARTITION BY category_id ORDER BY unit_price DESC) AS price_rank
    FROM products
)
SELECT * FROM ranked_products
WHERE price_rank <= 3 
ORDER BY category_id, price_rank;

-- Advanced "Engineer" Level (Mixing Concepts).
/*7 - The Top Salesperson
For each year, find the Employee who handled the most orders.
You need to GROUP BY first, then RANK() over the result.*/



/*8 - The Last Order Logic
Show every customer and the Date of their most recent order without using MAX().
Use ROW_NUMBER() to find the "latest" version of a record—a classic data cleaning task.*/

