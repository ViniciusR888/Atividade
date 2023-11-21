CREATE DATABASE Romullus;
select * from sys.tables;

USE Romullus;

------------------------------------------------------------------------------------

CREATE TABLE ContatoSite (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(80) NOT NULL,
	Email VARCHAR(80) NOT NULL,
	Mensagem TEXT ,
	DataHora DATETIME,
	fk_TipoContato_Id INT
);

INSERT INTO ContatoSite (Nome,Email,Mensagem,DataHora,fk_TipoContato_Id) VALUES 
('Ana Clara Souza','ana.clara.souza@gmail.com','','2023-01-01T09:43:00',1),('Bruno Lima Santos','bruno.lima.santos@hotmail.com','','2023-08-12T12:34:56',5),
('Carla Fernandes Silva','carla.fernandes.silva@yahoo.com.br','','2023-09-02T09:37:21',3),('Daniel Costa Oliveira','daniel.costa.oliveira@outlook.com','','2023-05-16T15:00:00',2),
('Eduardo Alves Rocha:','eduardo.alves.rocha@uol.com.br','','2023-06-21T13:54:04',1),('Fernanda Dias Martins','fernanda.dias.martins@bol.com.br','','2023-10-01T22:12:09',5),
('Guilherme Ribeiro Gomes','guilherme.ribeiro.gomes@gmail.com','','2023-03-31T05:07:01',5),('Helena Mendes Carvalho','helena.mendes.carvalho@hotmail.com','','2023-04-29T08:33:03',2),
('Igor Nunes Ferreira','igor.nunes.ferreira@yahoo.com.br','','2023-07-21T05:43:21',4),('Julia Rodrigues Almeida','julia.rodrigues.almeida@outlook.com','','2023-03-11T15:43:55',4);

SELECT * FROM ContatoSite;

---------------------------------------------------------------------------------------------------
CREATE TABLE TipoContato (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR (80)
);

SELECT * FROM TipoContato;

INSERT INTO TipoContato (Nome) VALUES ('Quero vender'),('Não encontrei um imovel'),
('Critica'),('Não encontrei um corretor'),('Quero comprar');
----------------------------------------------------------------------------------------------------
CREATE TABLE TipoUsuario (
    ID INT PRIMARY KEY identity(1,1),
    Tipo VARCHAR(80)
);

SELECT * from TipoUsuario;

INSERT INTO TipoUsuario (Tipo)VALUES
('Corretor'),('Cliente'),('Administrativo'),('Financeiro');
-------------------------------------------------------------------------------------------------------
CREATE TABLE Usuario (
    ID INT PRIMARY KEY identity(1,1),
    Nome VARCHAR(120),
    Senha VARCHAR(32),
    DataHoraCriacao DATETIME,
    DataHoraUltimoAcesso DATETIME,
    Email VARCHAR(120),
    fk_TipoUsuario_ID INT
);

SELECT * FROM Usuario;

INSERT INTO Usuario (Nome,Senha,DataHoraCriacao,DataHoraUltimoAcesso,Email,fk_TipoUsuario_ID)VALUES
('João Carlos','494009d6ad36e1caa1b05e7cc98ab48f','2023','2023','joaocarlos@gmail.com',1),
('Ana Clara','8277e0910d750195b448797616e091ad','2023','2023','anaclara@hotmail.com',1),
('Bruno Silva','c9f0f895fb98ab9159f51fd0297e236d','2023','2023','brunosilva@yahoo.com',2),
('Erika Santos','0cc175b9c0f1b6a831c399e269772661','2023','2023','erikasantos@outlook.com',3),
('Daniel Souza','e4da3b7fbbce2345d7772b0674a318d5','2023','2023','danielsouza@msn.com',2),
('Carla Lima','45c48cce2e2d7fbdea1afc51c7c6ad26','2023','2023','carlalima@gmail.com',2),
('Fabio Oliveira','92eb5ffee6ae2fec3ad71c777531578f','2023','2023','fabiooliveira@hotmail.com',4),
('Gisele Costa','1679091c5a880faf6fb5e6087eb1b2dc','2023','2023','giselecosta@yahoo.com',2),
('Hugo Fernandes','d3d9446802a44259755d38e6d163e820','2023','2023','hugofernandes@outlook.com',2),
('Isabela Rocha','4a8a08f09d37b73795649038408b5f33','2023','2023','isabelarocha@msn.com',2),
('Cleyton Correa','8f14e45fceea167a5a36dedd4bea2543','2023','2023','cleytin9912@gmail.com',2),
('Manoel Gomes','c4ca4238a0b923820dcc509a6f75849b','2023','2023','manoelgomes@gmail.com',2);

