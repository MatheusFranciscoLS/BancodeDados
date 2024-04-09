CREATE DATABASE DB_SA04_EX1;

CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Email VARCHAR(100)
);

ALTER TABLE Clientes
ADD CONSTRAINT Email UNIQUE (Email);

CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

ALTER TABLE Pedidos
ADD COLUMN Status VARCHAR(20) NOT NULL CHECK (
    Status IN ('Em andamento', 'Finalizado', 'Cancelado'));

INSERT INTO Clientes (ID, Nome, Sobrenome, Email)
VALUES
    (1, 'João', 'Silva', 'joao@example.com'),
    (2, 'Maria', 'Santos', 'maria@example.com'),
    (3, 'Pedro', 'Ferreira', 'pedro@example.com');

INSERT INTO Pedidos (ID, ID_Cliente, Data_Pedido, Total, Status)
VALUES
    (1, 1, '2024-04-08', 50.00, 'Em andamento'),
    (2, 2, '2024-04-07', 75.00, 'Finalizado'),
    (3, 3, '2024-04-06', 100.00, 'Em andamento'),
    (4, 2, '2024-04-05', 30.00, 'Cancelado'),
    (5, 1, '2024-04-04', 90.00, 'Finalizado');


UPDATE Pedidos
SET Total = 60.00
WHERE ID = 1;

-- Excluir os pedidos associados ao cliente da tabela "Pedidos"
DELETE FROM Pedidos WHERE ID_Cliente = 1

-- Excluir o cliente da tabela "Clientes"
DELETE FROM Clientes WHERE ID = 1

SELECT * FROM Pedidos WHERE Status = 'Em andamento';

SELECT c.Nome, p.Data_Pedido, p.Total
FROM Pedidos p
JOIN Clientes c ON p.ID_Cliente = c.ID
WHERE p.Data_Pedido >= CURRENT_DATE - INTERVAL '30 days';



-- EXERCICIO 2

CREATE DATABASE DB_SA04_EX2;

CREATE TABLE Produtos (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Descrição TEXT,
    Preço NUMERIC(10, 2)
);

ALTER TABLE Produtos
ADD CONSTRAINT Preço_Positive CHECK (Preço >= 0);

CREATE TABLE Pedidos (
    ID SERIAL PRIMARY KEY,
    Data DATE,
    Valor NUMERIC(10, 2),
    Status VARCHAR(50)
);

CREATE TABLE Pedidos_Produtos (
    ID_Pedido INT,
    ID_Produto INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    PRIMARY KEY (ID_Pedido, ID_Produto)
);

CREATE INDEX idx_nome_produto ON Produtos (Nome);

CREATE TABLE Categorias (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255)
);

CREATE TABLE Produtos_Categorias (
    ID_Produto INT,
    ID_Categoria INT,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID),
    PRIMARY KEY (ID_Produto, ID_Categoria)
);

CREATE TABLE Funcionários (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Sobrenome VARCHAR(100),
    Cargo VARCHAR(100)
);

ALTER TABLE Funcionários
ADD CONSTRAINT check_Cargo_valido CHECK (Cargo IN ('Gerente', 'Vendedor', 'Atendente'));

INSERT INTO Produtos (Nome, Descrição, Preço) VALUES
    ('Produto 1', 'Descrição do Produto 1', 10.99),
    ('Produto 2', 'Descrição do Produto 2', 20.49),
    ('Produto 3', 'Descrição do Produto 3', 15.99),
    ('Produto 4', 'Descrição do Produto 4', 25.99),
    ('Produto 5', 'Descrição do Produto 5', 30.99);

INSERT INTO Pedidos (Data, Valor, Status) VALUES
('2024-04-08', 50.00, 'Pendente'),
('2024-04-07', 75.00, 'Em andamento'),
('2024-04-06', 30.00, 'Concluído'),
('2024-04-05', 40.00, 'Pendente'),
('2024-04-04', 60.00, 'Em andamento');


-- Associar produtos aos pedidos
INSERT INTO Pedidos_Produtos (ID_Pedido, ID_Produto) VALUES
    (1, 1),  -- Associa o Produto 1 ao Pedido 1
    (1, 2),  -- Associa o Produto 2 ao Pedido 1
    (2, 3),  -- Associa o Produto 3 ao Pedido 2
    (3, 4),  -- Associa o Produto 4 ao Pedido 3
    (3, 5);  -- Associa o Produto 5 ao Pedido 3

UPDATE Produtos
SET Preço = 12.99
WHERE ID = 1;

-- Exclua os registros correspondentes na tabela "Pedidos_Produtos"
DELETE FROM Pedidos_Produtos
WHERE ID_Produto = 1;

-- Exclua o produto da tabela "Produtos"
DELETE FROM Produtos
WHERE ID = 1;

SELECT p.*
FROM Produtos p
JOIN Produtos_Categorias pc ON p.ID = pc.ID_Produto
JOIN Categorias c ON pc.ID_Categoria = c.ID
WHERE c.ID = 1;

INSERT INTO Funcionários (Nome, Sobrenome, Cargo) VALUES
('João', 'Silva', 'Gerente'),
('Maria', 'Santos', 'Vendedor'),
('Pedro', 'Oliveira', 'Atendente'),
('Ana', 'Pereira', 'Vendedor'),
('Carlos', 'Rodrigues', 'Atendente');


SELECT Nome, Sobrenome, Cargo
FROM Funcionários;

UPDATE Funcionários
SET Cargo = 'Gerente'
WHERE ID = 1;

DELETE FROM Funcionários
WHERE ID = 1;

SELECT *
FROM Pedidos;

SELECT *
FROM Produtos
ORDER BY Preço DESC
LIMIT 5;

SELECT SUM(Valor) AS Valor_Total
FROM Pedidos;

SELECT DISTINCT c.Nome, c.Sobrenome
FROM Clientes c
INNER JOIN Pedidos p ON c.ID = p.ID_Cliente
WHERE p.Status = 'Cancelado';

UPDATE Pedidos
SET Status = 'Finalizado'
WHERE Data < '2024-04-01';

DELETE FROM Pedidos
WHERE Status = 'Finalizado' AND Data < CURRENT_DATE - INTERVAL '1 year';

SELECT *
FROM Pedidos
ORDER BY Status, Data;

UPDATE Pedidos
SET Status = 'Atrasado'
WHERE AGE(CURRENT_DATE, Data) > INTERVAL '30 days';

SELECT c.Nome AS Categoria, SUM(p.Preço) AS Total_Vendas
FROM Produtos p
JOIN Pedidos_Produtos pp ON p.ID = pp.ID_Produto
JOIN Produtos_Categorias pc ON p.ID = pc.ID_Produto
JOIN Categorias c ON pc.ID_Categoria = c.ID
GROUP BY c.ID, c.Nome;

SELECT *
FROM Produtos
WHERE ID NOT IN (SELECT DISTINCT ID_Produto FROM Pedidos_Produtos);

