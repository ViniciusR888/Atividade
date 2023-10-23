create database livraria;
use livraria;


CREATE TABLE Autores (
    AutorID INT PRIMARY KEY,
    NomeAutor VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50)
);


CREATE TABLE Livros (
    LivroID INT PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    AnoPublicacao INT,
    AutorID INT,
    ISBN VARCHAR(13),
    Preco DECIMAL(10, 2),
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);


CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    DataPedido DATE,
    ValorTotal DECIMAL(10, 2),
    LivroID INT,
    Quantidade INT,
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
);


CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    NomeCliente VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(15)
);


INSERT INTO Clientes (ClienteID, NomeCliente, Email, Telefone)
VALUES
    (1, 'João Silva', 'joao.silva@email.com', '(123) 4567-8901'),
    (2, 'Maria Santos', 'maria.santos@email.com', '(234) 5678-9012'),
    (3, 'Pedro Alves', 'pedro.alves@email.com', '(345) 6789-0123'),
    (4, 'Ana Pereira', 'ana.pereira@email.com', '(456) 7890-1234'),
    (5, 'Luís Mendes', 'luis.mendes@email.com', '(567) 8901-2345'),
    (6, 'Carla Ferreira', 'carla.ferreira@email.com', '(678) 9012-3456'),
    (7, 'José Santos', 'jose.santos@email.com', '(789) 0123-4567'),
    (8, 'Sofia Rodrigues', 'sofia.rodrigues@email.com', '(890) 1234-5678'),
    (9, 'Rui Gomes', 'rui.gomes@email.com', '(901) 2345-6789'),
    (10, 'Lúcia Silva', 'lucia.silva@email.com', '(012) 3456-7890'),
    (11, 'Eduardo Silva', 'eduardo.silva@email.com', '(123) 1234-5678'),
    (12, 'Aline Santos', 'aline.santos@email.com', '(234) 2345-6789'),
    (13, 'Roberto Ferreira', 'roberto.ferreira@email.com', '(345) 3456-7890'),
    (14, 'Patrícia Lima', 'patricia.lima@email.com', '(456) 4567-8901'),
    (15, 'Antônio Gomes', 'antonio.gomes@email.com', '(567) 5678-9012'),
    (16, 'Mariana Alves', 'mariana.alves@email.com', '(678) 6789-0123'),
    (17, 'Paulo Pereira', 'paulo.pereira@email.com', '(789) 7890-1234'),
    (18, 'Clara Rodrigues', 'clara.rodrigues@email.com', '(890) 8901-2345'),
    (19, 'Gustavo Silva', 'gustavo.silva@email.com', '(901) 9012-3456'),
    (20, 'Carolina Santos', 'carolina.santos@email.com', '(012) 0123-4567'),
    (21, 'Ricardo Ferreira', 'ricardo.ferreira@email.com', '(123) 3456-7890'),
    (22, 'Fernanda Lima', 'fernanda.lima@email.com', '(234) 2345-6789'),
    (23, 'Alexandre Gomes', 'alexandre.gomes@email.com', '(345) 7890-1234'),
    (24, 'Larissa Alves', 'larissa.alves@email.com', '(456) 5678-9012'),
    (25, 'Hugo Pereira', 'hugo.pereira@email.com', '(567) 6789-0123'),
    (26, 'Renata Rodrigues', 'renata.rodrigues@email.com', '(678) 3456-7890'),
    (27, 'Gilberto Silva', 'gilberto.silva@email.com', '(789) 2345-6789'),
    (28, 'Isabela Santos', 'isabela.santos@email.com', '(890) 0123-4567'),
    (29, 'Fábio Ferreira', 'fabio.ferreira@email.com', '(901) 7890-1234'),
    (30, 'Lorena Lima', 'lorena.lima@email.com', '(012) 5678-9012'),
    (31, 'Leonardo Alves', 'leonardo.alves@email.com', '(123) 6789-0123'),
    (32, 'Viviane Pereira', 'viviane.pereira@email.com', '(234) 0123-4567'),
    (33, 'André Gomes', 'andre.gomes@email.com', '(345) 2345-6789'),
    (34, 'Daniela Rodrigues', 'daniela.rodrigues@email.com', '(456) 6789-0123'),
    (35, 'Marcelo Silva', 'marcelo.silva@email.com', '(567) 7890-1234'),
    (36, 'Tatiana Santos', 'tatiana.santos@email.com', '(678) 5678-9012'),
    (37, 'Diego Ferreira', 'diego.ferreira@email.com', '(789) 0123-4567'),
    (38, 'Liliana Lima', 'liliana.lima@email.com', '(890) 3456-7890'),
    (39, 'Gonçalo Alves', 'goncalo.alves@email.com', '(901) 2345-6789'),
    (40, 'Marina Pereira', 'marina.pereira@email.com', '(012) 7890-1234'),
    (41, 'Sérgio Rodrigues', 'sergio.rodrigues@email.com', '(123) 5678-9012'),
    (42, 'Marta Silva', 'marta.silva@email.com', '(234) 6789-0123'),
    (43, 'Vitor Santos', 'vitor.santos@email.com', '(345) 2345-6789'),
    (44, 'Amanda Ferreira', 'amanda.ferreira@email.com', '(456) 0123-4567'),
    (45, 'Carlos Lima', 'carlos.lima@email.com', '(567) 5678-9012'),
    (46, 'Caroline Alves', 'caroline.alves@email.com', '(678) 6789-0123'),
    (47, 'Joaquim Pereira', 'joaquim.pereira@email.com', '(789) 3456-7890'),
    (48, 'Luana Rodrigues', 'luana.rodrigues@email.com', '(890) 5678-9012'),
    (49, 'Mário Silva', 'mario.silva@email.com', '(901) 7890-1234'),
    (50, 'Catarina Santos', 'catarina.santos@email.com', '(012) 5678-9012');
    

