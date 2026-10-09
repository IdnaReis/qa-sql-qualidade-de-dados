"""Cria o banco, roda as 10 validações SQL e gera o relatório de qualidade de dados."""
import sqlite3
from datetime import date
from pathlib import Path

RAIZ = Path(__file__).parent
PASTA_VALIDACOES = RAIZ / "sql" / "validacoes"
RELATORIO = RAIZ / "relatorios" / "relatorio-qualidade.md"


def criar_banco():
    con = sqlite3.connect(":memory:")
    for arquivo in ("schema.sql", "dados.sql"):
        con.executescript((RAIZ / "banco" / arquivo).read_text(encoding="utf-8"))
    return con


def listar_validacoes():
    return sorted(PASTA_VALIDACOES.glob("V*.sql"))


def descricao(arquivo):
    """Primeira linha do .sql: '-- V01 | Dimensão | Descrição'."""
    partes = [p.strip() for p in arquivo.read_text(encoding="utf-8").splitlines()[0].lstrip("-").split("|")]
    return partes[0], partes[1], partes[2]


def executar(con, arquivo):
    cursor = con.execute(arquivo.read_text(encoding="utf-8"))
    colunas = [c[0] for c in cursor.description]
    return colunas, cursor.fetchall()


def gerar_relatorio():
    con = criar_banco()
    linhas = [
        "# 📊 Relatório de Qualidade de Dados",
        "",
        f"Gerado em {date.today():%d/%m/%Y} por `validar.py`.",
        "",
        "| ID | Dimensão | Validação | Registros com problema | Status |",
        "|---|---|---|---|---|",
    ]
    detalhes = []
    total = 0
    for arquivo in listar_validacoes():
        vid, dimensao, texto = descricao(arquivo)
        colunas, registros = executar(con, arquivo)
        total += len(registros)
        status = "✅ OK" if not registros else "❌ Falhou"
        linhas.append(f"| {vid} | {dimensao} | {texto} | {len(registros)} | {status} |")
        if registros:
            detalhes += [f"### {vid} — {texto}", "", "| " + " | ".join(colunas) + " |",
                         "|" + "---|" * len(colunas)]
            detalhes += ["| " + " | ".join(str(v) for v in r) + " |" for r in registros]
            detalhes.append("")
    linhas += ["", f"**Total de registros com problema: {total}**", "", "## Detalhes", ""] + detalhes
    RELATORIO.write_text("\n".join(linhas), encoding="utf-8")
    print("\n".join(linhas[4:4 + 2 + len(listar_validacoes())]))
    print(f"\nRelatório salvo em {RELATORIO.relative_to(RAIZ)}")


if __name__ == "__main__":
    gerar_relatorio()
