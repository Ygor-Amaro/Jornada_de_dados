-- aula 01 - Bootcamp SQL.

-- comando seleciona tudo de uma tabela, nesse exemplo tabela customers
SELECT * FROM customers;

-- para selecionar colunas especificas de uma tabala escrever o nome das colunas depois do SELECT.
SELECT contact_name, country FROM customers;

-- para selecionar valores únicos de uma tabela usar o DISTINCT com o SELECT, para contar o número de ocorrêncas únicas usar um DISTICT dentro do comando COUNT.
SELECT DISTINCT country FROM customers;
SELECT COUNT(DISTINCT country) FROM customers;

-- comando WHERE filtra as linhas da tabela

-- Seleciona todos os clientes do México
SELECT * FROM customers WHERE country='Mexico';
-- Seleciona clientes com ID específico
SELECT * FROM customers WHERE customer_id='ANATR';
-- Utiliza AND para múltiplos critérios
SELECT * FROM customers WHERE country='Germany' AND city='Berlin';
-- Utiliza OR para mais de uma cidade
SELECT * FROM customers WHERE city='Berlin' OR city='Aachen';
-- Combina AND, OR e NOT
SELECT * FROM customers WHERE country='Germany' AND (city='Berlin' OR city='Aachen');
-- Sinal de "<>" exclui clientes da Alemanha e EUA
SELECT * FROM customers WHERE country<>'Germany' AND country<>'USA';

-- comando ORDER BY organiza as linhas com base em algum parametro

-- Ordena clientes pelo país
SELECT * FROM customers ORDER BY country;
-- Ordena por país em ordem descendente
SELECT * FROM customers ORDER BY country DESC;
-- Ordena por país e nome do contato
SELECT * FROM customers ORDER BY country, contact_name;
-- Ordena por país em ordem ascendente e nome em ordem descendente
SELECT * FROM customers ORDER BY country ASC, contact_name DESC;

-- LIKE e IN comandos que filtram a tabela com base em padrões

-- Clientes com nome de contato começando por "a"
SELECT * FROM customers WHERE contact_name LIKE 'a%';
-- Clientes com nome de contato não começando por "a"
SELECT * FROM customers WHERE contact_name NOT LIKE 'a%';
-- Clientes de países específicos
SELECT * FROM customers WHERE country IN ('Germany', 'France', 'UK');
-- Clientes não localizados em 'Germany', 'France', 'UK'
SELECT * FROM customers WHERE country NOT IN ('Germany', 'France', 'UK');