------------------------------------------------------------------------------------------------------
CREATE TABLE Cidade (
    Nome_cidade VARCHAR(50),
    ID INT PRIMARY KEY identity(1,1),
    fk_UF_ID INT
);

INSERT INTO Cidade (Nome_cidade,fk_UF_ID)VALUES 
('Taguatinga',1),('Águas Claras',1),('Plano Piloto',1),
('São Paulo',2),('Campinas',2),('Santos',2),
('Niterói',3),('Petrópolis',3),('Angra dos Reis',3),
('Belo Horizonte',4),('Uberlândia',4),('Uberaba',4),
('Porto Alegre',5),('Caxias do Sul',5),('Pelotas',5),
('Vitória da Conquista',6),('Feira de Santana',6),('Salvador',6),
('Olinda',7),('Jaboatão dos Guararapes',7),('Recife',7),
('Goiânia',8),('Anápolis',8),('Rio Verde',8),
('Boa Vista',9),('Rorainópolis',9),('Caracaraí',9),
('Blumenau',10),('Florianópolis',10),('Joinville',10);

SELECT * FROM Cidade;
---------------------------------------------------------------------------------------------
CREATE TABLE Bairro (
    ID INT PRIMARY KEY identity(1,1),
    Nome_bairro VARCHAR(50),
    fk_Cidade_ID INT
);

INSERT INTO Bairro (Nome_bairro,fk_Cidade_ID) VALUES 
('Taguatinga Norte',1),('Taguatinga Sul',1),('Águas Claras Vertical',2),('Asa Sul',3),
('Asa Norte',3),('Pinheiros',4),('Candeias',16),('Cambuí',5),
('Taquaral',5),('Gonzaga',6),('Valparaíso',8),('Anchieta',10),
('Buritis',10),('Setor Marista',22),('Bairro Jundiaí',23),('Santa Mônica',11),
('Bela Vista',13),('Recanto de Portugal',15),('Beira Rio',21),('Campeche',29);

SELECT * FROM Bairro;

-------------------------------------------------------------------------------------------
CREATE TABLE UF (
    ID INT PRIMARY KEY identity(1,1),
    Nome_UF VARCHAR(50),
    Sigla_UF VARCHAR(10)
);

INSERT INTO UF (Nome_UF,Sigla_UF) VALUES 
('Distrito Federal','DF'),('São Paulo','SP'),('Rio De Janeiro','RJ'),
('Minas Gerais','MG'),('Rio Grande Do Sul','RS'),('Bahia','BA'),
('Pernambuco','PE'),('Goias','GO'),('Roraima','RR'),('Santa Catarina','SC');


----------------------------------------------------------------------------------------------
CREATE TABLE Endereco (
    ID INT PRIMARY KEY identity(1,1),
    Logradouro VARCHAR(120),
    Numero VARCHAR(50),
    Complemento VARCHAR(120),
    fk_Bairro_ID INT,
   );

select * from Endereco;

INSERT INTO Endereco (Logradouro, Numero,Complemento,fk_Bairro_ID)VALUES
('Rua das Flores',123,' Apto 1',2),
('Avenida dos Pássaros',456,'Casa 2',5),
('Alameda dos Ipês',101,'Sala 3',8),
('Travessa da Esperança',222,'Lote 4',11),
('Largo da Paz',333,'Conjunto 5',17),
('Rodovia do Sol',555,'Apartamento 6',1),
('Beco das Estrelas',777,'Kitnet 7',3),
('Via da Harmonia',888,'Unidade 8',13),
('Rua do Progresso',999,'Barracão 9',4),
('Avenida da Alegria',111,'Loja 10',7),
('Praia da Felicidade',121,'Galpão 11',14),
('Rua da Serenidade',131,'Sobrado 12',19),
('Estrada da Prosperidade',141,'Cobertura 13',18),
('Travessia da Fortuna',151,'Andar 14',5),
('Viela da Tranquilidade',161,'Apartamento 15',17),
('Praça da Liberdade',789,'Bloco A',20);

------------------------------------------------------------------------------------------------
CREATE TABLE TipoAnuncio (
    ID INT PRIMARY KEY identity(1,1),
    Nome_Tipo_Anuncio VARCHAR(80)
);

INSERT INTO TipoAnuncio (Nome_Tipo_Anuncio)
VALUES ('Venda'),('Aluguel');

------------------------------------------------------------------------------------------------
CREATE TABLE Imovel (
    Qtd_vaga INT,
    Qtd_quarto INT,
    Qtd_suite INT,
    Qtd_banheiro INT,
    Comodidade TEXT,
    Area_util INT,
    Valor_imovel DECIMAL,
    ID INT PRIMARY KEY identity(1,1),
    Observacoes TEXT,
    fk_TipoImovel_ID INT,
    fk_TipoAnuncio_ID INT,
	fk_Endereco_ID INT
);

