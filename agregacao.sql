use restaurante;

select count(quantidade) as total_pedidos from pedidos;

select count(distinct id_clientes) from pedidos;

select avg(preco) from produtos;

select min(preco) from produtos;
select max(preco) from produtos;

select nome, preco from produtos order by preco desc limit 5;

select categoria, avg(preco) as media_preco from produtos group by categoria;

select fornecedor, count(*) as total_produtos from info_produtos group by fornecedor;

select fornecedor, count(*) as total_produtos from info_produtos group by fornecedor having count(*) > 1;

select id_clientes, count(*) as total_pedidos from pedidos group by id_clientes having count(*) = 1;