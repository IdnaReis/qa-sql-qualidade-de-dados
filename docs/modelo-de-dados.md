# 🗂️ Modelo de Dados

E-commerce fictício com 4 tabelas.

```
clientes (1) ──< pedidos (1) ──< itens_pedido
                     │
                     └──< pagamentos
```

| Tabela | Campos principais | Observação |
|---|---|---|
| `clientes` | id, nome, email, uf, data_cadastro | Cadastro dos compradores |
| `pedidos` | id, cliente_id, data_pedido, status, valor_total | Status: pago, pendente, cancelado |
| `itens_pedido` | id, pedido_id, produto, quantidade, preco_unitario | Itens de cada pedido |
| `pagamentos` | id, pedido_id, metodo, valor_pago, data_pagamento | Pix, cartão ou boleto |

As tabelas **não têm chave estrangeira** de propósito: simulam dados que chegam de sistemas diferentes, situação comum em integrações, onde a qualidade precisa ser validada depois da carga.

## Dimensões de qualidade avaliadas

| Dimensão | Pergunta | Validações |
|---|---|---|
| Completude | O dado obrigatório está preenchido? | V01 |
| Unicidade | Existe registro repetido? | V02 |
| Validade | O valor segue o formato e as regras do domínio? | V03, V04, V08, V10 |
| Integridade referencial | O registro relacionado existe? | V05 |
| Consistência | Os dados batem entre tabelas e no tempo? | V06, V07 |
| Regra de negócio | O processo foi cumprido? | V09 |
