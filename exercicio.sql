CREATE DATABASE exercicio;

USE exercicio;

CREATE TABLE estado(
 id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(20) UNIQUE NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET='utf8mb4';

CREATE TABLE cidade(
 id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(20) NOT NULL,

estado_id BIGINT NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET='utf8mb4';


CREATE TABLE funcionarios(
      id BIGINT NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      email VARCHAR(200),
      sexo CHAR(1),
      departamento VARCHAR(100),
      admissao DATE NOT NULL,
      salario DECIMAL(10, 2),
      cargo VARCHAR(100) NOT NULL,
      ativo TINYINT(1) NOT NULL,
      
      cidade_id BIGINT NOT NULL,
      
  PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET='utf8mb4';

ALTER TABLE cidade ADD CONSTRAINT fk_cidade_estado FOREIGN KEY(estado_id) REFERENCES estado(id);
ALTER TABLE funcionarios ADD CONSTRAINT fk_funcionarios_cidade FOREIGN KEY(cidade_id) REFERENCES cidade(id);

use exercicio;
select count(*) from funcionarios;
select * from funcionarios ;
select * from funcionarios order by departamento;
select count(*) from funcionarios where departamento='filmes';

--Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas

select count(*) from funcionarios  where departamento='roupas'  or departamento='filmes';
select * from funcionarios  where departamento='roupas'  or departamento='filmes';
select * from funcionarios  where departamento in ('roupas', 'filmes');

select sexo, count(sexo)as Qtd from funcionarios group by sexo ; 
select * from funcionarios  where departamento='lar' or departamento='filmes';

select * from funcionarios where sexo='Masculino' and idRegiao=7;

select departamento, count(departamento)as Qtd from funcionarios group by departamento order by 1;

select cargo, count(cargo)as Qtd from funcionarios group by cargo order by 1;

select * from funcionarios where sexo not in ('Feminino');


select * from funcionarios where (departamento='lar' or departamento='filmes') and sexo='Feminino';
select departamento from funcionarios where departamento='lar' or departamento='filmes' limit 0, 1;
with funcionarios as(
select * from funcionarios where departamento in (select departamento from funcionarios where departamento='lar' or departamento='filmes' limet 0, 1) 
sexo=(select sexo from funcionarios where sexo='Feminino' limit 0, 1);
 
)