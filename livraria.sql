CREATE DATABASE livraria;
USE livraria; 
SHOW TABLES;

CREATE TABLE livros(
 id BIGINT NOT NULL AUTO_INCREMENT,
 nome_livro VARCHAR(65) UNIQUE NOT NULL,
 nome_autor VARCHAR(65)NOT NULL,
 sexo_autor CHAR(1) NULL,
 numeros_paginas INT NULL,
 nome_editora INT NULL,
 valor_livro DECIMAL(10, 2) NULL,
 uf CHAR(2)NOT NULL,
 ano_publicacao DATE NOT NULL,
 
 PRIMARY KEY(id)
)ENGINE=INNODB CHARSET='utf8mb4';

DROP TABLE livros;
DESC LIVROS;
ALTER TABLE livros CHANGE nome_editora nome_editora VARCHAR(65) NULL;
ALTER TABLE livros CHANGE ano_publicacao data_publicacao DATE NULL;

SELECT COUNT(nome_livro) AS Qtd FROM livros;
SELECT * FROM livros;
SELECT nome_livro, nome_editora FROM livros;
SELECT nome_livro, uf, sexo_autor FROM livros WHERE sexo_autor='M';
SELECT nome_livro, numeros_paginas FROM livros WHERE sexo_autor='F';
SELECT valor_livro, uf FROM livros WHERE uf='SP';

SELECT nome_livro, nome_autor, valor_livro, DATE_FORMAT(data_publicacao, "%d-%m-%Y")as data_publicacao, 
uf, sexo_autor, DATE_FORMAT(now(), '%d-%m-%Y %H:%i:%s')as Data_Consulta
 FROM livros WHERE sexo_autor='M' and (uf='RJ' or uf='SP');
 
SELECT nome_livro, DATE_FORMAT(data_publicacao, '%d-%m-%Y')AS data_publicacao, nome_autor, valor_livro,
 DATE_FORMAT(now(), '%d-%m-%Y %T')AS Data_Consulta 
FROM livros WHERE data_publicacao
 BETWEEN STR_TO_DATE('01/01/2017', "%d/%m/%Y") AND STR_TO_DATE('31/12/2018', "%d/%m/%Y"); 
 
 SELECT COUNT(nome_livro)As Qtds
 FROM livros WHERE data_publicacao
 BETWEEN STR_TO_DATE('01/01/2017', "%d/%m/%Y") AND STR_TO_DATE('31/12/2018', "%d/%m/%Y");
 desc livros;
 
 SELECT AVG(valor_livro)As Qtds
 FROM livros WHERE data_publicacao
 BETWEEN STR_TO_DATE('01/01/2017', "%d/%m/%Y") AND STR_TO_DATE('31/12/2018', "%d/%m/%Y");

desc livros;

update cliente set data_cadastro='2020/12/12' where id=3;
update cliente set endereco='Centro-Av.Rio Branco-Rio de Janairo-RJ' where id=1;


INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ','2009/02/04');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP','2018/12/23');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ','2008/05/27');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ','2018/01/18');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ','2019/10/10');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG','2016/09/30');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES','2015/01/21');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES','2011/10/03');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS','2018/03/13');
INSERT INTO LIVROS(nome_livro, nome_autor, sexo_autor, numeros_paginas, nome_editora, valor_livro, uf, data_publicacao) VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP','2017/05/17');
