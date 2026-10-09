-- V10 | Validade | Pedidos com data no futuro
SELECT id AS pedido_id, data_pedido
FROM pedidos
WHERE data_pedido > DATE('now');
