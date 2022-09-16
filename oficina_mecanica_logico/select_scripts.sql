
----- Recuperações simples com SELECT Statement;
select *from cliente;
select *from endereco;
select *from cliente_possui_endereco;
select *from cliente_levam_veiculo;
select *from veiculo;
select *from mecanico;
select *from equipe;
select *from Valores_mao_de_obra;
select *from Servico;
select *from peca;
select *from  ordem_de_servico;
select *from  Ordem_de_servico_contem_Servico;
select *from  peca_compoe_ordem_de_servico  ;



-- Filtros com WHERE Statement;
select  *from cliente c inner join cliente_possui_endereco ce on c.idCliente = ce.Cliente_idCliente
inner join
endereco e on e.cep = ce.endereco_cep;

select  *from cliente c inner join cliente_levam_veiculo cv on c.idCliente = cv.Cliente_idCliente
inner join
veiculo v on v.idVeiculo = cv.Veiculo_idVeiculo;

select *from mecanico m, mecanico_compoe_equipe me where m.idMecanico= me.Mecanico_idMecanico ;

select *from mecanico m inner join mecanico_compoe_equipe me ON m.idMecanico= me.Mecanico_idMecanico
inner join equipe e on e.idEquipe = me.Equipe_idEquipe 
where e.idEquipe =2;

select *from equipe e , veiculo v where e.Veiculo_idVeiculo = v.idVeiculo;
select *from veiculo v left outer join equipe e on e.Veiculo_idVeiculo = v.idVeiculo;
select *from equipe e left outer join veiculo v on e.Veiculo_idVeiculo = v.idVeiculo;


select *from equipe_identica_servico es, servico s  where es.Servico_idServico = s.idServico;




-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;

select os.idOrdem_de_servico 
from  ordem_de_servico_contem_servico  oss inner  join ordem_de_servico os ON oss.Ordem_de_servico_idOrdem_de_servico = os.idOrdem_de_servico
inner join 
servico s ON oss.Servico_idServico = s.idServico
inner join 
valores_mao_de_obra vmo ON s.Valores_idTabelaValores = vmo.idTabelaValores
inner join
peca_compoe_ordem_de_servico pos ON os.idOrdem_de_servico = pos.Ordem_de_servico_idOrdem_de_servico
inner join 
peca p ON pos.Peca_idPecas =p.idPecas
;

-- Defina ordenações dos dados com ORDER BY;
select *from ordem_de_servico_contem_servico  oss inner  join ordem_de_servico os ON oss.Ordem_de_servico_idOrdem_de_servico = os.idOrdem_de_servico
inner join 
servico s ON oss.Servico_idServico = s.idServico order by os.Equipe_idEquipe;

-- Condições de filtros aos grupos – HAVING Statement;
select distinct *from peca_compoe_ordem_de_servico pos inner join peca p on pos.Peca_idPecas = p.idPecas
inner join 
ordem_de_servico os ON pos.Ordem_de_servico_idOrdem_de_servico = os.idOrdem_de_servico
inner join
ordem_de_servico_contem_servico oss ON oss.Ordem_de_servico_idOrdem_de_servico = os.idOrdem_de_servico

group by p.nome
having (os.Equipe_idEquipe = 3)
;
