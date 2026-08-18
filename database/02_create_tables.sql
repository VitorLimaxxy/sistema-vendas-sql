USE SistemaVendas;
GO

-- =============================================
-- TABELA: Clientes
-- =============================================

CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(11) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL
);
GO


-- =============================================
-- TABELA: Categorias
-- =============================================

CREATE TABLE Categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);
GO


-- =============================================
-- TABELA: Produtos
-- =============================================

CREATE TABLE Produtos (
    id_produto INT IDENTITY(1,1) PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,

    CONSTRAINT FK_Produtos_Categorias
        FOREIGN KEY (id_categoria)
        REFERENCES Categorias(id_categoria)
);
GO


-- =============================================
-- TABELA: Pedidos
-- =============================================

CREATE TABLE Pedidos (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Pedidos_Clientes
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente)
);
GO


-- =============================================
-- TABELA: Itens_Pedido
-- =============================================

CREATE TABLE Itens_Pedido (
    id_item INT IDENTITY(1,1) PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_ItensPedido_Pedidos
        FOREIGN KEY (id_pedido)
        REFERENCES Pedidos(id_pedido),

    CONSTRAINT FK_ItensPedido_Produtos
        FOREIGN KEY (id_produto)
        REFERENCES Produtos(id_produto)
);
GO


-- =============================================
-- TABELA: Pagamentos
-- =============================================

CREATE TABLE Pagamentos (
    id_pagamento INT IDENTITY(1,1) PRIMARY KEY,
    id_pedido INT NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT FK_Pagamentos_Pedidos
        FOREIGN KEY (id_pedido)
        REFERENCES Pedidos(id_pedido)
);
GO
