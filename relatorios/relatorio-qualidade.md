# 📊 Relatório de Qualidade de Dados

Gerado em 09/10/2026 por `validar.py`.

| ID | Dimensão | Validação | Registros com problema | Status |
|---|---|---|---|---|
| V01 | Completude | Clientes sem e-mail | 1 | ❌ Falhou |
| V02 | Unicidade | E-mails usados por mais de um cliente | 1 | ❌ Falhou |
| V03 | Validade | E-mails sem "@" ou sem domínio com ponto | 2 | ❌ Falhou |
| V04 | Validade | UF fora da lista oficial (considera maiúsculas) | 2 | ❌ Falhou |
| V05 | Integridade referencial | Pedidos de clientes que não existem | 1 | ❌ Falhou |
| V06 | Consistência temporal | Pedido feito antes do cadastro do cliente | 1 | ❌ Falhou |
| V07 | Consistência | Valor total do pedido diferente da soma dos itens | 2 | ❌ Falhou |
| V08 | Validade | Itens com quantidade ou preço menor ou igual a zero | 2 | ❌ Falhou |
| V09 | Regra de negócio | Pedido "pago" sem pagamento ou com valor pago diferente do total | 2 | ❌ Falhou |
| V10 | Validade | Pedidos com data no futuro | 1 | ❌ Falhou |

**Total de registros com problema: 15**

## Detalhes

### V01 — Clientes sem e-mail

| id | nome |
|---|---|
| 3 | Carla Souza |

### V02 — E-mails usados por mais de um cliente

| email | qtd_clientes | ids |
|---|---|---|
| ana.silva@email.com | 2 | 1,5 |

### V03 — E-mails sem "@" ou sem domínio com ponto

| id | nome | email |
|---|---|---|
| 6 | Fábio Alves | fabio.alves#email.com |
| 7 | Gabi Martins | gabi.martins@email |

### V04 — UF fora da lista oficial (considera maiúsculas)

| id | nome | uf |
|---|---|---|
| 8 | Hugo Pereira | XX |
| 9 | Isis Barros | go |

### V05 — Pedidos de clientes que não existem

| pedido_id | cliente_id |
|---|---|
| 104 | 99 |

### V06 — Pedido feito antes do cadastro do cliente

| pedido_id | data_pedido | cliente_id | data_cadastro |
|---|---|---|---|
| 105 | 2026-03-20 | 10 | 2026-04-15 |

### V07 — Valor total do pedido diferente da soma dos itens

| pedido_id | valor_total | soma_itens |
|---|---|---|
| 102 | 49.9 | 47.9 |
| 103 | 120.0 | 100.0 |

### V08 — Itens com quantidade ou preço menor ou igual a zero

| id | pedido_id | produto | quantidade | preco_unitario |
|---|---|---|---|---|
| 10 | 110 | Adesivo | 0 | 5.0 |
| 11 | 102 | Brinde | 1 | -2.0 |

### V09 — Pedido "pago" sem pagamento ou com valor pago diferente do total

| pedido_id | valor_total | valor_pago | problema |
|---|---|---|---|
| 106 | 89.7 | None | sem pagamento |
| 107 | 59.9 | 55.0 | valor divergente |

### V10 — Pedidos com data no futuro

| pedido_id | data_pedido |
|---|---|
| 108 | 2030-01-01 |
