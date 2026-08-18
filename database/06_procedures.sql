USE SistemaVendas;
GO

-- =====================================================
-- 06_procedures.sql
-- Stored Procedures para consultas do sistema
-- =====================================================


-- =====================================================
-- PROCEDURE 1: BUSCAR PEDIDOS POR CLIENTE
-- =====================================================

CREATE OR ALTER PROCEDURE sp_buscar_pedidos_cliente
    @id_cliente INT
AS
BEGIN
    SELECT
        pe.id_pedido,
        c.nome AS cliente,
        pe.data_pedido,
        pe.status
    FROM Pedidos pe
    INNER JOIN Clientes c
        ON pe.id_cliente = c.id_cliente
    WHERE pe.id_cliente = @id_cliente
    ORDER BY pe.data_pedido DESC;
END;
GO


-- =====================================================
-- PROCEDURE 2: BUSCAR PRODUTOS POR CATEGORIA
-- =====================================================

CREATE OR ALTER PROCEDURE sp_buscar_produtos_categoria
    @id_categoria INT
AS
BEGIN
    SELECT
        p.id_produto,
        p.nome AS produto,
        c.nome AS categoria,
        p.preco,
        p.estoque
    FROM Produtos p
    INNER JOIN Categorias c
        ON p.id_categoria = c.id_categoria
    WHERE p.id_categoria = @id_categoria
    ORDER BY p.nome;
END;
GO


-- =====================================================
-- PROCEDURE 3: BUSCAR PEDIDOS POR STATUS
-- =====================================================

CREATE OR ALTER PROCEDURE sp_buscar_pedidos_status
    @status VARCHAR(50)
AS
BEGIN
    SELECT
        pe.id_pedido,
        c.nome AS cliente,
        pe.data_pedido,
        pe.status
    FROM Pedidos pe
    INNER JOIN Clientes c
        ON pe.id_cliente = c.id_cliente
    WHERE pe.status = @status
    ORDER BY pe.data_pedido DESC;
END;
GO


-- =====================================================
-- PROCEDURE 4: FATURAMENTO POR PERÍODO
-- =====================================================

CREATE OR ALTER PROCEDURE sp_faturamento_periodo
    @data_inicio DATE,
    @data_fim DATE
AS
BEGIN
    SELECT
        SUM(ip.quantidade * ip.preco_unitario) AS faturamento_total
    FROM Pedidos pe
    INNER JOIN Itens_pedido ip
        ON pe.id_pedido = ip.id_pedido
    WHERE pe.data_pedido BETWEEN @data_inicio AND @data_fim;
END;
GO


-- =====================================================
-- TESTES DAS PROCEDURES
-- =====================================================

EXEC sp_buscar_pedidos_cliente
    @id_cliente = 1;
GO

EXEC sp_buscar_produtos_categoria
    @id_categoria = 1;
GO

EXEC sp_buscar_pedidos_status
    @status = 'Concluído';
GO

EXEC sp_faturamento_periodo
    @data_inicio = '2026-01-01',
    @data_fim = '2026-12-31';
GO
