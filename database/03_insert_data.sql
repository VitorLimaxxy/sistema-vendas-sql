USE SistemaVendas;
GO

-- =====================================================
-- DADOS FICTÍCIOS PARA TESTES
-- Projeto: Sistema de Vendas
-- =====================================================


-- =====================================================
-- CLIENTES - 20 registros
-- =====================================================

INSERT INTO Clientes
    (nome, email, telefone, cpf, data_nascimento)
VALUES
('Lucas Almeida', 'lucas.almeida@email.com', '11987654321', '12345678901', '19980512'),
('Mariana Costa', 'mariana.costa@email.com', '21987654321', '23456789012', '20010320'),
('Rafael Santos', 'rafael.santos@email.com', '31987654321', '34567890123', '19951108'),
('Amanda Oliveira', 'amanda.oliveira@email.com', '41987654321', '45678901234', '20020715'),
('Gabriel Souza', 'gabriel.souza@email.com', '51987654321', '56789012345', '19991202'),
('Juliana Ferreira', 'juliana.ferreira@email.com', '61987654321', '67890123456', '19970425'),
('Bruno Rodrigues', 'bruno.rodrigues@email.com', '71987654321', '78901234567', '20000918'),
('Camila Martins', 'camila.martins@email.com', '81987654321', '89012345678', '19960330'),
('Felipe Lima', 'felipe.lima@email.com', '11976543210', '90123456789', '20011214'),
('Beatriz Rocha', 'beatriz.rocha@email.com', '21976543210', '01234567890', '19980807'),
('Diego Carvalho', 'diego.carvalho@email.com', '31976543210', '11223344556', '19941022'),
('Larissa Gomes', 'larissa.gomes@email.com', '41976543210', '22334455667', '20030511'),
('Matheus Ribeiro', 'matheus.ribeiro@email.com', '51976543210', '33445566778', '19970903'),
('Isabela Alves', 'isabela.alves@email.com', '61976543210', '44556677889', '20020128'),
('Gustavo Barbosa', 'gustavo.barbosa@email.com', '71976543210', '55667788990', '19960617'),
('Carolina Dias', 'carolina.dias@email.com', '81976543210', '66778899001', '20001009'),
('Pedro Henrique', 'pedro.henrique@email.com', '11965432109', '77889900112', '19990313'),
('Ana Clara', 'ana.clara@email.com', '21965432109', '88990011223', '20040621'),
('Leonardo Mendes', 'leonardo.mendes@email.com', '31965432109', '99001122334', '19950205'),
('Natalia Freitas', 'natalia.freitas@email.com', '41965432109', '10112233445', '20010826');
GO


-- =====================================================
-- CATEGORIAS - 6 registros
-- =====================================================

INSERT INTO Categorias (nome, descricao)
VALUES
('Perifericos', 'Mouses, teclados, headsets e outros perifericos'),
('Monitores', 'Monitores para computadores e jogos'),
('Armazenamento', 'HDs, SSDs e dispositivos de armazenamento'),
('Hardware', 'Componentes internos para computadores'),
('Acessorios', 'Acessorios e complementos para computadores'),
('Redes', 'Equipamentos e acessorios para redes');
GO


-- =====================================================
-- PRODUTOS - 25 registros
-- =====================================================

INSERT INTO Produtos
    (nome, descricao, preco, estoque, id_categoria)
VALUES
('Mouse Gamer', 'Mouse gamer com sensor de alta precisao', 129.90, 35, 1),
('Teclado Mecanico', 'Teclado mecanico para jogos e produtividade', 249.90, 20, 1),
('Headset USB', 'Headset USB com microfone integrado', 189.90, 25, 1),
('Mousepad Grande', 'Mousepad de tamanho grande para escritorio e jogos', 69.90, 40, 1),
('Teclado Compacto', 'Teclado compacto para escritorio e jogos', 199.90, 18, 1),

('Monitor 24 Polegadas', 'Monitor Full HD de 24 polegadas', 799.90, 12, 2),
('Monitor 27 Polegadas', 'Monitor Full HD de 27 polegadas', 1199.90, 8, 2),
('Monitor 24 Polegadas 144Hz', 'Monitor gamer de 24 polegadas com 144Hz', 999.90, 10, 2),

('SSD 500GB', 'SSD de 500GB para armazenamento rapido', 279.90, 30, 3),
('SSD 1TB', 'SSD de 1TB para armazenamento rapido', 449.90, 20, 3),
('HD 1TB', 'Disco rigido de 1TB para armazenamento', 299.90, 15, 3),
('SSD NVMe 1TB', 'SSD NVMe de 1TB de alta velocidade', 499.90, 17, 3),

