use tecfood;

show tables;
desc cozinha;
select * from cozinha;
desc restaurante;
select * from restaurante;
select * from tecfood.Cozinha c where c.nome like '%ana%' order by c.nome;
select * from restaurante r ORDER BY r.taxa_frete desc;
select * from restaurante r where r.taxa_frete between 3 and 12 ORDER BY r.taxa_frete;
select * from restaurante r where r.nome like '%e%' and r.cozinha_id=2 order by taxa_frete asc;

select * from restaurante r where r.nome like '%comida%' group by r.nome order by taxa_frete asc;
select * from restaurante r where r.nome like '%comida%' limit 0, 1;
select * from restaurante r where r.nome like '%comida%' ORDER BY taxa_frete limit 0, 2;
select sum(r.taxa_frete) as Quantidade from restaurante r ;
select sum(r.taxa_frete) as total from restaurante r ;
select distinct(r.cozinha_id)as Valores_Unico from restaurante r;
select count(cozinha_id) as Qtd_Cozinha from restaurante r where r.cozinha_id=2;
select * from restaurante where nome like '%mi%' and cozinha_id= 6;

select * from restaurante where nome like '%mida%' and taxa_frete between 4 and 20;
update Restaurante set taxa_frete =0 where cozinha_id =1;
update restaurante set nome="Restaurante Japa" where id=6;
select distinct(r.cozinha_id), r.nome, r.taxa_frete, c.nome from restaurante r inner join cozinha c;
select * from restaurante where taxa_frete > 10 && taxa_frete < 15;
select * from restaurante where taxa_frete between 10 and 15;

select utc_timestamp;

use tecfood;
show tables;

desc restaurante;
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) 
values ('Bar da Maria', 6.72, 2, utc_timestamp, utc_timestamp);

select * from restaurante limit 0,2;
select r.nome as Restaurante, r.taxa_frete as Valor_Frete, c.nome as Cozinha from restaurante r
 join cozinha c where r.cozinha_id = c.id;
 select r.nome as Restaurante, r.taxa_frete as Valor_Frete, c.nome as Cozinha from restaurante r join cozinha c 
     where r.cozinha_id = c.id order by r.id;
     
select p.nome as Nome_Produto, p.ativo, p.preco, p.restaurante_id as codigo_restaurante, r.nome as Restaurante from produto p 
join restaurante r where p.restaurante_id= r.id order by p.preco desc;     

select p.nome as Nome_Produto, p.ativo, p.preco, r.nome as Restaurante, c.nome as Cozinha from produto p 
join restaurante r join cozinha c where p.restaurante_id= r.id and r.cozinha_id = c.id order by p.preco desc;

desc restaurante;

select p.nome as Nome_Produto, p.ativo, p.preco, r.nome as Restaurante, c.nome as Cozinha
 from produto p join restaurante r join cozinha c join cidade ci where p.restaurante_id= r.id 
 and r.cozinha_id = c.id and r.endereco_cidade_id = ci.id order by p.preco desc;

     use tecfood;
     select * from restaurante where id =2;
     select * from cidade c join estado e where c.estado_id = e.id;
     insert into Restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values((1, 3), 1, 1), (4, 2), (2, 1), (2, 3), (3, 1), (3, 2), (3, 3);
     
     select * from restaurante;
     drop tables usuario_grupo, usuario, restaurante_forma_pagamento, restaurante, produto, permissao, grupo_permissao, grupo, forma_pagamento;
     
     select nome, data_cadastro, sum(taxa_frete) as Soma_Taxa_Frete from restaurante group by nome, data_cadastro;
     
     use tecfood;
     show tables;
     delete from flyway_schema_history where installed_rank = 5;
     delete from flyway_schema_history where version = "005";
     
     select * from flyway_schema_history;
     drop table flyway_schema_history;
     select * from restaurante;
     select * from produto;
     
select nome, data_cadastro, sum(taxa_frete) from restaurante group by nome, data_cadastro ;
select avg(taxa_frete) as Média from restaurante;

select nome, data_cadastro, taxa_frete from restaurante where taxa_frete between 2 and 25 ORDER BY taxa_frete;
select count(taxa_frete)as Qtd from restaurante where taxa_frete between 2 and 25 ORDER BY taxa_frete;



     
     
     
     
     
 

     