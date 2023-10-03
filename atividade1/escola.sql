CREATE DATABASE escola;

USE escola;

SELECT * FROM professor;
SELECT * FROM aluno;
SELECT * FROM turma;
SHOW TABLES;

/*DROP TABLE professor;
DROP TABLE aluno;
DROP TABLE turma;*/

CREATE TABLE professor (
    nome VARCHAR(45),
    unidade VARCHAR(50),
    matricula INT PRIMARY KEY auto_increment
);

CREATE TABLE aluno (
    numeroAluno INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    ano INT,
    semestre INT
);

CREATE TABLE turma (
    codDisciplina INT PRIMARY KEY auto_increment,
    sala INT,
    numTurma INT UNIQUE
);

INSERT INTO turma (sala,numTurma)
	VALUES(205,34657);
INSERT INTO turma (sala,numTurma)
	VALUES(206,34607);

ALTER TABLE turma ADD nomeDisciplina VARCHAR(50); /*adiciona uma nova coluna*/

UPDATE turma SET nomeDisciplina = "DBA" WHERE codDisciplina=1;/*adicionando informacao em nomeDisciplina*/
UPDATE turma SET nomeDisciplina = "JAVA" WHERE codDisciplina=2;/*adicionando informacao em nomeDisciplina*/

UPDATE turma SET sala = 207 WHERE codDisciplina=1;/*mudando a turma 1 de sala*/

INSERT INTO professor (nome,unidade,matricula)
	VALUES("fabio santos","senai_taguatinga_df",454);
INSERT INTO professor (nome,unidade,matricula)
	VALUES("caio lucas","senai_taguatinga_df",434);
INSERT INTO professor (nome,unidade,matricula)
	VALUES("vanessa","senai_taguatinga_df",494);
INSERT INTO professor (nome,unidade,matricula)
	VALUES("lucas","senai_taguatinga_df",414);
    
UPDATE professor SET unidade = "senai brasilia" WHERE matricula=454;/*mudando professor de unidade*/
UPDATE professor SET unidade = "senai brasilia" WHERE matricula=494;/*mudando professor de unidade*/

INSERT INTO aluno (nome,ano,semestre)
	VALUES ("lucas",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("amanda",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("gabriel",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("josé",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("fabio",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("calos",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("marcus",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("fabricio",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("luiza",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("daiane",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("reginaldo",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("felipe",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("david",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("luiz",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("pedro",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("carla",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("olavo",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("caike",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("vinicius",2023,2);
INSERT INTO aluno (nome,ano,semestre)
	VALUES ("flavio",2023,2);

CREATE TABLE inscrito (
    fk_aluno_numeroAluno INT,
    fk_turma_codDisciplina INT
);

INSERT INTO inscrito (fk_aluno_numeroAluno, fk_Turma_codDisciplina)
values (1,1);
 
ALTER TABLE turma ADD CONSTRAINT FK_turma_2
    FOREIGN KEY (fk_professor_matricula)
    REFERENCES professor (matricula)
    ON DELETE CASCADE;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_1
    FOREIGN KEY (fk_aluno_numeroAluno)
    REFERENCES aluno (numeroAluno)
    ON DELETE SET NULL;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_2
    FOREIGN KEY (fk_turma_codDisciplina)
    REFERENCES turma (codDisciplina)
    ON DELETE SET NULL;
