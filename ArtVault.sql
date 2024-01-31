-- Create ArtVault database
CREATE DATABASE ArtVault;
go

-- Use ArtVault database
USE ArtVault;
go

-- Create Utilizador table
CREATE TABLE Utilizador (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(50),
    nome VARCHAR(50),
    morada VARCHAR(100),
    NIF INT,
    CC INT,
    tipoConta TINYINT,
    ativo BIT
);

-- Insert Utilizador Padrao into Utilizador table
-- INSERT INTO Utilizador (username, password, email, nome, morada, NIF, CC, tipoConta, ativo)
-- VALUES ('testuser', 'testpassword', 'testuser@example.com', 'Test User', '123 Test Street', 123456789, 987654321, 1, 1);
-- go

-- Insert Admin into Utilizador table
INSERT INTO Utilizador (username, password, email, nome, morada, NIF, CC, tipoConta, ativo)
VALUES ('admin', 'adminpassword', 'admin@example.com', 'Admin User', 'Admin Street', 987654321, 123456789, 3, 1);


-- Create Leilao table
CREATE TABLE Leilao (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_utilizador INT FOREIGN KEY REFERENCES Utilizador(id),
    dataCom DATETIME,
    dataFim DATETIME,
    nome VARCHAR(50),
    precoReferencia INT,
    precoReserva INT NULL,
    imagem VARCHAR(500),
    dimensoes VARCHAR(50),
    descricao VARCHAR(500) NULL,
	tipoLeilao TINYINT
);
go

-- Insert into Leilao table
-- INSERT INTO Leilao (id_utilizador, dataCom, dataFim, nome, precoReferencia, precoReserva, imagem, dimensoes, descricao, tipoLeilao)
-- VALUES (1, GETDATE(), GETDATE() + 7, 'Auction 1', 200, 150, 'auction1_image.jpg', '20x30', 'Auction 1 Description', 1);
-- go


-- Create Lance table
CREATE TABLE Lance (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_utilizador INT FOREIGN KEY REFERENCES Utilizador(id),
    id_leilao INT FOREIGN KEY REFERENCES Leilao(id),
    dataHora DATETIME, 
    valor INT
);
go

-- Insert into Lance table
-- INSERT INTO Lance (id_utilizador, id_leilao, dataHora, valor)
-- VALUES (1, 1, GETDATE(), 180);
-- go

-- Create Watchlist table
CREATE TABLE Watchlist (
    id_utilizador INT,
    id_leilao INT,
    PRIMARY KEY (id_utilizador, id_leilao),
    FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id),
    FOREIGN KEY (id_leilao) REFERENCES Leilao(id)
);
go

-- Insert into Watchlist table
-- INSERT INTO Watchlist (id_utilizador, id_leilao)
-- VALUES (1, 1);
-- go
