use restaurante;

create view resumo_pedido as select pedidos.id_pedido, pedidos.quantidade, clientes.nome as nome_cliente, clientes.email as email_clientes, funcionarios.nome as nome_funcionarios, produtos.nome as nome_produto, produtos.preco
from pedidos
join clientes on pedidos.id_clientes = clientes.id_clientes
join funcionarios on funcionarios.id_funcionarios = pedidos.id_funcionarios
join produtos on pedidos.id_produtos = produtos.id_produtos;

select id_pedido, nome_cliente, (quantidade * preco) as total_pedido from resumo_pedido;


create or replace view resumo_pedido as select pedidos.id_pedido, pedidos.quantidade, clientes.nome as nome_cliente, clientes.email as email_clientes, funcionarios.nome as nome_funcionarios, produtos.nome as nome_produto, produtos.preco, (pedidos.quantidade * produtos.preco) as total
from pedidos
join clientes on pedidos.id_clientes = clientes.id_clientes
join funcionarios on funcionarios.id_funcionarios = pedidos.id_funcionarios
join produtos on pedidos.id_produtos = produtos.id_produtos;

select id_pedido, nome_cliente, total from resumo_pedido;

explain select id_pedido, nome_cliente, total from resumo_pedido;


delimiter //
create function BuscaIngredientesProduto (p_id_produtos int)
returns varchar(200)
reads sql data
begin
	declare v_ingredientes varchar(200);
    select ingredientes into v_ingredientes from info_produtos where id_produtos = p_id_produtos;
    return v_ingredientes;
end //
delimiter ;

select BuscaIngredientesProduto(10) as ingredientes;


delimiter //
create function MediaPedido (p_id_pedido int)
returns varchar(50)
reads sql data
begin
	return (
		select if(
			total > (select avg(total) from resumo_pedido), 'acima da média',
            if( total < (select avg(total) from resumo_pedido), 'abaixo da média', 'acima da média')
		)
        from resumo_pedido
        where id_pedido = p_id_pedido
	);
end //
delimiter ;

select MediaPedido(5);
select MediaPedido(6);


    