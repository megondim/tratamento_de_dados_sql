use restaurante;

select * from pedidos where id_funcionarios = 4 and status_pedido = 'pendente';

select * from pedidos where not status_pedido = 'concluído';

select * from pedidos where id_produtos in (1, 3, 5, 7, 8);	

select * from clientes where nome like 'C%';

select * from info_produtos where ingredientes like '%carne%' or '%Frango%';

select * from produtos where preco between 20 and 30;

update pedidos set status_pedido = null where id_pedido = 6;

select * from pedidos where status_pedido is null;

select id_pedido, coalesce(status_pedido, 'cancelado') from pedidos;

select nome, cargo, salario,
	case 
		when salario > 3000 then 'acima da média'
        else 'abaixo da média'
	end as media_salario
from funcionarios;