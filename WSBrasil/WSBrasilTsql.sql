IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'BancoRomullus') -- CRIA BANCO DE DADOS
  CREATE DATABASE BancoRomullus;
  ELSE
  PRINT '[ERRO!] Esse Banco Já Existe';

USE BancoRomullus;

select * from tipocontato;
SELECT * FROM contatosite;
select * from sys.databases;
select * from sys.tables;

------------------------------------------------------------------------------------
-- CRIA TABELA SE NÃO EXISTIR --

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tipocontato')
  CREATE TABLE tipocontato (
	id int primary key identity(1,1),
	nome varchar(80)not null);
ELSE PRINT '[ERRO] Tabela Já Criada!';

------------------------------------------------------------------------------------
-- CRIA TABELA SE NÃO EXISTIR --

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'contatosite')
  CREATE TABLE contatosite (
	id int primary key identity(1,1),
	nome varchar(80) not null,
	email varchar(80) not null,
	mensagem text not null,
	datahora datetime not null,
	fk_tipocontato_id int
);ELSE PRINT '[ERRO] Tabela Já Criada!';
GO
-------------------------------------------------------------------------------------
-- INSERE TIPO DE CONTATO --

CREATE PROCEDURE InserirDados
@nome varchar(80)
AS
BEGIN
	insert into tipocontato(nome) VALUES (@nome);
END;
EXEC inserirDados @nome = 'Elogio';
GO

--------------------------------------------------------------------------------------
-- APAGA UM TIPO DE CONTATO --

CREATE PROCEDURE DeletandoDados --APAGA DADOS DO TIPO CONTATO
@id_tipo INT
AS
BEGIN
  DELETE FROM tipocontato WHERE id = @id_tipo
END;
EXEC DeletandoDados @id_tipo = 1;
GO

---------------------------------------------------------------------------------------
-- INSERINDO CLIENTES --

IF OBJECT_ID('InserindoContato','P') IS NOT NULL-- PROCEDIMENTO SERÁ DELETADO, SE JA TIVE SIDO CRIADO
BEGIN
	PRINT 'Procedimento já criado, Apagando procedimento...';
	DROP PROCEDURE InserindoContato;
END
ELSE 
	PRINT 'Procedimento ainda não criado';
 GO

CREATE PROCEDURE InserindoContato 
@nome varchar(80), @email varchar(80), @mensagem text, @data datetime, @chave int
AS
BEGIN
	insert into contatosite (nome,email,mensagem,datahora,fk_tipocontato_id) 
	VALUES (@nome,@email,@mensagem,@data,@chave);
END
EXEC inserindoContato @nome = 'Camila santos', @email ='bombom312@gmail.com', 
@mensagem ='Sem imoveis com garagem', @data ='2023-03-25T04:22:09', @chave = 1;
GO

----------------------------------------------------------------------------------------
-- APAGA CLIENTES --

CREATE PROCEDURE DeletandoCliente 
@id INT
AS
BEGIN
  DELETE FROM contatosite WHERE id = @id;
END
EXEC DeletandoCliente @id = 7;
GO

----------------------------------------------------------------------------------------
-- CONSULTA TODOS OS CLIENTES --

CREATE PROCEDURE Consulta
AS
BEGIN
SELECT ContatoSite.Nome,ContatoSite.Email,ContatoSite.Mensagem,
ContatoSite.DataHora, TipoContato.nome AS Tipo FROM ContatoSite
LEFT JOIN TipoContato ON ContatoSite.fk_TipoContato_Id = TipoContato.Id; --where ContatoSite.Id = @id
END
EXEC consulta ;

drop procedure Consulta;

---------------------------------------------------------------------------------------

ALTER TABLE ContatoSite ADD CONSTRAINT FK_ContatoSite_2
    FOREIGN KEY (fk_TipoContato_Id)
    REFERENCES TipoContato (Id)
    ON DELETE CASCADE;