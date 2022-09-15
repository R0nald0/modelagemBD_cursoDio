
-- Recuperações simples com SELECT Statement
select *from Cliente;
select *from Endereco;
select *from Produto;
select *from fornecedor;
select *from vendedores_terceiros;
select *from estoque;
select *from FormaDePagamento;
select *from pedido;

-- Filtros com WHERE Statement

delete from Cliente c where c.idCliente =2;
select *from Cliente c , Endereco e where c.Endereco_cep =e.cep;


select *from Cliente c inner join Endereco e where c.Endereco_cep = e.cep ;
update cliente set  sobreNome ='Rader' where idCliente = 5;



-- Crie expressões para gerar atributos derivados

select c.nome,c.sobreNome ,pd.nome,quantitade_prod,p.dataPedidoRealizado ,pd.valor from 
cliente c  inner join  pedido p ON c.idCliente = p.Cliente_idCliente
inner join produto pd ON pd.idProduto = p.Produto_idProduto
;

select concat( c.nome,c.sobreNome) NomeCompleto ,pd.nome,quantitade_prod,p.dataPedidoRealizado ,pd.valor 
from 
cliente c  inner join  pedido p ON c.idCliente = p.Cliente_idCliente
inner join produto pd ON pd.idProduto = p.Produto_idProduto
;

select *from cliente c, pedido p where c.idCliente = p.Cliente_idCliente;
select  concat(c.nome," ", c.sobreNome )nome , c.numeroCpf_Cnpj ,p.dataEntrega  
from cliente c, pedido p where c.idCliente = p.Cliente_idCliente;

---------------------------------------

-- Defina ordenações dos dados com ORDER BY
select *from cliente c left outer join  pedido p ON c.idCliente = p.Cliente_idCliente ORDER BY p.dataEntrega;


-- Condições de filtros aos grupos – HAVING Statement

select *from cliente c, pedido p where c.idCliente = p.Cliente_idCliente ;
select  concat(c.nome," ", c.sobreNome )nome , c.numeroCpf_Cnpj ,p.dataEntrega, p.quantitade_prod  
from cliente c, pedido p where c.idCliente = p.Cliente_idCliente group by p.dataEntrega having(p.quantitade_prod) > 2 ;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

select *from produto p inner join pedido pd ON p.idProduto = pd.Produto_idProduto 
 inner join cliente c ON c.idCliente = pd.Cliente_idCliente
where p.valor between 100 and 1000
 group by status ;
 
SELECT concat(c.nome," ",c.sobreNome) Nome, fp.nome,pd.nome, pd.quantidade , p.valorPrdoutoPedido
FROM pedido p inner join formadepagamento fp 
ON  p.FormaDePagamento_idFormadePagamento = fp.idFormadePagamento 
inner join 
cliente c 
ON p.Cliente_idCliente = c.idCliente
inner join 
produto pd 
ON p.Produto_idProduto = pd.idProduto;

-- Quantos pedidos foram feitos por cada cliente?
  select count(p.Cliente_idCliente) FROM pedido p ;
  
--  Algum vendedor também é fornecedor?
select distinct *FROM vendedores_terceiros_tem_produto vp , produto p  where vp.Produto_idProduto = p.idProduto;
select distinct *from produto p inner join vendedores_terceiros_tem_produto vp on vp.Produto_idProduto= p.idProduto 
inner join
vendedores_terceiros vt on vp.vendedores_Terceiros_idVendedoresTerceiros = vt.idVendedoresTerceiros
inner join 
produto_possui_fornecedor pf on vp.Produto_idProduto= p.idProduto 
inner join
 fornecedor f on pf.Fornecedor_idFornecedor = f.idFornecedor 
 
 where vt.cnpj = f.cnpj
;

select distinct *FROM produto_possui_fornecedor pf , produto p  where pf.Produto_idProduto = p.idProduto;

--------------------------
update pedido set status =" CANCELADO"  where idPedido = 4 ;
update cliente set  sobreNome ='Rader' where idCliente = 5
