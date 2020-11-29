show databases;

use sqlcompleto;

show tables;
-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
desc restaurante;
desc formaPagamento;
desc Restaurante_FormaPagamento;

ALTER TABLE formaPagamento CHANGE nome nome VARCHAR(20) NOT NULL;

CREATE TABLE Restaurante (
Id bigint not null auto_increment,
nome VARCHAR(10),
primary key(id)
)engine=InnoDB default charset=utf8;

CREATE TABLE FormaPagamento (
Id bigint not null auto_increment,
FormaPagamento VARCHAR(10),

primary key(id)
)engine=InnoDB default charset=utf8;

CREATE TABLE Restaurante_FormaPagamento (
restaurante_id bigint not null,
pagamento_id bigint not null,

primary key (restaurante_id, pagamento_id)
)engine=InnoDB default charset=utf8;

alter table Restaurante_FormaPagamento
 add constraint fk_forma_pagto
 foreign key (pagamento_id)
 references FormaPagamento (id);
 
alter table Restaurante_FormaPagamento
 add constraint fk_pagto_restaurante
 foreign key (restaurante_id)
 references restaurante (id);

