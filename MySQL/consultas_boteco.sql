##### Querys Tulio Thaua Dutra #########

-- Consultas do Boteco do zé! --
  
-- 5 Produtos mais vendidos!
select p.nome_produto, sum(ip.qtde) as total_vendido
from itens_produtos ip
join produtos p on p.id_produto = ip.produto_id
group by p.nome_produto
order by total_vendido desc
limit 5;

-- Relatorio de vendas por funcionario
#Produtos
select f.nome_funcionario, sum(ip.qtde * ip.valor_unitario) as total
from funcionarios f
join itens_produtos ip on ip.funcionario_id = f.id_funcionario
group by f.nome_funcionario;

#Lanches
select f.nome_funcionario, sum(il.qtde * il.valor_unitario) as total
from funcionarios f join itens_lanches il on il.funcionario_id = f.id_funcionario
group by f.nome_funcionario;

#Drinks
select f.nome_funcionario, sum(itd.qtde * itd.valor_unitario) as total
from funcionarios f join itens_drinks itd on itd.funcionario_id = f.id_funcionario
group by f.nome_funcionario;

-- Relatorio de vendas de desconto por cliente
select c.nome_cliente, v.desconto
from vendas v
join clientes c on c.id_cliente = v.cliente_id
where v.desconto > 0;
