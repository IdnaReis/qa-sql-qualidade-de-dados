-- V06 | Consistência temporal | Pedido feito antes do cadastro do cliente
SELECT p.id AS pedido_id, p.data_pedido, c.id AS cliente_id, c.data_cadastro
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id
WHERE p.data_pedido < c.data_cadastro;
