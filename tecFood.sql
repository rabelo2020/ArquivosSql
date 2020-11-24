use tecfood;

show tables;
desc cozinha;
select * from cozinha;
desc restaurante;
select * from restaurante;
select * from tecfood.Cozinha c where c.nome like '%ana%';
select * from restaurante r ORDER BY r.taxa_frete desc;
select * from restaurante r where r.taxa_frete between 3 and 12 ORDER BY r.taxa_frete;
select * from restaurante r where r.nome like '%e%' and r.cozinha_id=2 order by taxa_frete asc;

select * from restaurante r where r.nome like '%comida%' group by r.nome order by taxa_frete asc;
select * from restaurante r where r.nome like '%comida%' limit 0, 1;
select * from restaurante r where r.nome like '%comida%' ORDER BY taxa_frete limit 0, 2;
select sum(r.taxa_frete) as Quantidade from restaurante r ;
select sum(r.taxa_frete) as total from restaurante r ;

