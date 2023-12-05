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
EXEC consulta;

drop procedure Consulta;

---------------------------------------------------------------------------------------------
-- CONSULTA DE UM IMOVEL POR TIPO DE IMOVEL (apartamento,casa...) --

CREATE PROCEDURE TIPO
@idtipo INT
AS
BEGIN
	SELECT * FROM Imovel JOIN TipoImovel ON Imovel.fk_TipoImovel_ID = TipoImovel.ID WHERE fk_TipoImovel_ID = @idtipo;
END

EXEC TIPO @idtipo = 2;--(apartamento)--

-----------------------------------------------------------------------------------------------
-- CONSULTA DE UM TIPO DE ANUNCIO (venda,aluguel...) --

CREATE PROCEDURE Tipoanuncioss
@tipo INT
AS
BEGIN
	SELECT  * FROM Imovel JOIN TipoAnuncio ON Imovel.fk_TipoAnuncio_ID = TipoAnuncio.ID WHERE fk_TipoAnuncio_ID = @tipo; 
END

EXEC Tipoanuncioss @tipo = 1;--venda --

-------------------------------------------------------------------------------------------------
