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

