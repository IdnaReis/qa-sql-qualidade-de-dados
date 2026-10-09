-- V07 | Consistência | Valor total do pedido diferente da soma dos itens
SELECT p.id AS pedido_id,
       p.valor_total,
       ROUND(SUM(i.quantidade * i.preco_unitario), 2) AS soma_itens
FROM pedidos p
JOIN itens_pedido i ON i.pedido_id = p.id
GROUP BY p.id
HAVING ABS(p.valor_total - SUM(i.quantidade * i.preco_unitario)) > 0.01;
