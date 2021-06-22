CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS(
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4)
);

/* VERIFICANDO OS BANCOS */
SHOW DATABASES;

/* CONEVCTANDO A UM BANCO */
USE LIVRARIA;


INSERT INTO LIVROS VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVROS VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVROS VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVROS VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO LIVROS VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO LIVROS VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVROS VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVROS VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO LIVROS VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO LIVROS VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);
DESC LIVROS;
INSERT INTO LIVROS(LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO) VALUES('Contos de Fadas','Roberto','M',390,null,87.98,'MA',2019);
INSERT INTO LIVROS(LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO) VALUES('Diario de uma Paixão','Margarida Lemos','F',null,'Abril',NULL,'SP',2009);
INSERT INTO LIVROS(LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO) VALUES('Copa do Mundo','Freitas Alves','M',NULL,NULL,201.91,'MA',2020);
INSERT INTO LIVROS(LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO) VALUES('Amor de Mentirinha','Clara Marques','F',209,'Continental',73.98,'RJ',2021);
SELECT AUTOR,  LIVRO, PAGINAS
FROM LIVROS
WHERE SEXO = 'F';

SELECT * FROM LIVROS;
select COUNT(LIVRO) AS qtd FROM LIVROS;
SELECT SEXO, COUNT(SEXO)AS Qtd FROM LIVROS GROUP BY SEXO;
SELECT UF, COUNT(UF)AS Qtd FROM LIVROS GROUP BY UF ORDER BY 2;
SELECT * FROM LIVROS WHERE UF='RJ' OR UF='SP';
SELECT * FROM LIVROS WHERE UF IN ('RJ', 'SP');

select * from livros;
SELECT * FROM LIVROS WHERE UF NOT IN ('RJ', 'SP') limit 2;
select * from LIVROS WHERE VALOR BETWEEN 50 AND 95; 
select * from LIVROS WHERE LIVRO LIKE '%sa%';
SELECT * FROM LIVROS WHERE VALOR IN(select MIN(VALOR) from LIVROS);
SELECT * FROM LIVROS WHERE VALOR IN(select MAX(VALOR) from LIVROS);

select * from livros;
SELECT * FROM LIVROS WHERE EDITORA IS NULL;
SELECT * FROM LIVROS WHERE PAGINAS IS NOT NULL;

DESC LIVROS;
SELECT * FROM LIVROS WHERE VALOR BETWEEN 50 AND 170 AND UF IN('RJ','SP');

SELECT UF, count(UF)AS Qtd FROM LIVROS WHERE VALOR BETWEEN 50 AND 170 AND UF IN('RJ','SP')GROUP BY UF ORDER BY Qtd;
SELECT SUM(VALOR)AS ValorDeSpRj FROM LIVROS WHERE UF IN(select UF from LIVROS WHERE UF IN ('RJ', 'SP'));
SELECT SUM(VALOR) FROM LIVROS;
