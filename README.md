# 🗄️ Qualidade de Dados com SQL

<!-- COLE AQUI OS SELOS QUE JÁ EXISTEM NO README ATUAL (SQL, SQLite, Python, Pytest e Actions) -->

Projeto de **QA de Dados**: 10 validações em SQL que encontram problemas de qualidade na base de um e-commerce fictício, com testes automatizados em Pytest, relatório gerado automaticamente e CI no GitHub Actions.

Une minha experiência de mais de 6 anos em **validação de dados, análise de crédito e prevenção a fraudes** com a prática de QA.

> A base de dados é fictícia e foi criada com problemas inseridos de propósito, para que cada validação tenha algo real a encontrar.

## 🔎 Validações

| ID | Dimensão | O que verifica | Problemas encontrados |
|----|----------|----------------|-----------------------|
| V01 | Completude | Clientes sem e-mail | 1 |
| V02 | Unicidade | E-mail usado por mais de um cliente | 1 |
| V03 | Validade | E-mail sem "@" ou sem domínio | 2 |
| V04 | Validade | UF fora da lista oficial | 2 |
| V05 | Integridade referencial | Pedido de cliente inexistente | 1 |
| V06 | Consistência temporal | Pedido antes do cadastro do cliente | 1 |
| V07 | Consistência | Total do pedido ≠ soma dos itens | 2 |
| V08 | Validade | Item com quantidade ou preço ≤ 0 | 2 |
| V09 | Regra de negócio | Pedido "pago" sem pagamento ou com valor divergente | 2 |
| V10 | Validade | Pedido com data no futuro | 1 |

No total, as 10 validações encontram **15 problemas** na base. As consultas estão na pasta [`sql/validacoes/`](sql/validacoes/).

## 🧠 Técnicas de SQL usadas

- `LEFT JOIN ... IS NULL` (registros órfãos)
- `GROUP BY` + `HAVING` (duplicidade e somas)
- `LIKE` e `INSTR` (formato)
- `NOT IN` (domínio de valores)
- `CASE WHEN` (classificação do problema)
- Comparação de datas
- `ABS()` com tolerância para valores decimais

## 🧪 Testes

Cada validação tem um teste que confere se ela encontra **exatamente** os problemas inseridos na base. Um teste extra insere um registro correto e garante que nenhuma validação acusa **falso positivo**.

## ▶️ Como executar

Não precisa instalar banco de dados: o SQLite já vem com o Python.

```bash
pip install -r requirements.txt
python validar.py      # gera relatorios/relatorio-qualidade.md
python -m pytest -v    # roda os testes
```

O relatório é gerado em `relatorios/relatorio-qualidade.md`. Os testes também rodam automaticamente no GitHub Actions a cada envio de código.

## 📂 Estrutura

```
qa-sql-qualidade-de-dados/
├── banco/schema.sql           # Criação das tabelas
├── banco/dados.sql            # Dados fictícios com problemas inseridos
├── sql/validacoes/            # 10 consultas de validação (V01 a V10)
├── tests/                     # Testes Pytest das validações
├── relatorios/                # Relatório gerado pelo validar.py
├── docs/modelo-de-dados.md    # Tabelas e dimensões de qualidade
├── validar.py                 # Executa as validações e gera o relatório
└── .github/workflows/         # CI no GitHub Actions
```

Veja também o [modelo de dados](docs/modelo-de-dados.md), com as tabelas e as dimensões de qualidade usadas.

## 👩‍💻 Autora

**Idna Reis**, QA Júnior em transição de carreira, com mais de 6 anos de experiência anterior em validação de dados, análise de crédito e prevenção a fraudes.

- LinkedIn: [linkedin.com/in/idna-reis](https://www.linkedin.com/in/idna-reis)
- GitHub: [github.com/IdnaReis](https://github.com/IdnaReis)