SELECT * FROM Imovel;

INSERT INTO Imovel (Qtd_vaga, Qtd_quarto,Qtd_suite,Qtd_banheiro,Comodidade,Area_util,Valor_imovel,Observacoes,fk_TipoImovel_ID,fk_TipoAnuncio_ID,fk_Endereco_ID)VALUES 
(2, 3, 1, 2, 'Jardim', 180, 500000.00, 'Próximo a escolas e parques',1,1,1),
(1, 2, 1, 1, 'Academia', 100, 350000.00, 'Vista panorâmica da cidade',1,1,2),
(3, 4, 2, 3, 'Piscina Privativa', 250, 1200000.00, 'Terraço com churrasqueira',1,2,3),
(2, 3, 2, 2, 'Lareira', 150, 450000.00, 'Ótima localização',2,1,4),
(1, 1, 1, 1, 'Varanda', 80, 200000.00, 'Ideal para solteiros',1,2,5),
(2, 4, 2, 3, 'Jardim de Inverno', 200, 600000.00, 'Rua tranquila',1,2,6),
(1, 2, 1, 2, 'Piscina Comum', 120, 300000.00, 'Condomínio fechado',2,1,7),
(2, 3, 1, 2, 'Churrasqueira', 160, 400000.00, 'Aceita financiamento',1,1,8),
(3, 5, 3, 4, 'Sauna', 300, 900000.00, 'Próximo ao comércio local',1,2,9),
(2, 4, 2, 3, 'Lavanderia', 180, 550000.00, 'Vista para o mar',2,1,10),
(1, 3, 1, 2, 'Espaço Gourmet', 150, 420000.00, 'Fácil acesso à rodovia',2,1,11),
(2, 2, 2, 1, 'Salão de Festas', 120, 380000.00, 'Mobiliado',1,2,12),
(3, 4, 2, 3, 'Pátio Externo', 220, 700000.00, 'Segurança 24 horas',1,1,13),
(1, 2, 1, 1, 'Bicicletário', 90, 250000.00, 'Condomínio sustentável',1,1,14),
(2, 3, 2, 2, 'Quadra Poliesportiva', 170, 480000.00, 'Área de lazer completa',1,2,15),
(1, 1, 1, 1, 'Sala de Estudo', 75, 180000.00, 'Ideal para estudantes',4,1,16);


-------------------------------------------------------------------------------------------------
CREATE TABLE TipoImovel (
    ID INT PRIMARY KEY identity(1,1),
    NomeTipoImovel VARCHAR(80)
);

INSERT INTO TipoImovel (NomeTipoImovel)VALUES
('Casa'),('Apartamento'),('Fazenda'),('Imovel Comercial');

SELECT * FROM TipoImovel;
------------------------------------------------------------------------------------------------
CREATE TABLE Imagem (
    ID INT PRIMARY KEY identity(1,1),
    Nome_Imagem VARCHAR(120),
    url VARCHAR(120),
    fk_Imovel_ID INT
);

