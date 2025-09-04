use restaurante;

select produtos.id_produtos, produtos.nome, produtos.descricao, info_produtos.ingredientes
from produtos
inner join info_produtos
	on produtos.id_produtos = info_produtos.id_produtos;
    

select pedidos.id_pedido, pedidos.quantidade, produtos.nome as dados, clientes.nome, clientes.email
from pedidos
inner join clientes
	on pedidos.id_clientes = clientes.id_clientes
inner join produtos
	on pedidos.id_produtos = produtos.id_produtos;
    
    
select pedidos.id_pedido, pedidos.quantidade, produtos.nome as dados, clientes.nome as nome_cliente, clientes.email, funcionarios.nome as nome_funcionario
from pedidos
inner join clientes
	on pedidos.id_clientes = clientes.id_clientes
inner join produtos
	on pedidos.id_produtos = produtos.id_produtos
inner join funcionarios
	on pedidos.id_funcionarios = funcionarios.id_funcionarios;
    
    
select pedidos.id_pedido, pedidos.quantidade, produtos.nome as dados, clientes.nome as nome_cliente, clientes.email, funcionarios.nome as nome_funcionario, produtos.preco
from pedidos
inner join clientes
	on pedidos.id_clientes = clientes.id_clientes
inner join produtos
	on pedidos.id_produtos = produtos.id_produtos
inner join funcionarios
	on pedidos.id_funcionarios = funcionarios.id_funcionarios;
    
    
select clientes.nome, pedidos.id_pedido, pedidos.status_pedido
from pedidos
inner join clientes
	on pedidos.id_clientes = clientes.id_clientes
where pedidos.status_pedido = 'Pendente'
order by pedidos.id_pedido desc;


select clientes.nome
from clientes
left join pedidos
	on clientes.id_clientes = pedidos.id_clientes
where pedidos.id_pedido is null;


select clientes.nome, count(pedidos.id_pedido) as total_pedidos
from clientes
left join pedidos
	on clientes.id_clientes = pedidos.id_clientes
group by clientes.nome;


select pedidos.id_pedido, pedidos.quantidade, produtos.nome, (pedidos.quantidade * produtos.preco) as total_pedido
from pedidos
inner join produtos
	on pedidos.id_produtos = produtos.id_produtos;