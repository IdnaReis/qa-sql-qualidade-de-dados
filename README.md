# 🗄️ Qualidade de Dados com SQL

![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pytest](https://img.shields.io/badge/Pytest-0A9EDC?style=for-the-badge&logo=pytest&logoColor=white)
[![Validações](https://github.com/IdnaReis/qa-sql-qualidade-de-dados/actions/workflows/testes.yml/badge.svg?branch=main)](https://github.com/IdnaReis/qa-sql-qualidade-de-dados/actions/workflows/testes.yml)

Projeto de **QA de Dados**: 10 validações em SQL que encontram problemas de qualidade na base de um e-commerce fictício, com testes automatizados em Pytest, relatório gerado automaticamente e CI no GitHub Actions.

Une minha experiência de mais de 6 anos em **validação de dados, análise de crédito e prevenção a fraudes** com a prática de QA.

## 🔎 Validações

| ID | Dimensão | O que verifica | Problemas encontrados |
|---|---|---|---|
| [V01](sql/validacoes/V01_email_nulo.sql) | Completude | Clientes sem e-mail | 1 |
| [V02](sql/validacoes/V02_email_duplicado.sql) | Unicidade | E-mail usado por mais de um cliente | 1 |
| [V03](sql/validacoes/V03_email_formato.sql) | Validade | E-mail sem "@" ou sem domínio | 2 |
| [V04](sql/validacoes/V04_uf_invalida.sql) | Validade | UF fora da lista oficial | 2 |
| [V05](sql/validacoes/V05_pedido_sem_cliente.sql) | Integridade referencial | Pedido de cliente inexistente | 1 |
| [V06](sql/validacoes/V06_pedido_antes_do_cadastro.sql) | Consistência temporal | Pedido antes do cadastro do cliente | 1 |
| [V07](sql/validacoes/V07_total_diferente_dos_itens.sql) | Consistência | Total do pedido ≠ soma dos itens | 2 |
| [V08](sql/validacoes/V08_item_quantidade_preco.sql) | Validade | Item com quantidade ou preço ≤ 0 | 2 |
| [V09](sql/validacoes/V09_pagamento_divergente.sql) | Regra de negócio | Pedido "pago" sem pagamento ou com valor divergente | 2 |
| [V10](sql/validacoes/V10_data_futura.sql) | Validade | Pedido com data no futuro | 1 |

**Total: 15 registros com problema.** Detalhes em [relatório de qualidade](relatorios/relatorio-qualidade.md).

## 🧠 Técnicas de SQL usadas

`LEFT JOIN ... IS NULL` (registros órfãos) · `GROUP BY` + `HAVING` (duplicidade e somas) · `LIKE` e `INSTR` (formato) · `NOT IN` (domínio de valores) · `CASE WHEN` (classificação do problema) · comparação de datas · `ABS()` com tolerância para valores decimais.

## 🧪 Testes

Cada validação tem um teste que confere se ela encontra **exatamente** os problemas inseridos na base. Um teste extra insere um registro correto e garante que nenhuma validação acusa **falso positivo**.

## ▶️ Como executar

Não precisa instalar banco de dados: o SQLite já vem com o Python.

```bash
pip install -r requirements.txt
python validar.py      # gera relatorios/relatorio-qualidade.md
python -m pytest -v    # roda os testes
```

## 📂 Estrutura

```
qa-sql-qualidade-de-dados/
├── banco/schema.sql            # Criação das tabelas
├── banco/dados.sql             # Dados fictícios com problemas inseridos
├── sql/validacoes/             # 10 consultas de validação (V01 a V10)
├── tests/                      # Testes Pytest das validações
├── relatorios/                 # Relatório gerado pelo validar.py
├── docs/modelo-de-dados.md     # Tabelas e dimensões de qualidade
├── validar.py                  # Executa as validações e gera o relatório
└── .github/workflows/          # CI no GitHub Actions
```

## 👩‍💻 Autora

**Idna Reis**

QA Júnior | Testes Manuais e Automação

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/idna-reis)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/IdnaReis)