INSERT INTO Imagem(Nome_Imagem,url, fk_Imovel_ID)VALUES
('Imovel-1','WSBRASIL\Fotos\2001.jpeg',1),('Imovel-1','WSBRASIL\Fotos\2002.jpeg',1),
('Imovel-1','WSBRASIL\Fotos\2003.jpg',1),('Imovel-2','WSBRASIL\Fotos\3001.jpeg',2),
('Imovel-2','WSBRASIL\Fotos\3002.jpeg',2),('Imovel-3','WSBRASIL\Fotos\4001.jpeg',3),
('Imovel-3','WSBRASIL\Fotos\4002.jpeg',3),('Imovel-3','WSBRASIL\Fotos\4003.jpg',3),
('Imovel-4','WSBRASIL\Fotos\5001.jpeg',4),('Imovel-4','WSBRASIL\Fotos\5002.jpeg',4),
('Imovel-4','WSBRASIL\Fotos\5003.jpeg',4),('Imovel-5','WSBRASIL\Fotos\6001.jpeg',5),
('Imovel-5','WSBRASIL\Fotos\6002.jpeg',5),('Imovel-5','WSBRASIL\Fotos\6003.jpeg',5),
('Imovel-6','WSBRASIL\Fotos\7001.jpeg',6),('Imovel-6','WSBRASIL\Fotos\7002.jpeg',6),
('Imovel-6','WSBRASIL\Fotos\7003.jpeg',6),('Imovel-7','WSBRASIL\Fotos\8002.jpeg',7),
('Imovel-7','WSBRASIL\Fotos\8003.jpeg',7),('Imovel-8','WSBRASIL\Fotos\9001.jpeg',8),
('Imovel-8','WSBRASIL\Fotos\9002.jpeg',8),('Imovel-8','WSBRASIL\Fotos\9003.jpeg',8),
('Imovel-9','WSBRASIL\Fotos\10001.jpeg',9),('Imovel-9','WSBRASIL\Fotos\10002.jpeg',9),
('Imovel-9','WSBRASIL\Fotos\10003.jpeg',9),('Imovel-10','WSBRASIL\Fotos\11001.jpg',10),
('Imovel-10','WSBRASIL\Fotos\11003.jpeg',10),('Imovel-11','WSBRASIL\Fotos\12001.jpeg',11),
('Imovel-11','WSBRASIL\Fotos\12002.jpg',11),('Imovel-12','WSBRASIL\Fotos\13001.jpg',12),
('Imovel-12','WSBRASIL\Fotos\13002.jpg',12),('Imovel-12','WSBRASIL\Fotos\13003.jpeg',12),
('Imovel-13','WSBRASIL\Fotos\14001.jpeg',13),('Imovel-13','WSBRASIL\Fotos\14002.jpeg',13),
('Imovel-13','WSBRASIL\Fotos\14003.jpeg',13),('Imovel-14','WSBRASIL\Fotos\15001.jpeg',14),
('Imovel-14','WSBRASIL\Fotos\15002.jpeg',14),('Imovel-14','WSBRASIL\Fotos\15003.jpeg',14),
('Imovel-15','WSBRASIL\Fotos\17001.jpeg',15),('Imovel-15','WSBRASIL\Fotos\17002.jpeg',15),
('Imovel-15','WSBRASIL\Fotos\17003.jpeg',15);

SELECT * FROM Imagem;
--------------------------------------
CREATE TABLE Login (
    Id INT PRIMARY KEY identity(1,1),
    Email VARCHAR(120),
    Senha VARCHAR(32),
    fk_Usuario_ID INT
);

INSERT INTO Login (Email,Senha,fk_Usuario_ID) VALUES 
('joaocarlos@gmail.com','494009d6ad36e1caa1b05e7cc98ab48f',1),
('anaclara@hotmail.com','0cc175b9c0f1b6a831c399e269772661',2),
('brunosilva@yahoo.com','92eb5ffee6ae2fec3ad71c777531578f',3),
('erikasantos@outlook.com','4a8a08f09d37b73795649038408b5f33',4),
('danielsouza@msn.com','8277e0910d750195b448797616e091ad',5),
('carlalima@gmail.com','8277e0910d750195b448797616e091ad',6),
('fabiooliveira@hotmail.com','1679091c5a880faf6fb5e6087eb1b2dc',7),
('giselecosta@yahoo.com','1679091c5a880faf6fb5e6087eb1b2dc',8),
('hugofernandes@outlook.com','c9f0f895fb98ab9159f51fd0297e236d',9),
('isabelarocha@msn.com','45c48cce2e2d7fbdea1afc51c7c6ad26',10),
('cleytin9912@gmail.com','d3d9446802a44259755d38e6d163e820',11),
('manoelgomes@gmail.com','c4ca4238a0b923820dcc509a6f75849b',12);

-------------------------------------------------------------------------------------------------
ALTER TABLE ContatoSite ADD CONSTRAINT FK_ContatoSite_2
	FOREIGN KEY (FK_TipoContato_Id)
	REFERENCES TipoContato(Id)
	ON DELETE CASCADE; 

ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_4
    FOREIGN KEY (fk_Endereco_ID)
    REFERENCES Endereco (ID)
	ON DELETE CASCADE;
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_TipoUsuario_ID)
    REFERENCES TipoUsuario (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_UF_ID)
    REFERENCES UF (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (fk_Cidade_ID)
    REFERENCES Cidade (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (fk_Bairro_ID)
    REFERENCES Bairro (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_3
    FOREIGN KEY (fk_Imovel_ID)
    REFERENCES Imovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_2
    FOREIGN KEY (fk_TipoImovel_ID)
    REFERENCES TipoImovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_3
    FOREIGN KEY (fk_TipoAnuncio_ID)
    REFERENCES TipoAnuncio (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imagem ADD CONSTRAINT FK_Imagem_2
    FOREIGN KEY (fk_Imovel_ID)
    REFERENCES Imovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Login ADD CONSTRAINT FK_Login_2
    FOREIGN KEY (fk_Usuario_ID)
    REFERENCES Usuario (ID)
    ON DELETE CASCADE;