use projeto;
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)

)ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

DROP TABLE cliente;
show tables;
desc cliente;

/*delete table cliente;	  */
