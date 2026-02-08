-- 1. Cria um relatório para todos os pedidos de 1996 e seus clientes (152 linhas)
SELECT o.order_date, c.contact_name FROM orders AS o
INNER JOIN customers AS c ON o.customer_id = c.customer_id
WHERE EXTRACT (YEAR FROM o.order_date) = 1996;

-- 2. Cria um relatório que mostra o número de funcionários e clientes de cada cidade que tem funcionários (5 linhas)
SELECT e.city,
	COUNT(DISTINCT e.employee_id) AS quantidade_funcionarios,
	COUNT(DISTINCT c.customer_id) AS quantidade_clientes
FROM employees AS e 
LEFT JOIN customers AS c ON e.city = c.city
GROUP BY e.city
ORDER BY e.city;

-- 3. Cria um relatório que mostra o número de funcionários e clientes de cada cidade que tem clientes (69 linhas)
SELECT c.city,
	COUNT(DISTINCT e.employee_id) AS quantidade_funcionarios,
	COUNT(DISTINCT c.customer_id) AS quantidade_clientes
FROM employees AS e 
RIGHT JOIN customers AS c ON e.city = c.city
GROUP BY c.city
ORDER BY c.city;

-- 4.Cria um relatório que mostra o número de funcionários e clientes de cada cidade (71 linhas)
SELECT
	COALESCE(e.city, c.city) AS cidade,
	COUNT(DISTINCT e.employee_id) AS numero_de_funcionarios,
	COUNT(DISTINCT c.customer_id) AS numero_de_clientes
FROM employees e 
FULL JOIN customers c ON e.city = c.city
GROUP BY e.city, c.city
ORDER BY cidade;

-- 5. Cria um relatório que mostra a quantidade total de produtos encomendados.
-- Mostra apenas registros para produtos para os quais a quantidade encomendada é menor que 200 (5 linhas)
SELECT o.product_id, p.product_name, SUM(o.quantity) AS quantidade_total
FROM order_details o
JOIN products p ON p.product_id = o.product_id
GROUP BY o.product_id, p.product_name
HAVING SUM(o.quantity) < 200
ORDER BY quantidade_total DESC;

-- 6. Cria um relatório que mostra o total de pedidos por cliente desde 31 de dezembro de 1996.
-- O relatório deve retornar apenas linhas para as quais o total de pedidos é maior que 15 (5 linhas)
SELECT customer_id, COUNT(order_id) AS total_de_pedidos
FROM orders
WHERE order_date > '1996-12-31'
GROUP BY customer_id
HAVING COUNT(order_id) > 15
ORDER BY total_de_pedidos;