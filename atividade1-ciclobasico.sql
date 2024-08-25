-- 1 – Gere uma tabela com o id do cliente, a cidade e o estado onde ele vive -- 

SELECT 
	c.customer_id as Id_Cliente,
	c.customer_city as Cidade_Cliente, 
	c.customer_state as Estado_Cliente
FROM customer c 



-- 2 – Gere uma tabela com o id do cliente e a cidade, somente dos clientes que vivem em Santa Catarina.  -- 

SELECT 
	c.customer_id as Id_Cliente, 
	c.customer_city as Cidade_Cliente
FROM customer c 
WHERE c.customer_state = 'SC'



-- 3 – Gere uma tabela com o id do cliente e o estado, somente dos clientes que vivem em Florianópolis -- 

SELECT 
	c.customer_id as Id_cliente,
	c.customer_state as Estado_Cliente
FROM customer c 
WHERE c.customer_city = 'florianopolis'



-- 4 – Gere uma tabela com o estado, latitude, e longitude do estado de São Paulo -- 

SELECT
	g.geolocation_state as Estado,
	g.geolocation_lat as Latitude,
	g.geolocation_lng as Longitude
FROM geolocation g 
WHERE g.geolocation_state = 'SP'



-- 5 – Gere uma tabela com o id do produto, a data de envio e o preço, somente para produtos acima de 6300.  -- 

SELECT 
	oi.product_id as Id_Produto, 
	oi.shipping_limit_date as Data_envio, 
	oi.price as Preço
FROM order_items oi 
WHERE oi.price > 6300



-- 6 – Gere uma tabela com o id do pedido, o tipo de pagamento e o numero de parcelas, somente para produtos com parcelas menores que 1. -- 

SELECT 
	op.order_id as Id_Pedido, 
	op.payment_type as Tipo_Pagamento,
	op.payment_installments
FROM order_payments op 
WHERE payment_installments < 1



-- 7 Gere uma tabela com o id do pedido, id do cliente, o status do pedido e a data de aprovação, somente para comprar aprovadas até o dia 05 de outubro de 2016. -- 

SELECT 
	o.order_id as Id_Pedido, 
	o.customer_id as Id_Cliente, 
	o.order_status as Status,
	o.order_approved_at as Data_Aprovacao
FROM orders o 
WHERE o.order_approved_at <= '2016-10-05'