('Memoria RAM 8GB', 'Modulo de memoria RAM de 8GB', 159.90, 30, 4),
('Memoria RAM 16GB', 'Modulo de memoria RAM de 16GB', 289.90, 25, 4),
('Fonte 600W', 'Fonte de alimentacao de 600 watts', 349.90, 14, 4),
('Cooler CPU', 'Cooler para refrigeracao do processador', 149.90, 22, 4),
('Gabinete Mid Tower', 'Gabinete Mid Tower para computador', 329.90, 11, 4),

('Webcam Full HD', 'Webcam Full HD para chamadas e gravacoes', 179.90, 20, 5),
('Hub USB', 'Hub USB para expansao de portas', 89.90, 35, 5),
('Suporte para Notebook', 'Suporte ergonomico para notebook', 99.90, 28, 5),
('Cabo HDMI', 'Cabo HDMI para transmissao de audio e video', 39.90, 50, 5),
('Adaptador USB-C', 'Adaptador USB-C para conexao de dispositivos', 59.90, 40, 5),

('Roteador Wi-Fi', 'Roteador Wi-Fi para redes domesticas', 249.90, 15, 6),
('Adaptador Wi-Fi USB', 'Adaptador USB para conexao Wi-Fi', 79.90, 25, 6),
('Cabo de Rede 5m', 'Cabo de rede Ethernet com 5 metros', 34.90, 45, 6);
GO


-- =====================================================
-- PEDIDOS - 35 registros
-- valor_total sera recalculado apos inserir os itens
-- =====================================================

INSERT INTO Pedidos
    (id_cliente, data_pedido, status, valor_total)
VALUES
(1,  '20260701 10:15:00', 'Pago',     0),
(2,  '20260702 14:20:00', 'Pago',     0),
(3,  '20260703 09:10:00', 'Pago',     0),
(4,  '20260704 18:45:00', 'Enviado',  0),
(5,  '20260705 11:30:00', 'Pago',     0),
(6,  '20260706 16:05:00', 'Pago',     0),
(7,  '20260707 13:40:00', 'Pendente', 0),
(8,  '20260708 08:55:00', 'Pago',     0),
(9,  '20260709 19:15:00', 'Enviado',  0),
(10, '20260710 12:25:00', 'Pago',     0),
(11, '20260711 17:10:00', 'Pago',     0),
(12, '20260712 10:50:00', 'Pago',     0),
(13, '20260713 15:35:00', 'Pendente', 0),
(14, '20260714 09:45:00', 'Pago',     0),
(15, '20260715 18:20:00', 'Enviado',  0),
(16, '20260716 11:05:00', 'Pago',     0),
(17, '20260717 14:55:00', 'Pago',     0),
(18, '20260718 16:40:00', 'Pago',     0),
(19, '20260719 10:20:00', 'Pendente', 0),
(20, '20260720 13:15:00', 'Pago',     0),

(1,  '20260721 09:30:00', 'Pago',     0),
(3,  '20260722 12:10:00', 'Pago',     0),
(5,  '20260723 15:25:00', 'Enviado',  0),
(7,  '20260724 17:40:00', 'Pago',     0),
(9,  '20260725 10:05:00', 'Pago',     0),
(11, '20260726 14:35:00', 'Pendente', 0),
(13, '20260727 16:50:00', 'Pago',     0),
(15, '20260728 11:15:00', 'Pago',     0),
(17, '20260729 13:45:00', 'Enviado',  0),
(19, '20260730 18:10:00', 'Pago',     0),

(2,  '20260801 09:20:00', 'Pago',     0),
(4,  '20260803 12:55:00', 'Pago',     0),
(6,  '20260805 15:10:00', 'Pendente', 0),
(8,  '20260807 17:25:00', 'Pago',     0),
(10, '20260810 10:40:00', 'Enviado',  0);
GO


-- =====================================================
-- ITENS DOS PEDIDOS
-- =====================================================

INSERT INTO Itens_Pedido
    (id_pedido, id_produto, quantidade, preco_unitario)
VALUES
-- Pedido 1
(1, 1, 1, 129.90),
(1, 2, 1, 249.90),

-- Pedido 2
(2, 6, 1, 799.90),
(2, 21, 1, 39.90),

-- Pedido 3
(3, 9, 1, 279.90),
(3, 22, 1, 59.90),

-- Pedido 4
(4, 2, 1, 249.90),
(4, 19, 1, 89.90),

-- Pedido 5
(5, 7, 1, 1199.90),
(5, 21, 1, 39.90),

-- Pedido 6
(6, 2, 1, 249.90),
(6, 25, 1, 34.90),

-- Pedido 7
(7, 10, 1, 449.90),
(7, 21, 2, 39.90),

