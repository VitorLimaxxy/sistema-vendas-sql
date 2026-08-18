USE SistemaVendas;
GO

-- =====================================================
-- 05_views.sql
-- Views para consultas e relatórios do Sistema de Vendas
-- =====================================================


-- =====================================================
-- VIEW 1: TOTAL DOS PEDIDOS
-- =====================================================

CREATE OR ALTER VIEW vw_total_pedido AS
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    pe.data_pedido,
    pe.status,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM Pedidos pe
INNER JOIN Clientes c
    ON pe.id_cliente = c.id_cliente
INNER JOIN Itens_Pedido ip
    ON pe.id_pedido = ip.id_pedido
GROUP BY
    pe.id_pedido,
    c.nome,
    pe.data_pedido,
    pe.status;
GO


-- =====================================================
-- VIEW 2: DETALHES DOS PEDIDOS
-- =====================================================

CREATE OR ALTER VIEW vw_detalhes_pedido AS
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    pe.data_pedido,
    pe.status,
    p.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS subtotal
FROM Pedidos pe
INNER JOIN Clientes c
    ON pe.id_cliente = c.id_cliente
INNER JOIN Itens_Pedido ip
    ON pe.id_pedido = ip.id_pedido
INNER JOIN Produtos p
    ON ip.id_produto = p.id_produto;
GO


-- =====================================================
-- VIEW 3: PRODUTOS MAIS VENDIDOS
-- =====================================================

CREATE OR ALTER VIEW vw_produtos_vendidos AS
SELECT
    p.id_produto,
    p.nome AS produto,
    c.nome AS categoria,
    SUM(ip.quantidade) AS quantidade_vendida,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM Produtos p
INNER JOIN Categorias c
    ON p.id_categoria = c.id_categoria
INNER JOIN Itens_Pedido ip
    ON p.id_produto = ip.id_produto
GROUP BY
    p.id_produto,
    p.nome,
    c.nome;
GO


-- =====================================================
-- VIEW 4: RESUMO DOS CLIENTES
-- =====================================================

CREATE OR ALTER VIEW vw_resumo_clientes AS
SELECT
    c.id_cliente,
    c.nome AS cliente,
    COUNT(DISTINCT pe.id_pedido) AS quantidade_pedidos,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM Clientes c
INNER JOIN Pedidos pe
    ON c.id_cliente = pe.id_cliente
INNER JOIN Itens_Pedido ip
    ON pe.id_pedido = ip.id_pedido
GROUP BY
    c.id_cliente,
    c.nome;
GO


-- =====================================================
-- TESTES DAS VIEWS
-- =====================================================

SELECT * FROM vw_total_pedido;
GO

SELECT * FROM vw_detalhes_pedido;
GO

SELECT * FROM vw_produtos_vendidos;
GO

SELECT * FROM vw_resumo_clientes;
GO
