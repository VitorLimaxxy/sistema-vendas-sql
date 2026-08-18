USE SistemaVendas;
GO

-- =====================================================
-- 05_views.sql
-- Views para facilitar consultas e relatórios
-- =====================================================


-- =====================================================
-- VIEW 1: DETALHES DOS PEDIDOS
-- =====================================================

CREATE OR ALTER VIEW vw_detalhes_pedidos AS
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    pe.data_pedido,
    pe.status,
    p.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS subtotal
FROM Pedido pe
INNER JOIN Clientes c
    ON pe.id_cliente = c.id_cliente
INNER JOIN Itens_pedidos ip
    ON pe.id_pedido = ip.id_pedido
INNER JOIN Produtos p
    ON ip.id_produto = p.id_produto;
GO


-- =====================================================
-- VIEW 2: TOTAL DE CADA PEDIDO
-- =====================================================

CREATE OR ALTER VIEW vw_total_pedidos AS
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    pe.data_pedido,
    pe.status,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM Pedido pe
INNER JOIN Clientes c
    ON pe.id_cliente = c.id_cliente
INNER JOIN Itens_pedidos ip
    ON pe.id_pedido = ip.id_pedido
GROUP BY
    pe.id_pedido,
    c.nome,
    pe.data_pedido,
    pe.status;
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
INNER JOIN Itens_pedidos ip
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
INNER JOIN Pedido pe
    ON c.id_cliente = pe.id_cliente
INNER JOIN Itens_pedidos ip
    ON pe.id_pedido = ip.id_pedido
GROUP BY
    c.id_cliente,
    c.nome;
GO


-- =====================================================
-- TESTES DAS VIEWS
-- =====================================================

SELECT *
FROM vw_detalhes_pedidos;
GO

SELECT *
FROM vw_total_pedidos
ORDER BY valor_total DESC;
GO

SELECT *
FROM vw_produtos_vendidos
ORDER BY quantidade_vendida DESC;
GO

SELECT *
FROM vw_resumo_clientes
ORDER BY total_gasto DESC;
GO
