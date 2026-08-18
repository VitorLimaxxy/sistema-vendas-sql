USE SistemaVendas;
GO

-- =====================================================
-- 08_indexes.sql
-- Índices para melhorar o desempenho das consultas
-- =====================================================


-- =====================================================
-- ÍNDICE 1: CLIENTE NOS PEDIDOS
-- =====================================================

CREATE INDEX idx_pedidos_id_cliente
ON Pedidos (id_cliente);
GO


-- =====================================================
-- ÍNDICE 2: DATA DOS PEDIDOS
-- =====================================================

CREATE INDEX idx_pedidos_data_pedido
ON Pedidos (data_pedido);
GO


-- =====================================================
-- ÍNDICE 3: STATUS DOS PEDIDOS
-- =====================================================

CREATE INDEX idx_pedidos_status
ON Pedidos (status);
GO


-- =====================================================
-- ÍNDICE 4: CATEGORIA DOS PRODUTOS
-- =====================================================

CREATE INDEX idx_produtos_id_categoria
ON Produtos (id_categoria);
GO


-- =====================================================
-- ÍNDICE 5: PEDIDO NOS ITENS
-- =====================================================

CREATE INDEX idx_itens_pedido_id_pedido
ON Itens_pedido (id_pedido);
GO


-- =====================================================
-- ÍNDICE 6: PRODUTO NOS ITENS
-- =====================================================

CREATE INDEX idx_itens_pedido_id_produto
ON Itens_pedido (id_produto);
GO


-- =====================================================
-- VERIFICAR ÍNDICES CRIADOS
-- =====================================================

SELECT
    t.name AS tabela,
    i.name AS indice
FROM sys.indexes i
INNER JOIN sys.tables t
    ON i.object_id = t.object_id
WHERE i.name IS NOT NULL
ORDER BY t.name, i.name;
GO
