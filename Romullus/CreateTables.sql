IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Romullus') -- CRIA BANCO DE DADOS
  CREATE DATABASE Romullus;
  ELSE PRINT '[ERRO!] Esse Banco Já Existe';

USE Romullus;

CREATE TABLE TipoUsuario (
    ID INT PRIMARY KEY identity(1,1),
    Tipo VARCHAR(80)
);


CREATE TABLE Usuario (
    ID INT PRIMARY KEY identity(1,1),
    Nome VARCHAR(120),
    Senha VARCHAR(32),
    DataHoraCriacao DATETIME,
    DataHoraUltimoAcesso DATETIME,
    Email VARCHAR(120),
    fk_TipoUsuario_ID INT
);


CREATE TABLE Login (
    Id INT PRIMARY KEY identity(1,1),
    Email VARCHAR(120),
    Senha VARCHAR(32),
    fk_Usuario_ID INT
);


CREATE TABLE TipoContato (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR (80)
);


CREATE TABLE ContatoSite (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(80) NOT NULL,
	Email VARCHAR(80) NOT NULL,
	Mensagem TEXT ,
	DataHora DATETIME,
	fk_TipoContato_Id INT
);


CREATE TABLE UF (
    ID INT PRIMARY KEY identity(1,1),
    Nome_UF VARCHAR(50),
    Sigla_UF VARCHAR(10)
);


CREATE TABLE Cidade (
    Nome_cidade VARCHAR(50),
    ID INT PRIMARY KEY identity(1,1),
    fk_UF_ID INT
);


CREATE TABLE Bairro (
    ID INT PRIMARY KEY identity(1,1),
    Nome_bairro VARCHAR(50),
    fk_Cidade_ID INT
);


CREATE TABLE Endereco (
    ID INT PRIMARY KEY identity(1,1),
    Logradouro VARCHAR(120),
    Numero VARCHAR(50),
    Complemento VARCHAR(120),
    fk_Bairro_ID INT,
   );


CREATE TABLE TipoAnuncio (
    ID INT PRIMARY KEY identity(1,1),
    Nome_Tipo_Anuncio VARCHAR(80)
);


CREATE TABLE TipoImovel (
    ID INT PRIMARY KEY identity(1,1),
    NomeTipoImovel VARCHAR(80)
);


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


CREATE TABLE Imagem (
    ID INT PRIMARY KEY identity(1,1),
    Nome_Imagem VARCHAR(120),
    url VARCHAR(120),
    fk_Imovel_ID INT
);


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tipocontato')
  CREATE TABLE tipocontato (
	id int primary key identity(1,1),
	nome varchar(80)not null);
ELSE PRINT '[ERRO] Tabela Já Criada!';


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'contatosite')
  CREATE TABLE contatosite (
	id int primary key identity(1,1),
	nome varchar(80) not null,
	email varchar(80) not null,
	mensagem text not null,
	datahora datetime not null,
	fk_tipocontato_id int
);ELSE PRINT '[ERRO] Tabela Já Criada!';
