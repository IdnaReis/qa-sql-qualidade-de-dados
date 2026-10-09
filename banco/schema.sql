-- Modelo de dados de um e-commerce fictício
DROP TABLE IF EXISTS pagamentos;
DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id            INTEGER PRIMARY KEY,
    nome          TEXT,
    email         TEXT,
    uf            TEXT,
    data_cadastro DATE
);

CREATE TABLE pedidos (
    id          INTEGER PRIMARY KEY,
    cliente_id  INTEGER,          -- sem FOREIGN KEY de propósito: simula dado vindo de outro sistema
    data_pedido DATE,
    status      TEXT,             -- 'pago', 'pendente', 'cancelado'
    valor_total REAL
);

CREATE TABLE itens_pedido (
    id             INTEGER PRIMARY KEY,
    pedido_id      INTEGER,
    produto        TEXT,
    quantidade     INTEGER,
    preco_unitario REAL
);

CREATE TABLE pagamentos (
    id             INTEGER PRIMARY KEY,
    pedido_id      INTEGER,
    metodo         TEXT,
    valor_pago     REAL,
    data_pagamento DATE
);
