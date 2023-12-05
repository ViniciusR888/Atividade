SELECT * FROM ContatoSite;

SELECT * FROM TipoContato;

SELECT * FROM TipoUsuario;

SELECT * FROM Usuario;

SELECT * FROM Cidade;

SELECT * FROM Bairro;

SELECT * FROM Endereco;

SELECT * FROM Imovel;

SELECT * FROM TipoImovel;

SELECT * FROM Imagem;

SELECT * FROM sys.databases;

SELECT * FROM sys.tables;
----------------------------------------------------------------------------
-- SELECT DO VALOR POR MEDIA POR M²

SELECT ID, Area_util,Valor_imovel,FORMAT(ROUND((CAST(Valor_imovel as INT) / Area_util),2),'c','pt-br') AS 'Valor M²' FROM Imovel;

-----------------------------------------------------------------------------
-- VIEW MOSTRAR IMOVEIS POR UMA CIDADE ESPECIFICA --

CREATE VIEW vw_quantidaCidade
AS
SELECT 
c.Nome_cidade,
COUNT(C.Nome_cidade) AS QuantidadeDeImoveis FROM Imovel I 
JOIN Endereco E ON I.fk_Endereco_ID = E.ID
JOIN Bairro B ON E.fk_Bairro_ID = B.ID
JOIN Cidade C ON B.fk_Cidade_ID = C.ID
GROUP BY C.Nome_cidade;

SELECT * FROM vw_quantidaCidade WHERE vw_quantidaCidade.Nome_cidade = 'taguatinga';

----------------------------------------------------------------------------
-- MOSTRA DETALHES DE TODOS OS IMOVEIS --

CREATE VIEW vw_detalhesImovell
AS
SELECT E.ID,I.Qtd_banheiro,I.Qtd_quarto,I.Qtd_suite,I.Qtd_vaga,I.Comodidade,I.Area_util,
I.Valor_imovel,I.Observacoes,E.Logradouro,E.Numero,E.Complemento,B.Nome_bairro
FROM imovel AS I
JOIN endereco AS E  ON I.fk_endereco_id = E.ID
JOIN bairro AS B ON E.fk_bairro_id = B.id 
JOIN cidade AS C ON B.fk_cidade_id = C.id; 

SELECT * FROM vw_detalhesImovell;

-----------------------------------------------------------------------------
-- MOSTRA QUANTIDADE DE IMOVEIS POR TIPO DE ANUNCIO (Aluguel,Venda...) -- 

CREATE VIEW vw_quantiTipoAnuncio AS
SELECT Nome_Tipo_Anuncio,COUNT(TA.Nome_Tipo_Anuncio) AS QuantiTipo
from Imovel I
JOIN Endereco E ON I.fk_Endereco_ID = E.ID
JOIN Bairro B ON E.fk_Bairro_ID = B.ID
JOIN Cidade C ON B.fk_Cidade_ID = C.ID
JOIN TipoAnuncio TA ON I.fk_TipoAnuncio_ID = TA.ID GROUP BY TA.Nome_Tipo_Anuncio;

SELECT * FROM vw_quantiTipoAnuncio;

------------------------------------------------------------------------------
-- MOSTRA UM TIPO DE ANUNCIO E O VALOR TOTAL DE IMOVEIS DAQUELE TIPO --

CREATE VIEW vw_valorTotalTipo AS
SELECT Nome_Tipo_Anuncio,COUNT(TA.Nome_Tipo_Anuncio) AS QuantiTipo,SUM(I.Valor_imovel) AS ValorTotal
FROM Imovel I
JOIN Endereco E ON I.fk_Endereco_ID = E.ID
JOIN Bairro B ON E.fk_Bairro_ID = B.ID
JOIN Cidade C ON B.fk_Cidade_ID = C.ID
JOIN TipoAnuncio TA ON I.fk_TipoAnuncio_ID = TA.ID group by TA.Nome_Tipo_Anuncio;

SELECT * FROM vw_valorTotalTipo where Nome_Tipo_Anuncio = 'Venda';--'Aluguel'

-------------------------------------------------------------------------------

SELECT * FROM Imovel I JOIN Endereco E ON I.fk_Endereco_ID = E.ID JOIN Bairro B ON E.fk_Bairro_ID = B.ID JOIN Cidade C ON B.fk_Cidade_ID = C.ID ;

SELECT ROUND(AVG(I.Valor_imovel),2) AS MEDIA from Imovel I;
CREATE vw_MediaCadaEstado AS
WITH MediaImovel AS (SELECT * FROM Imovel I JOIN Endereco E ON 
