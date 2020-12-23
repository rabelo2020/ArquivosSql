desc cliente;
select * from cliente;

select ifnull(email, 'S/E-mail')as Email from cliente;
select id, nome, email from cliente where email is null;
select id, nome, email from cliente where email is not null;
select sexo, count(sexo)as Qtd from cliente group by sexo;
update cliente set telefone=null where id in(3, 6);
select * from cliente where data_cadastro 
between str_to_date('01/01/2019', "%d/%m/%Y") AND str_to_date('30/11/2020', "%d/%m/%Y");

INSERT INTO CLIENTE (nome, sexo, email, cpf, telefone, endereco, data_cadastro)
VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ', '2018/02/12');

INSERT INTO CLIENTE (nome, sexo, email, cpf, telefone, endereco, data_cadastro)
VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ', null);

INSERT INTO cliente (nome, sexo, email, cpf, telefone, endereco, data_cadastro)
 VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG', '2020/05/02');

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) 
VALUES('NATALIA','F','AV.RIO DO A - CAMPO GRANDE - RIO DE JANEIRO - RJ','947785696',887774856);
use projeto;
desc vendedores;

CREATE TABLE VENDEDORES(
	IDVENDEDOR BIGINT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	JANEIRO DECIMAL(10,2),
	FEVEREIRO DECIMAL(10,2),
	MARCO DECIMAL(10,2)
)ENGINE=INNODB DEFAULT CHARSET='utf8mb4';

select (janeiro+ fevereiro + marco)as Valor_Func from vendedores;
SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   truncate((JANEIRO+FEVEREIRO+MARCO) * .25, 2) AS "DESCONTO",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	   FROM VENDEDORES;
       
select truncate(((5 * 6)/3), 2)as Multi;

use projeto;       
show tables;
desc cliente;
alter table cliente change endereco ende varchar(10);

alter table cliente add column rg VARCHAR(15) AFTER sexo;
alter table cliente drop column rg;
alter table cliente add column rg VARCHAR(15) first;


INSERT INTO VENDEDORES(nome, sexo, janeiro, fevereiro, marco) VALUES('CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES(nome, sexo, janeiro, fevereiro, marco) VALUES('MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO VENDEDORES(nome, sexo, janeiro, fevereiro, marco) VALUES('ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO VENDEDORES(nome, sexo, janeiro, fevereiro, marco) VALUES('CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO VENDEDORES(nome, sexo, janeiro, fevereiro, marco) VALUES('ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO VENDEDORES(nome, sexo, janeiro, fevereiro, marco) VALUES('IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO VENDEDORES(nome, sexo, janeiro, fevereiro, marco) VALUES('JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO VENDEDORES(nome, sexo, janeiro, fevereiro, marco) VALUES('CELIA','F',89667.78,57654.87,5755.90);