INSERT INTO Autores (AutorID, NomeAutor, Nacionalidade)
VALUES
    (1, 'Carlos Silva', 'Brasileira'),
    (2, 'Maria Santos', 'Brasileira'),
    (3, 'Pedro Alves', 'Portuguesa'),
    (4, 'Ana Pereira', 'Brasileira'),
    (5, 'Luis González', 'Espanhola'),
    (6, 'Elena Rodríguez', 'Espanhola'),
    (7, 'Javier Martínez', 'Espanhola'),
    (8, 'Marta López', 'Espanhola'),
    (9, 'Emily Johnson', 'Americana'),
    (10, 'John Smith', 'Americana'),
    (11, 'Hans Müller', 'Alemã'),
    (12, 'Franz Wagner', 'Alemã'),
    (13, 'Sophie Dupont', 'Francesa'),
    (14, 'Pierre Leclerc', 'Francesa'),
    (15, 'Giuseppe Rossi', 'Italiana');



INSERT INTO Livros (LivroID, Titulo, AnoPublicacao, AutorID, ISBN, Preco)
VALUES
    (1, 'Aventuras de Um Viajante', 2005, 1, '9781234567890', 25.99),
    (2, 'Noites Estreladas', 2010, 2, '9789876543210', 18.50),
    (3, 'O Segredo do Sucesso', 2015, 3, '9781111222233', 30.75),
    (4, 'Caminho Para a Felicidade', 2008, 4, '9784444555566', 15.99),
    (5, 'As Aventuras de Sofia', 2012, 5, '9785555666677', 12.25),
    (6, 'Viagem à Lua', 2000, 6, '9786666777788', 10.99),
    (7, 'A Ilha Misteriosa', 2005, 7, '9787777888899', 28.75),
    (8, 'Os Tesouros de Aladim', 2018, 8, '9788888999900', 22.50),
    (9, 'A Arte da Guerra', 2010, 9, '9789999000011', 16.99),
    (10, 'O Código Da Vinci', 2003, 10, '9781010101010', 32.99),
    (11, 'Dom Quixote', 1605, 11, '9781212121212', 19.50),
    (12, 'Alice no País das Maravilhas', 1865, 12, '9781313131313', 24.75),
    (13, 'O Pequeno Príncipe', 1943, 13, '9781414141414', 17.99),
    (14, 'Em Busca do Tempo Perdido', 1913, 14, '9781515151515', 29.50),
    (15, 'Hamlet', 1603, 15, '9781616161616', 12.25);



INSERT INTO Pedidos (PedidoID, DataPedido, ValorTotal, LivroID, Quantidade)
VALUES
    (16, '2023-09-16', 22.99, 1, 3),
    (17, '2023-09-17', 18.75, 2, 2),
    (18, '2023-09-18', 14.99, 3, 4),
    (19, '2023-09-19', 26.50, 4, 1),
    (20, '2023-09-20', 19.99, 5, 2),
    (21, '2023-09-21', 29.99, 6, 3),
    (22, '2023-09-22', 17.75, 7, 2),
    (23, '2023-09-23', 32.50, 8, 1),
    (24, '2023-09-24', 21.99, 9, 4),
    (25, '2023-09-25', 27.75, 10, 1),
    (26, '2023-09-26', 18.50, 11, 2),
    (27, '2023-09-27', 24.99, 12, 3),
    (28, '2023-09-28', 29.75, 13, 1),
    (29, '2023-09-29', 15.99, 14, 2),
    (30, '2023-09-30', 28.50, 15, 5),
    (31, '2023-10-01', 20.99, 1, 2),
    (32, '2023-10-02', 16.75, 2, 3),
    (33, '2023-10-03', 24.50, 3, 1),
    (34, '2023-10-04', 18.99, 4, 4),
    (35, '2023-10-05', 21.75, 5, 2),
    (36, '2023-10-06', 23.99, 6, 3),
    (37, '2023-10-07', 26.50, 7, 1),
    (38, '2023-10-08', 19.99, 8, 2),
    (39, '2023-10-09', 15.75, 9, 3),
    (40, '2023-10-10', 28.50, 10, 1);


select * from pedidos;
select * from clientes;
select * from livros;
select * from autores;



