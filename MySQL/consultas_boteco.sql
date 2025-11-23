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

-- Faturamento mensal por tipo de item 
#Produtos:
select month(v.data_venda) as mes, sum(ip.qtde * ip.valor_unitario) as total
from itens_produtos ip
join vendas v on v.id_venda = ip.venda_id
group by mes;

#Lanches:
select month(v.data_venda) as mes, sum(il.qtde * il.valor_unitario) as total
from itens_lanches il
join vendas v on v.id_venda = il.venda_id
group by mes;

#Drinks:
select month(v.data_venda) as mes, sum(id.qtde * id.valor_unitario) as total
from itens_drinks id
join vendas v on v.id_venda = id.venda_id
group by mes;

-- Funcionario que mais faturou 
select 
    f.nome_funcionario,
    
    -- total em produtos
    (select sum(ip.qtde * ip.valor_unitario)
     from itens_produtos ip
     where ip.funcionario_id = f.id_funcionario) +
     
    -- total em lanches
    (select sum(il.qtde * il.valor_unitario)
     from itens_lanches il
     where il.funcionario_id = f.id_funcionario) +
     
    -- total em drinks
    (select sum(idr.qtde * idr.valor_unitario)
     from itens_drinks idr
     where idr.funcionario_id = f.id_funcionario)
     
    as total_faturado

from funcionarios f
order by total_faturado desc
limit 1;

-- Qual Genero mais gastou?
select c.genero, sum(v.valor_total) as total
from vendas v
join clientes c on c.id_cliente = v.cliente_id
group by c.genero
order by total desc
limit 1;
