-- 1. Qual o número de clientes únicos de todos os estados 

SELECT 
	COUNT(DISTINCT c.customer_id) as Qtde_Cliente,
	c.customer_state as Estado
FROM customer c 
GROUP BY c.customer_state 



-- 2. Qual o número de cidades únicas de todos os estados?

SELECT 
	COUNT(DISTINCT c.customer_city) as Qtde_Cidades,
	c.customer_state as Estado
FROM customer c 
GROUP BY c.customer_state

--3. Qual o número de clientes únicos por estado e por cidade?

SELECT 
	COUNT(DISTINCT c.customer_id) AS Clientes,
	c.customer_state AS Estado, 
	c.customer_city as Cidade 
FROM customer c 
GROUP BY c.customer_state , c.customer_city 



-- 4. Qual o número de clientes únicos por cidade e por estado?

SELECT 
	COUNT(DISTINCT c.customer_id) as Cliente,
	c.customer_city as Cidade, 
	c.customer_state as Estado
FROM customer c
GROUP BY c.customer_city, c.customer_state 


-- 5. Qual o número total de pedidos únicos acima de R$3.500 por cada vendedor?
SELECT
	oi.seller_id as Vendedor,
	COUNT(DISTINCT oi.order_id) as Qtde_Pedidos_Unicos
FROM order_items oi 
WHERE oi.price > 3500
GROUP BY oi.seller_id 



-- 6. Qual o número total de pedidos únicos, a data mínima e máxima de envio, o valor máximo, mínimo e médio do frete dos pedidos acima de R$ 1.100 por cada vendedor ?

SELECT 
	oi.seller_id as Vendedor,
	COUNT(DISTINCT oi.order_id ) as Pedido, 
	MIN(oi.shipping_limit_date) as Data_Minima_envio,
	MAX(oi.shipping_limit_date) as Data_Max_Envio, 
	MIN(oi.price) as Preço_Minimo, 
	MAX(oi.price) as Preço_Maximo,
	AVG(oi.freight_value) as Media_Frete
FROM order_items oi
WHERE oi.price > 1100
GROUP BY oi.seller_id 



-- 7. Qual o valor médio, máximo e mínimo do preço de todos os pedidos de cada produto?

SELECT 
	oi.product_id,
	AVG(oi.price) as Media_Preço, 
	MAX(oi.price) as Preço_Maximo, 
	MIN(oi.price) as Preço_Minimo
FROM order_items oi 
GROUP BY oi.product_id 



-- 8. Qual a quantidade de vendedores distintos que receberam algum pedido antes do dia 23 de setembro de 2016 e qual foi o preço médio desses pedidos?

SELECT 
	oi.seller_id as Vendedor,
	COUNT(DISTINCT oi.seller_id) as Qtde,
	AVG(oi.price) as Preço_Médio
FROM order_items oi 
WHERE oi.shipping_limit_date < '2016-09-23 00:00:00'
GROUP BY oi.shipping_limit_date 



-- 9. Qual a quantidade de pedidos por tipo de pagamentos?

SELECT 
	op.payment_type as Tipo_Pagamento,
	COUNT(op.order_id) as Qtde_de_Pedido
FROM order_payments op
GROUP BY op.payment_type



--  10. Qual a quantidade de pedidos, a média do valor do pagamento e o número máximo de parcelas por tipo de pagamentos?

SELECT 
	op.payment_type as Tipo_Pagamento,
	COUNT(op.order_id) as Qtde_Pedidos,
	AVG(op.payment_value) as Média_Valor,
	MAX(op.payment_sequential) as Qtde_Max_Parcelas
FROM order_payments op 
GROUP BY op.payment_type 



-- 11. Qual a valor mínimo, máximo, médio e as soma total paga por cada tipo de pagamento e número de parcelas disponíveis?

SELECT 
	payment_type, payment_sequential,
	MIN(op.payment_value) as Valor_Minimo,
	MAX(op.payment_value) as Valor_Maximo, 
	AVG(op.payment_value) as Valor_Medio, 
	SUM(op.payment_value) as Soma_Total
FROM order_payments op
GROUP BY op.payment_type, op.payment_sequential 



-- 12. Qual a média de pedidos por cliente?

SELECT 
	o.customer_id as Cliente,
	AVG(o.order_id) as Media_Pedidos
FROM orders o 
GROUP BY o.customer_id 



-- 13. Qual a quantidade de pedidos por status?

SELECT 
	o.order_status as Status, 
	COUNT(order_id) 
FROM orders o 
GROUP BY o.order_status 



-- 14. Qual a quantidade de pedidos realizados por dia, a partir do dia 23 de Setembro de 2016?
-- Sempre ter cuidado ao trabalhar com data.

SELECT 
	DATE(o.order_approved_at) as Data_do_Pedido, 
	COUNT(o.order_id) as Qtde_Pedidos
FROM orders o 
WHERE o.order_approved_at > '2016-09-23'
GROUP BY DATE(o.order_approved_at)



-- 15. Quantos produtos estão cadastrados na empresa por categoria?

SELECT 
	COUNT(DISTINCT (p.product_id)) as Qtde_Produtos,
	p.product_category_name as Categoria
FROM products p 
GROUP BY p.product_category_name
