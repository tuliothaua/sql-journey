##### Querys Tulio Thaua Dutra #########

-- Consultas do Boteco do zé! --
  
-- 5 Produtos mais vendidos!
select p.nome_produto, sum(ip.qtde) as total_vendido
from itens_produtos ip
join produtos p on p.id_produto = ip.produto_id
group by p.nome_produto
order by total_vendido desc
limit 5;
