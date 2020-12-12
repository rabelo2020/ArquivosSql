CREATE TABLE forma_pagamento(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE grupo(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE permissao(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL, 
descricao VARCHAR(100) NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE grupo_permisao(
 grupo_id BIGINT NOT NULL,
 permissao_id BIGINT NOT NULL,
 
 PRIMARY KEY (grupo_id, permissao_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE produto(
id BIGINT NOT NULL AUTO_INCREMENT,
restaurante_id BIGINT NOT NULL,
nome VARCHAR(60) NOT NULL,
descricao TEXT NOT NULL,
preco DECIMAL(10, 2) NOT NULL,
ativo TINYINT(1) NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE restaurante(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
taxa_frete DECIMAL(10,2) NOT NULL,
cozinha_id BIGINT NOT NULL,
data_cadastro DATETIME NOT NULL,
data_atualizacao DATETIME NOT NULL,

endereco_cep VARCHAR(9),
endereco_logradouro VARCHAR(100),
endereco_numero VARCHAR(20),
endereco_complemento VARCHAR(60),
endereco_bairro VARCHAR(60),
endereco_cidade_id BIGINT,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE restaurante_forma_pagamento(
restaurante_id BIGINT NOT NULL,
forma_pagamento_id BIGINT NOT NULL,

PRIMARY KEY (restaurante_id, forma_pagamento_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE usuario(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
email VARCHAR(255) NOT NULL,
senha VARCHAR(255) NOT NULL,
data_cadastro DATETIME NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE usuario_grupo(
 usuario_id BIGINT NOT NULL,
 grupo_id BIGINT NOT NULL,
 
PRIMARY KEY (usuario_id, grupo_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE grupo_permissao ADD CONSTRAINT fk_grupo_permissao_permissao 
    FOREIGN KEY (permissao_id) REFERENCES permissao(id);
    
ALTER TABLE grupo_permissao ADD CONSTRAINT fk_grupo_permissao_grupo
  FOREIGN KEY (grupo_id) REFERENCES grupo(id);
  
  ALTER TABLE produto ADD CONSTRAINT fk_produto_restaurante 
  FOREIGN KEY (restaurante_id) REFERENCES restaurante(id);
  
  ALTER TABLE restaurante ADD CONSTRAINT fk_restaurante_cozinha
  FOREIGN KEY (cozinha_id) REFERENCES cozinha (id);
  
  ALTER TABLE restaurante ADD CONSTRAINT fk_restaurante_cidade
  FOREIGN KEY (endereco_cidade_id) REFERENCES cidade (id);
  
  ALTER TABLE restaurante_forma_pagamento ADD CONSTRAINT fk_restaurante_forma_pagamento_restaurante
   FOREIGN KEY (restaurante_id) REFERENCES restaurante (id);
   
  ALTER TABLE restaurante_forma_pagamento ADD CONSTRAINT fk_restaurante_forma_pagamento_forma_pagamento
  FOREIGN KEY (forma_pagamento_id) REFERENCES forma_pagamento(id);
  
  ALTER TABLE usuario_grupo ADD CONSTRAINT fk_usuario_grupo_usuario
  FOREIGN KEY (usuario_id) REFERENCES usuario(id);
  
  ALTER TABLE usuario_grupo ADD CONSTRAINT fk_usuario_grupo_grupo
  FOREIGN KEY (grupo_id) REFERENCES grupo(id);
  
  
  CREATE TABLE pedido(
 id BIGINT NOT NULL AUTO_INCREMENT,
 sub_total DECIMAL(10, 2) NOT NULL,
 taxa_frete DECIMAL(10, 2) NOT NULL,
 valor_total DECIMAL(10, 2) NOT NULL,
 data_criacao DATETIME NOT NULL,
 data_confirmacao DATETIME,
 data_cancelamento DATETIME,
 data_entrega DATETIME,
 
 endereco_cep VARCHAR(10),
 endereco_logradouro VARCHAR(60),
 endereco_numero VARCHAR(20),
 endereco_complemento VARCHAR(255),
 endereco_bairro VARCHAR(60),
 
 
 restaurante_id BIGINT NOT NULL,
 forma_pagamento_id BIGINT NOT NULL,
 usuario_cliente_id BIGINT NOT NULL,
 endereco_cidade_id BIGINT NOT NULL, 
 
PRIMARY KEY (id),

 CONSTRAINT fk_pedido_restaurante FOREIGN KEY (restaurante_id) REFERENCES restaurante (id),
 CONSTRAINT fk_pedido_forma_pagamento FOREIGN KEY (forma_pagamento_id) REFERENCES forma_pagamento (id),
 CONSTRAINT fk_pedido_usuario FOREIGN KEY (usuario_cliente_id) REFERENCES usuario (id),
 CONSTRAINT fj_pedido_cidade FOREIGN KEY (endereco_cidade_id) REFERENCES cidade (id)
 
)ENGINE=INNODB DEFAULT CHARSET=utf8;
  
  CREATE TABLE item_pedido(
  id BIGINT NOT NULL AUTO_INCREMENT,
  quantidade SMALLINT(6) NOT NULL,
  preco_unitario DECIMAL(10, 2) NOT NULL,
  preco_total DECIMAL(10, 2) NOT NULL,
  observacao VARCHAR(255) NULL,
  
  pedido_id BIGINT NOT NULL,
  produto_id BIGINT NOT NULL,
  
  PRIMARY KEY(id) ,
  UNIQUE KEY uk_item_pedido_produto (pedido_id, produto_id),  
  
  CONSTRAINT fk_itemPedido_pedido FOREIGN KEY (pedido_id) REFERENCES pedido (id),
  CONSTRAINT fk_itemPedido_produto FOREIGN KEY (produto_id) REFERENCES produto (id)
  )ENGINE=INNODB DEFAULT CHARSET=utf8;
  



set foreign_key_checks= 0;

delete from cidade;
delete from cozinha;
delete from estado;
delete from forma_pagamento;
delete from grupo;
delete from grupo_permissao;
delete from permissao;
delete from produto;
delete from restaurante;
delete from restaurante_forma_pagamento;
delete from usuario;
delete from usuario_grupo;

set foreign_key_checks= 1;

alter table cidade auto_increment = 1;
alter table cozinha auto_increment = 1;
alter table estado auto_increment = 1;
alter table forma_pagamento auto_increment = 1;
alter table grupo auto_increment = 1;
alter table permissao auto_increment = 1;
alter table produto auto_increment = 1;
alter table restaurante auto_increment = 1;
alter table usuario auto_increment = 1;


CREATE TABLE cozinha(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE cidade(
id BIGINT NOT NULL AUTO_INCREMENT,
nome_cidade VARCHAR(60) NOT NULL,
nome_estado VARCHAR(60) NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DESC CIDADE;

CREATE TABLE estado(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,

PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE cidade ADD COLUMN estado_id BIGINT NOT NULL;

ALTER TABLE cidade ADD CONSTRAINT fk_cidade_estado
FOREIGN KEY (estado_id) REFERENCES estado(id);

ALTER TABLE cidade DROP COLUMN nome_estado;

ALTER TABLE cidade CHANGE nome_cidade nome VARCHAR(80)

