USE SistemaVendas;
GO

-- =====================================================
-- 07_triggers.sql
-- Triggers para controle automático do sistema
-- =====================================================


-- =====================================================
-- TRIGGER 1: ATUALIZAR ESTOQUE APÓS INSERIR ITEM
-- =====================================================

CREATE OR ALTER TRIGGER trg_atualizar_estoque
ON Itens_pedido
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.estoque = p.estoque - i.quantidade
    FROM Produtos p
    INNER JOIN inserted i
        ON p.id_produto = i.id_produto;
END;
GO


-- =====================================================
-- TRIGGER 2: IMPEDIR ESTOQUE NEGATIVO
-- =====================================================

CREATE OR ALTER TRIGGER trg_impedir_estoque_negativo
ON Itens_pedido
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Produtos p
            ON i.id_produto = p.id_produto
        WHERE i.quantidade > p.estoque
    )
    BEGIN
        RAISERROR('Estoque insuficiente para realizar a venda.', 16, 1);
        RETURN;
    END;

    INSERT INTO Itens_pedido (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
    SELECT
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    FROM inserted;
END;
GO


-- =====================================================
-- VERIFICAR TRIGGERS CRIADAS
-- =====================================================

SELECT name
FROM sys.triggers;
GO
