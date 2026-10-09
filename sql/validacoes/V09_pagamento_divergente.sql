-- V09 | Regra de negócio | Pedido "pago" sem pagamento ou com valor pago diferente do total
SELECT p.id AS pedido_id, p.valor_total, pg.valor_pago,
       CASE WHEN pg.id IS NULL THEN 'sem pagamento' ELSE 'valor divergente' END AS problema
FROM pedidos p
LEFT JOIN pagamentos pg ON pg.pedido_id = p.id
WHERE p.status = 'pago'
  AND (pg.id IS NULL OR ABS(pg.valor_pago - p.valor_total) > 0.01);
