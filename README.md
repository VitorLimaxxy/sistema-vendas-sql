# 🛒 Sistema de Vendas — SQL Server

Projeto de banco de dados relacional desenvolvido em **SQL Server**, simulando o funcionamento de um sistema de vendas.

O projeto contempla desde a criação e modelagem do banco de dados até consultas, views, stored procedures, triggers e índices, permitindo praticar conceitos fundamentais de **SQL e Banco de Dados** em um cenário próximo de uma aplicação real.

---

## 🎯 Objetivo do Projeto

O objetivo deste projeto é desenvolver um banco de dados capaz de armazenar e relacionar informações de um sistema de vendas, incluindo:

* Clientes
* Categorias
* Produtos
* Pedidos
* Itens dos pedidos
* Pagamentos

Além do armazenamento dos dados, o projeto possui consultas para geração de relatórios, automações com triggers, procedures para consultas parametrizadas e índices para otimização.

---

## 🛠️ Tecnologias Utilizadas

* Microsoft SQL Server
* T-SQL
* SQL Server Management
* Visual Studio Code
* Git
* GitHub

---

## 🗄️ Estrutura do Banco de Dados

O banco de dados `SistemaVendas` é composto pelas principais tabelas:

| Tabela         | Descrição                                        |
| -------------- | ------------------------------------------------ |
| `Clientes`     | Armazena os dados dos clientes                   |
| `Categorias`   | Armazena as categorias dos produtos              |
| `Produtos`     | Armazena produtos, preços e estoque              |
| `Pedidos`      | Registra os pedidos realizados                   |
| `Itens_pedido` | Armazena os produtos pertencentes a cada pedido  |
| `Pagamento`    | Registra informações relacionadas aos pagamentos |

As tabelas são relacionadas através de **Primary Keys (PK)** e **Foreign Keys (FK)**, garantindo integridade e consistência dos dados.

---

## 📁 Estrutura do Projeto

```text
sistema-vendas-sql/
│
├── banco de dados/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_inserir_dados.sql
│   ├── 04_consultas.sql
│   ├── 05_views.sql
│   ├── 06_procedimentos.sql
│   ├── 07_gatilhos.sql
│   └── 08_indices.sql
│
└── README.md
```

### `01_create_database.sql`

Responsável pela criação do banco de dados `SistemaVendas`.

### `02_create_tables.sql`

Criação das tabelas, chaves primárias, relacionamentos e restrições.

### `03_inserir_dados.sql`

Inserção de dados fictícios utilizados para testes e demonstrações.

### `04_consultas.sql`

Consultas SQL para análise das informações armazenadas no banco.

Inclui exemplos utilizando:

* `INNER JOIN`
* `GROUP BY`
* `ORDER BY`
* `SUM`
* `COUNT`
* `AVG`
* Subqueries
* Funções de agregação

### `05_views.sql`

Criação de views para facilitar consultas e relatórios.

Views desenvolvidas:

```text
vw_total_pedido
vw_produtos_vendidos
vw_detalhes_pedido
vw_resumo_clientes
```

### `06_procedimentos.sql`

Stored Procedures utilizadas para realizar consultas parametrizadas.

Procedures desenvolvidas:

```text
sp_buscar_pedidos_cliente
sp_buscar_produtos_categoria
sp_buscar_pedidos_status
sp_faturamento_periodo
```

### `07_gatilhos.sql`

Triggers responsáveis pela automatização de regras relacionadas ao controle de estoque.

### `08_indices.sql`

Índices criados para melhorar o desempenho das consultas e buscas realizadas no banco.

---

## 🔎 Exemplos de Consultas

### Produtos mais vendidos

```sql
SELECT
    p.nome AS produto,
    SUM(ip.quantidade) AS quantidade_vendida
FROM Produtos p
INNER JOIN Itens_pedido ip
    ON p.id_produto = ip.id_produto
GROUP BY p.nome
ORDER BY quantidade_vendida DESC;
```

### Total gasto por cliente

```sql
SELECT
    c.nome AS cliente,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM Clientes c
INNER JOIN Pedidos pe
    ON c.id_cliente = pe.id_cliente
INNER JOIN Itens_pedido ip
    ON pe.id_pedido = ip.id_pedido
GROUP BY c.nome
ORDER BY total_gasto DESC;
```

---

## ⚙️ Funcionalidades Implementadas

* Modelagem de banco de dados relacional
* Criação de tabelas
* Primary Keys e Foreign Keys
* Integridade referencial
* Inserção de dados fictícios
* Consultas utilizando múltiplas tabelas
* JOINs
* Funções de agregação
* Views
* Stored Procedures
* Triggers
* Controle automático de estoque
* Índices para otimização de consultas
* Relatórios de vendas

---

## ▶️ Como Executar o Projeto

### 1. Crie o banco de dados

Execute:

```text
01_create_database.sql
```

### 2. Crie as tabelas

Execute:

```text
02_create_tables.sql
```

### 3. Insira os dados de teste

Execute:

```text
03_inserir_dados.sql
```

### 4. Execute os demais scripts na ordem

```text
04_consultas.sql
05_views.sql
06_procedimentos.sql
07_gatilhos.sql
08_indices.sql
```

Os scripts devem ser executados na ordem numérica para garantir que todas as dependências estejam disponíveis.

---

## 📊 Conceitos Praticados

Este projeto foi desenvolvido para praticar conceitos importantes de banco de dados, como:

`SELECT` • `INSERT` • `JOIN` • `GROUP BY` • `ORDER BY` • `SUM` • `COUNT` • `AVG` • `VIEW` • `Stored Procedure` • `Trigger` • `Index` • `Primary Key` • `Foreign Key`

---

## 🚀 Próximas Melhorias

Como evolução do projeto, poderão ser implementados:

* Dashboard de vendas no Power BI
* Consultas avançadas utilizando CTEs
* Functions em T-SQL
* Tratamento de erros com `TRY...CATCH`
* Transações com `BEGIN TRANSACTION`, `COMMIT` e `ROLLBACK`
* Novos relatórios gerenciais

---

## 👨‍💻 Sobre o Projeto

Projeto desenvolvido para estudo e prática de **SQL Server e Banco de Dados**, com foco na aplicação dos conhecimentos adquiridos durante minha formação em **Sistemas de Informação** e na construção do meu portfólio profissional.
---

## 🗺️ Diagrama Entidade-Relacionamento (DER)

O diagrama abaixo representa a estrutura do banco de dados e os relacionamentos entre as entidades do Sistema de Vendas.

![Diagrama Entidade-Relacionamento](drawSQL-image-export-2026-08-18%20(1).webp)
