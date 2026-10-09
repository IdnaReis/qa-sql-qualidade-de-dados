-- Dados fictícios com PROBLEMAS DE QUALIDADE inseridos de propósito.
-- Cada problema está marcado com o número da validação que deve encontrá-lo (V01 a V10).

INSERT INTO clientes (id, nome, email, uf, data_cadastro) VALUES
(1,  'Ana Silva',       'ana.silva@email.com',    'GO', '2026-01-10'),
(2,  'Bruno Costa',     'bruno.costa@email.com',  'DF', '2026-01-15'),
(3,  'Carla Souza',     NULL,                     'SP', '2026-02-01'),  -- V01 e-mail nulo
(4,  'Diego Lima',      'diego.lima@email.com',   'RJ', '2026-02-10'),
(5,  'Elisa Rocha',     'ana.silva@email.com',    'MG', '2026-02-20'),  -- V02 e-mail duplicado (cliente 1)
(6,  'Fábio Alves',     'fabio.alves#email.com',  'BA', '2026-03-01'),  -- V03 e-mail sem @
(7,  'Gabi Martins',    'gabi.martins@email',     'PR', '2026-03-05'),  -- V03 e-mail sem domínio
(8,  'Hugo Pereira',    'hugo.pereira@email.com', 'XX', '2026-03-12'),  -- V04 UF inválida
(9,  'Isis Barros',     'isis.barros@email.com',  'go', '2026-04-01'),  -- V04 UF em minúsculo
(10, 'João Nunes',      'joao.nunes@email.com',   'SC', '2026-04-15');

INSERT INTO pedidos (id, cliente_id, data_pedido, status, valor_total) VALUES
(101, 1,  '2026-02-01', 'pago',      159.80),
(102, 2,  '2026-02-03', 'pago',       49.90),
(103, 4,  '2026-03-01', 'pago',      120.00),  -- V07 total não bate com os itens (100.00)
(104, 99, '2026-03-02', 'pago',       39.90),  -- V05 cliente inexistente
(105, 10, '2026-03-20', 'pendente',   79.90),  -- V06 pedido antes do cadastro do cliente (15/04)
(106, 1,  '2026-04-02', 'pago',       89.70),  -- V09 pago sem pagamento
(107, 2,  '2026-04-10', 'pago',       59.90),  -- V09 valor pago diferente do total
(108, 4,  '2030-01-01', 'pendente',   29.90),  -- V10 data no futuro
(109, 6,  '2026-04-20', 'cancelado',   0.00),
(110, 9,  '2026-05-02', 'pago',       45.00);  -- V08 item com quantidade zero

INSERT INTO itens_pedido (id, pedido_id, produto, quantidade, preco_unitario) VALUES
(1,  101, 'Mochila',        2,  79.90),
(2,  102, 'Camiseta',       1,  49.90),
(3,  103, 'Jaqueta',        1, 100.00),
(4,  104, 'Lanterna',       1,  39.90),
(5,  105, 'Body infantil',  1,  79.90),
(6,  106, 'Camiseta',       3,  29.90),
(7,  107, 'Boné',           1,  59.90),
(8,  108, 'Meia',           1,  29.90),
(9,  110, 'Garrafa',        1,  45.00),
(10, 110, 'Adesivo',        0,   5.00),  -- V08 quantidade zero
(11, 102, 'Brinde',         1,  -2.00);  -- V08 preço negativo (e V07: total do 102 deixa de bater)

INSERT INTO pagamentos (id, pedido_id, metodo, valor_pago, data_pagamento) VALUES
(1, 101, 'pix',     159.80, '2026-02-01'),
(2, 102, 'cartao',   49.90, '2026-02-03'),
(3, 103, 'boleto',  120.00, '2026-03-03'),
(4, 104, 'pix',      39.90, '2026-03-02'),
(5, 107, 'cartao',   55.00, '2026-04-10'),  -- V09 valor diferente do total (59.90)
(6, 110, 'pix',      45.00, '2026-05-02');
