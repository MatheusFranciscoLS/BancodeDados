CREATE DATABASE aula_01_04;

EXERCICIO 1: CREATE TABLE IF NOT EXISTS fornecedor (
    fcodigo INT NOT NULL PRIMARY KEY,
    -- Identificador único para cada fornecedor, não pode ser nulo
    fnome VARCHAR(255) NOT NULL,
    -- Nome do fornecedor, não pode ser nulo
    status BOOLEAN DEFAULT 'TRUE',
    -- Status do fornecedor, assumindo que você deseja um indicador booleano (ativo/inativo)
    cidade VARCHAR(255) -- Nome da cidade, pode ser nulo
);

CREATE TABLE IF NOT EXISTS peca (
    pcodigo INT NOT NULL PRIMARY KEY,
    -- Identificador único para cada peça, não pode ser nulo
    pnome VARCHAR(255) NOT NULL,
    -- Nome da peça, não pode ser nulo
    cor VARCHAR(50) NOT NULL,
    -- Cor da peça, não pode ser nulo
    peso DECIMAL(10, 2) NOT NULL,
    -- Peso da peça, não pode ser nulo. Ajuste a precisão e escala conforme necessário.
    cidade VARCHAR(255) NOT NULL -- Nome da cidade, não pode ser nulo
);

CREATE TABLE IF NOT EXISTS instituicao (
    icodigo INT NOT NULL PRIMARY KEY,
    -- Identificador único para cada instituição, não pode ser nulo
    nome VARCHAR(255) NOT NULL -- Nome da instituição, não pode ser nulo
);

CREATE TABLE IF NOT EXISTS projeto(
    prcodigo INT NOT NULL PRIMARY KEY,
    prnome VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    icodigo INT NOT NULL,
    FOREIGN KEY (icodigo) REFERENCES instituicao(icodigo)
);

CREATE TABLE fornecimento(
    fcodigo INT NOT NULL,
    pcodigo INT NOT NULL,
    prcodigo INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (fcodigo, pcodigo, prcodigo),
    FOREIGN KEY (fcodigo) REFERENCES fornecedor(fcodigo),
    FOREIGN KEY (pcodigo) REFERENCES peca(pcodigo),
    FOREIGN KEY (prcodigo) REFERENCES projeto(prcodigo)
);

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * EXERCICIO 2:
-- Adiciona as colunas fone e Ccod à tabela fornecedor
ALTER TABLE fornecedor
    ADD COLUMN fone VARCHAR(20),
    ADD COLUMN Ccod INT NOT NULL;

-- Adiciona a chave estrangeira para a tabela cidade
ALTER TABLE fornecedor
    ADD FOREIGN KEY (Ccod) REFERENCES cidade(Ccod);

-- Remove a coluna cidade da tabela fornecedor
ALTER TABLE fornecedor
    DROP COLUMN cidade;

CREATE TABLE cidade(
    Ccod INT NOT NULL PRIMARY KEY,
    Cnome INT NOT NULL,
    uf VARCHAR(10) NOT NULL
);

ALTER TABLE peca
    ADD FOREIGN KEY (Ccod) REFERENCES cidade(Ccod);

ALTER TABLE peca
    DROP COLUMN cidade;

ALTER TABLE projeto
    ADD FOREIGN KEY (Ccod) REFERENCES cidade(Ccod);

ALTER TABLE projeto
    DROP COLUMN cidade;

DROP TABLE IF EXISTS instituicao;