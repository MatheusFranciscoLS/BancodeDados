CREATE DATABASE SA05_BANCO_MatheusFrancisco;


DDL 

EXERCICIO 1 -

CREATE TABLE Clientes(
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

EXERCICIO 2 -


CREATE TABLE Pedidos(
    ID SERIAL PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

ALTER TABLE
    Pedidos
ADD

EXERCICIO 3 -

    CONSTRAINT CREATE TABLE Produtos(
        ID SERIAL PRIMARY KEY,
        Nome VARCHAR(100) NOT NULL,
        Descricao TEXT NOT NULL,
        Preco NUMERIC(10, 2) NOT NULL CHECK (Preco >= 0)
    );

EXERCICIO 4 -

CREATE TABLE Categorias(
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

EXERCICIO 5 -

CREATE TABLE Pedidos_Produtos(
    ID_Pedido INT,
    ID_Produto INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    PRIMARY KEY (ID_Pedido, ID_Produto)
);

EXERCICIO 6 -

CREATE TABLE Produtos_Categorias(
    ID_Produto INT,
    ID_Categoria INT,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID),
    PRIMARY KEY (ID_Produto, ID_Categoria)
)

EXERCICIO 7 -

CREATE TABLE Empregados(
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(100) NOT NULL
);

ALTER TABLE
    Empregados
ADD
    CONSTRAINT check_Cargo_valido CHECK (Cargo IN ('Gerente', 'Vendedor', 'Atendente'));

EXERCICIO 8 -

CREATE TABLE Vendas(
    ID SERIAL PRIMARY KEY,
    ID_Produto INT,
    ID_Cliente INT,
    Data_Venda DATE NOT NULL,
    Quantidade INT NOT NULL,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

EXERCICIO 9 -

ALTER TABLE
    Clientes
ADD
    COLUMN Telefone VARCHAR(20) NOT NULL

ALTER TABLE
    Produtos
ALTER COLUMN
    Descricao DROP NOT NULL

ALTER TABLE
    Pedidos DROP CONSTRAINT pedidos_id_cliente_fkey

ALTER TABLE
    Empregados RENAME TO Funcionarios


DML

EXERCICIO 1 -

INSERT INTO
    Clientes(Nome, Sobrenome, Email, Telefone)
VALUES
    ('João', 'Silva', 'joao@joao.com', '191841561'),
    ('Maria','Santos','maria@maria.com','1918941651'),
    ('Pedro','Ferreira','pedro@pedro.com','191915631'),
    ('Marcio','Costa','marcio@marcia.com','191616518'),
    ('Bernardo','Francisco','bernardo@bernardo.com','191491651');

EXERCICIO 2 -

INSERT INTO
    Pedidos(ID_Cliente, Data_Pedido, Total)
VALUES
    (1, '2024-04-15', 50.00),
    (2, '2024-04-16', 55.00),
    (3, '2024-04-17', 10.00),
    (4, '2024-04-18', 35.00),
    (5, '2024-04-19', 80.00),
    (6, '2024-04-20', 25.00),
    (7, '2024-04-21', 27.00),
    (8, '2024-04-22', 25.00),
    (9, '2024-04-23', 36.00),
    (10, '2024-04-24', 57.00);

EXERCICIO 3-

INSERT INTO
    Produtos(Nome, Descricao, Preco)
VALUES
    ('Camiseta', 'Camiseta Preta', 15.99),
    ('Camiseta', 'Camiseta Branca', 16.99),
    ('Camiseta', 'Camiseta Azul', 17.99),
    ('Camiseta', 'Camiseta Amarela', 18.99),
    ('Camiseta', 'Camiseta Roxa', 19.99),
    ('Camiseta', 'Camiseta Verde', 20.99),
    ('Camiseta', 'Camiseta Laranja', 21.99),
    ('Camiseta', 'Camiseta Cinza', 22.99),
    ('Camiseta', 'Camiseta Marrom', 23.99),
    ('Camiseta', 'Camiseta Lilas', 24.99),
    ('Camiseta', 'Camiseta Bege', 25.99),
    ('Camiseta', 'Camiseta Castanho', 26.99),
    ('Camiseta', 'Camiseta Jade', 27.99),
    ('Camiseta', 'Camiseta Rubro', 28.99),
    ('Camiseta', 'Camiseta Salmão', 29.99);

EXERCICIO 4 -

INSERT INTO
    Pedidos_Produtos(ID_Pedido, ID_Produto)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

EXERCICIO 5 -


INSERT INTO
    Categorias(Nome)
VALUES
    ('Camiseta'),
    ('Calça'),
    ('Bermuda');

INSERT INTO
    Produtos_Categorias
VALUES
    (1,1),
    (2,1),
    (3,1);

EXERCICIO 6 -


INSERT INTO
    Funcionarios(Nome, Sobrenome, Cargo)
VALUES
    ('Joao','Silva','Gerente'),
    ('Marcio','Jorge','Vendedor'),
    ('Bernardo','Marcio','Vendedor'),
    ('Pedro','Matheus','Atendente'),
    ('Jorge','Nicolas','Atendente');

EXERCICIO 7 -

INSERT INTO
    Vendas (ID_Produto,ID_Cliente, Data_Venda, Quantidade)
VALUES
    (1,1,'2024-04-15',20),
    (2,2,'2024-04-15',40);

EXERCICIO 8 -


UPDATE Produtos
SET Preco = 34.99
WHERE ID = 1;

EXERCICIO 9 -


UPDATE Funcionarios
SET Cargo = 'Gerente'
WHERE ID = 2;

EXERCICIO 10 -


DELETE FROM Clientes
WHERE ID = 2;

DELETE FROM Pedidos
WHERE ID_Cliente = 2;

EXERCICIO 11 -


DELETE FROM Vendas
WHERE ID_Produto = 2;

DELETE FROM Pedidos_Produtos
WHERE ID_Produto = 2;

DELETE FROM Produtos_Categorias
WHERE ID_Produto = 2;

DELETE FROM Produtos
WHERE ID = 2;

EXERCICIO 12 -


DELETE FROM Funcionarios
WHERE Nome = 'Joao' AND Sobrenome ='Silva';

EXERCICIO 13 -


ALTER TABLE Pedidos
ADD COLUMN Status VARCHAR(50) DEFAULT 'Em Andamento' NOT NULL;

SELECT * FROM Pedidos
WHERE Status = 'Em Andamento';

EXERCICIO 14 -


SELECT
    c.Nome as ID_Cliente,
    p.Data_Pedido,
    p.Total
FROM
    Pedidos p,
    Clientes c
WHERE
    p.ID_Cliente = c.ID
    AND p.Data_Pedido >= CURRENT_DATE - INTERVAL '30 days';

EXERCICIO 15 -


SELECT
    ID_Produto
FROM
    Produtos_Categorias
WHERE
    ID_Categoria = 1;