-- Pedido 8
(8, 1, 1, 129.90),
(8, 20, 1, 99.90),

-- Pedido 9
(9, 8, 1, 999.90),
(9, 24, 1, 79.90),

-- Pedido 10
(10, 2, 1, 249.90),
(10, 3, 1, 189.90),

-- Pedido 11
(11, 17, 1, 329.90),
(11, 22, 1, 59.90),

-- Pedido 12
(12, 18, 1, 179.90),
(12, 21, 1, 39.90),

-- Pedido 13
(13, 1, 1, 129.90),
(13, 10, 1, 449.90),

-- Pedido 14
(14, 15, 1, 349.90),
(14, 25, 2, 34.90),

-- Pedido 15
(15, 1, 1, 129.90),
(15, 4, 1, 69.90),

-- Pedido 16
(16, 12, 1, 499.90),
(16, 22, 1, 59.90),

-- Pedido 17
(17, 14, 1, 289.90),
(17, 25, 1, 34.90),

-- Pedido 18
(18, 1, 1, 129.90),
(18, 21, 1, 39.90),

-- Pedido 19
(19, 23, 1, 249.90),
(19, 24, 1, 79.90),

-- Pedido 20
(20, 3, 1, 189.90),
(20, 17, 1, 329.90),

-- Pedido 21
(21, 13, 1, 159.90),
(21, 21, 1, 39.90),

-- Pedido 22
(22, 5, 1, 199.90),
(22, 10, 1, 449.90),

-- Pedido 23
(23, 1, 1, 129.90),
(23, 3, 1, 189.90),

-- Pedido 24
(24, 11, 1, 299.90),
(24, 25, 1, 34.90),

-- Pedido 25
(25, 5, 2, 199.90),
(25, 21, 1, 39.90),

-- Pedido 26
(26, 16, 1, 149.90),
(26, 24, 1, 79.90),

-- Pedido 27
(27, 1, 1, 129.90),
(27, 19, 1, 89.90),
(27, 17, 1, 329.90),

-- Pedido 28
(28, 19, 1, 89.90),
(28, 25, 1, 34.90),

-- Pedido 29
(29, 9, 1, 279.90),
(29, 19, 1, 89.90),

-- Pedido 30
(30, 25, 1, 34.90),
(30, 21, 1, 39.90),

-- Pedido 31
(31, 6, 1, 799.90),
(31, 21, 1, 39.90),

-- Pedido 32
(32, 9, 1, 279.90),
(32, 14, 1, 289.90),

-- Pedido 33
(33, 4, 2, 69.90),
(33, 20, 1, 99.90),

-- Pedido 34
(34, 1, 1, 129.90),
(34, 18, 1, 179.90),

-- Pedido 35
(35, 15, 2, 349.90),
(35, 25, 1, 34.90);
GO


-- =====================================================
-- ATUALIZA O VALOR TOTAL DOS PEDIDOS
-- com base nos itens cadastrados
-- =====================================================

UPDATE P
SET P.valor_total = T.total
FROM Pedidos AS P
INNER JOIN (
    SELECT
        id_pedido,
        SUM(quantidade * preco_unitario) AS total
    FROM Itens_Pedido
    GROUP BY id_pedido
) AS T
    ON P.id_pedido = T.id_pedido;
GO


-- =====================================================
-- PAGAMENTOS - 1 pagamento para cada pedido
-- =====================================================

INSERT INTO Pagamentos
    (id_pedido, metodo, valor, data_pagamento, status)
SELECT
    id_pedido,

    CASE
        WHEN id_pedido % 4 = 0 THEN 'Pix'
        WHEN id_pedido % 4 = 1 THEN 'Cartao de Credito'
        WHEN id_pedido % 4 = 2 THEN 'Cartao de Debito'
        ELSE 'Boleto'
    END AS metodo,

    valor_total,

    DATEADD(HOUR, 2, data_pedido),

    CASE
        WHEN status = 'Pendente' THEN 'Pendente'
        ELSE 'Aprovado'
    END AS status

FROM Pedidos;
GO


-- =====================================================
-- VERIFICACAO DOS DADOS INSERIDOS
-- =====================================================

SELECT 'Clientes' AS tabela, COUNT(*) AS quantidade
FROM Clientes

UNION ALL

SELECT 'Categorias', COUNT(*)
FROM Categorias

UNION ALL

SELECT 'Produtos', COUNT(*)
FROM Produtos

UNION ALL

SELECT 'Pedidos', COUNT(*)
FROM Pedidos

UNION ALL

SELECT 'Itens_Pedido', COUNT(*)
FROM Itens_Pedido

UNION ALL

SELECT 'Pagamentos', COUNT(*)
FROM Pagamentos;
GO
