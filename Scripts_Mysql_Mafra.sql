CREATE DATABASE projeto;


USE projeto;
SHOW TABLES;

CREATE TABLE cliente(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(65) NOT NULL,
enderco VARCHAR(255)NULL,
telefone VARCHAR(10) NULL,
email VARCHAR(30) NULL,
cpf INT(15) NULL,
sexo CHAR(1)NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DESC cliente;
ALTER TABLE cliente CHANGE cpf cpf VARCHAR(15) NULL;
DROP TABLE cliente;
SELECT NOW() AS Data_hora_Atual;

#SELEÇÃO, PROJEÇÃO & JUNÇÃO
/*Projeção é ---> SELECT nome, cpf ...*  */
/* Seleção é ---> WHERE  ...   */
/* Junção é  --->          */

ALTER TABLE cliente CHANGE enderco endereco VARCHAR(255) NULL;
desc cliente;
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);
INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');
SELECT nome, ifnull(email, "s/email")as Email, sexo, cpf, now()as data_consulta FROM cliente
   WHERE endereco like '%RJ%';

select sexo_autor as Sexo, count(sexo_autor)as Qtd from livros
     group by sexo_autor ORDER BY sexo_autor DESC;