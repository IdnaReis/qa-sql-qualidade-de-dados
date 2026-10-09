-- V05 | Integridade referencial | Pedidos de clientes que não existem
SELECT p.id AS pedido_id, p.cliente_id
FROM pedidos p
LEFT JOIN clientes c ON c.id = p.cliente_id
WHERE c.id IS NULL;
