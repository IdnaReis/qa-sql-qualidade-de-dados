"""Garante que cada validação SQL encontra exatamente os problemas inseridos na base."""
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parents[1]))
from validar import PASTA_VALIDACOES, criar_banco, executar  # noqa: E402

# Problemas inseridos de propósito em banco/dados.sql
ESPERADO = {
    "V01_email_nulo.sql": 1,
    "V02_email_duplicado.sql": 1,
    "V03_email_formato.sql": 2,
    "V04_uf_invalida.sql": 2,
    "V05_pedido_sem_cliente.sql": 1,
    "V06_pedido_antes_do_cadastro.sql": 1,
    "V07_total_diferente_dos_itens.sql": 2,
    "V08_item_quantidade_preco.sql": 2,
    "V09_pagamento_divergente.sql": 2,
    "V10_data_futura.sql": 1,
}


@pytest.fixture(scope="module")
def con():
    conexao = criar_banco()
    yield conexao
    conexao.close()


@pytest.mark.parametrize("arquivo, quantidade", ESPERADO.items())
def test_validacao_encontra_os_problemas(con, arquivo, quantidade):
    _, registros = executar(con, PASTA_VALIDACOES / arquivo)
    assert len(registros) == quantidade, registros


def test_todas_as_validacoes_tem_quantidade_esperada():
    arquivos = {a.name for a in PASTA_VALIDACOES.glob("V*.sql")}
    assert arquivos == set(ESPERADO)


def test_base_limpa_nao_gera_falso_positivo():
    """Um registro correto não pode aparecer em nenhuma validação."""
    con = criar_banco()
    con.executescript("""
        INSERT INTO clientes VALUES (50, 'Cliente OK', 'ok@email.com', 'GO', '2026-01-01');
        INSERT INTO pedidos VALUES (500, 50, '2026-01-05', 'pago', 20.00);
        INSERT INTO itens_pedido VALUES (500, 500, 'Caneca', 2, 10.00);
        INSERT INTO pagamentos VALUES (500, 500, 'pix', 20.00, '2026-01-05');
    """)
    for arquivo in PASTA_VALIDACOES.glob("V*.sql"):
        _, registros = executar(con, arquivo)
        assert all(50 not in r and 500 not in r for r in registros), (arquivo.name, registros)
