drop database algalog;
show databases;
use algalog;
show tables;
desc produto;

CREATE TABLE produto(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
preco DECIMAL(10,2) NOT NULL,

PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8mb4;


create table itemVenda(
id BIGINT NOT NULL AUTO_INCREMENT,
quantidade INT NOT NULL,
valor_unitario DECIMAL(10, 2) NOT NULL,
produto_id BIGINT(20) NOT NULL,
venda_id BIGINT(20) NOT NULL,

PRIMARY KEY (id),
FOREIGN KEY (produto_id) REFERENCES produto(id),
FOREIGN KEY (venda_id) REFERENCES venda(id)
)ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;
show tables;
desc itemVenda;
drop table itemVenda;
drop table itemvenda;