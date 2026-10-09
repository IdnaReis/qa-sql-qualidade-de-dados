-- V08 | Validade | Itens com quantidade ou preço menor ou igual a zero
SELECT id, pedido_id, produto, quantidade, preco_unitario
FROM itens_pedido
WHERE quantidade <= 0 OR preco_unitario <= 0;
