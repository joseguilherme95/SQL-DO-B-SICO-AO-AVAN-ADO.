-- 1 – Gere uma tabela com o id do cliente, a cidade e o estado onde ele vive -- 
SELECT 
	customer_id as Id_Cliente, 
	customer_city as Cidade, 
	customer_state as Estado
FROM customer c;



-- 2 Gere uma tabela com o id do cliente e a cidade, somente dos clientes que vivem em Santa Catarina.  -- 
SELECT 
	customer_id as Id_Cliente, 
	customer_city as Cidade
FROM customer c 
WHERE customer_state = "SC";



-- 3 – Gere uma tabela com o id do cliente e o estado, somente dos clientes que vivem em Florianópolis -- 
SELECT 
	customer_id as Id_Cliente, 
	customer_state as Estado
FROM customer c 
WHERE customer_city = "florianopolis";



--  4 – Gere uma tabela com o estado, latitude, e longitude do estado de São Paulo -- 
SELECT 
	g.geolocation_state as Estado, 
	g.geolocation_lat as Latitude,
	g.geolocation_lng as Longitude
FROM geolocation g 
WHERE geolocation_state = 'SP';



-- 5 – Gere uma tabela com o id do produto, a data de envio e o preço, somente para produtos acima de 6300.  -- 
SELECT 
	oi.product_id as Id_Produto, 
	oi.shipping_limit_date as Data_Envio, 
	oi.price as Preço 
FROM order_items oi 
WHERE oi.price > 6300;


-- 6 – Gere uma tabela com o id do pedido, o tipo de pagamento e o numero de parcelas, somente para produtos com parcelas menores que 1. -- 
SELECT 
	op.order_id as Id_Pedido, 
	op.payment_type as Tipo_Pagamento, 
	op.payment_installments as Qtde_Parcelas
FROM order_payments op 
WHERE op.payment_installments < 1;



-- 7 Gere uma tabela com o id do pedido, id do cliente, o status do pedido e a data de aprovação, somente para comprar aprovadas até o dia 25 de dezembro de 2016. --
SELECT
o.order_id ,
o.customer_id ,
o.order_status ,
o.order_approved_at
FROM orders o
WHERE o.order_approved_at <='2016-12-25'
