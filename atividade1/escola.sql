CREATE DATABASE escola;

USE escola;

SELECT * FROM professor;
SELECT * FROM aluno;
SELECT * FROM turma;
SHOW TABLES;
ALTER TABLE turma ADD nomeDisciplina INT; /*adiciona uma nova coluna*/

/*DROP TABLE professor;
DROP TABLE aluno;
DROP TABLE turma;*/

CREATE TABLE professor (
    nome VARCHAR(45),
    unidade INT UNIQUE,
    matricula INT PRIMARY KEY auto_increment
);

CREATE TABLE aluno (
    numeroAluno INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    ano INT,
    semestre INT,
    UNIQUE (ano, semestre)
);

/*CREATE TABLE turma (
    codDisciplina INT PRIMARY KEY auto_increment,
    sala INT,
    numero INT UNIQUE,
    fk_professor_matricula INT
);*/
CREATE TABLE turma (
    codDisciplina INT PRIMARY KEY auto_increment,
    sala INT,
    numTurma INT UNIQUE
);
INSERT INTO turma (codDisciplina,sala,numTurma)
	VALUES(2,205,34657);
INSERT INTO turma (codDisciplina,sala,numTurma)
	VALUES(4,206,34607);


CREATE TABLE inscrito (
    fk_aluno_numeroAluno INT,
    fk_turma_codDisciplina INT
);
 
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
