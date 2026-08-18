USE SistemaVendas;
GO

-- =====================================================
-- 04_consultas.sql
-- Consultas para análise do Sistema de Vendas
-- =====================================================


-- 1. LISTAR TODOS OS CLIENTES
SELECT *
FROM Clientes;
GO


-- 2. PRODUTOS COM SUAS CATEGORIAS
SELECT
    p.id_produto,
    p.nome AS produto,
    c.nome AS categoria,
    p.preco,
    p.estoque
FROM Produtos p
INNER JOIN Categorias c
    ON p.id_categoria = c.id_categoria;
GO


-- 3. PEDIDOS COM CLIENTES
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    pe.data_pedido,
    pe.status,
    pe.valor_total
FROM Pedidos pe
INNER JOIN Clientes c
    ON pe.id_cliente = c.id_cliente
ORDER BY pe.data_pedido DESC;
GO


-- 4. ITENS DE CADA PEDIDO
SELECT
    ip.id_item,
    ip.id_pedido,
    p.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS subtotal
FROM Itens_Pedido ip
INNER JOIN Produtos p
    ON ip.id_produto = p.id_produto
ORDER BY ip.id_pedido;
GO


-- 5. VALOR CALCULADO DE CADA PEDIDO
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_calculado
FROM Pedidos pe
INNER JOIN Clientes c
    ON pe.id_cliente = c.id_cliente
INNER JOIN Itens_Pedido ip
    ON pe.id_pedido = ip.id_pedido
GROUP BY
    pe.id_pedido,
    c.nome
ORDER BY valor_calculado DESC;
GO


-- 6. PRODUTOS MAIS VENDIDOS
SELECT
    p.id_produto,
    p.nome AS produto,
    SUM(ip.quantidade) AS quantidade_vendida
FROM Produtos p
INNER JOIN Itens_Pedido ip
    ON p.id_produto = ip.id_produto
GROUP BY
    p.id_produto,
    p.nome
ORDER BY quantidade_vendida DESC;
GO


-- 7. CLIENTES QUE MAIS COMPRARAM
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
    c.nome
ORDER BY total_gasto DESC;
GO


-- 8. FATURAMENTO TOTAL
SELECT
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento_total
FROM Itens_Pedido ip;
GO


-- 9. PEDIDOS POR STATUS
SELECT
    status,
    COUNT(*) AS quantidade_pedidos
FROM Pedidos
GROUP BY status
ORDER BY quantidade_pedidos DESC;
GO


-- 10. PAGAMENTOS
SELECT
    pg.id_pagamento,
    pg.id_pedido,
    c.nome AS cliente,
    pg.metodo,
    pg.valor,
    pg.data_pagamento,
    pg.status
FROM Pagamentos pg
INNER JOIN Pedidos pe
    ON pg.id_pedido = pe.id_pedido
INNER JOIN Clientes c
    ON pe.id_cliente = c.id_cliente
ORDER BY pg.data_pagamento DESC;
GO


-- 11. FATURAMENTO POR CATEGORIA
SELECT
    c.nome AS categoria,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM Categorias c
INNER JOIN Produtos p
    ON c.id_categoria = p.id_categoria
INNER JOIN Itens_Pedido ip
    ON p.id_produto = ip.id_produto
GROUP BY
    c.nome
ORDER BY faturamento DESC;
GO


-- 12. TICKET MÉDIO
SELECT
    AVG(valor_pedido) AS ticket_medio
FROM (
    SELECT
        id_pedido,
        SUM(quantidade * preco_unitario) AS valor_pedido
    FROM Itens_Pedido
    GROUP BY id_pedido
) AS pedidos_calculados;
GO


-- 13. PRODUTOS COM ESTOQUE BAIXO
SELECT
    id_produto,
    nome AS produto,
    estoque
FROM Produtos
WHERE estoque <= 10
ORDER BY estoque ASC;
GO


-- 14. PRODUTOS POR CATEGORIA
SELECT
    c.nome AS categoria,
    COUNT(p.id_produto) AS quantidade_produtos
FROM Categorias c
LEFT JOIN Produtos p
    ON c.id_categoria = p.id_categoria
GROUP BY
    c.nome
ORDER BY quantidade_produtos DESC;
GO


-- 15. RESUMO GERAL
SELECT
    (SELECT COUNT(*) FROM Clientes) AS total_clientes,
    (SELECT COUNT(*) FROM Produtos) AS total_produtos,
    (SELECT COUNT(*) FROM Pedidos) AS total_pedidos,
    (SELECT COUNT(*) FROM Itens_Pedido) AS total_itens,
    (SELECT COUNT(*) FROM Pagamentos) AS total_pagamentos;
GO
