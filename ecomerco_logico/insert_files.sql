insert into vendedores_terceiros value(null, '38467583', 'ForTerACUCAR'),
(null, '184837494', 'ForTerCamisas'),
(null, '285469783', 'BolaFonTerc'),
(null, '38448748', 'RacaoForTerc'),
(null, '84837494', 'RefriFon')
;

insert into vendedores_terceiros_tem_produto values(5,7,50),
                                                   (2,5,100),    
                                                   (2,4,100);    

insert into  fornecedor values (null, '8467583', 'ForCafe'),
								(null, '84837494', 'RefriFon'),
								(null, '85469783', 'FiltroFon'),
								(null, '8448748', 'TenisFon'),
                                (null, '184837494', 'ForTerCamisas');
                                
insert into produto_possui_fornecedor values(7,2,20),
                                             (5,4,20);                              

insert into cliente values (null, '1', '986648354832', 'Null', 'safety', '2'),
							(null, '1', '12644836256', 'james', 'bond', '12'),
							(null, '1', '86432654364', 'tomb', 'Rainder', '1'),
							(null, '1', '9544623434', 'Soares', 'da silva', '2'),
							(null, '0', '986648354832', 'bob ', 'johnson', '1'),
							(null, '1', '9866483434', 'maria', 'assiss', '4'),
							(null, '1', '1264483432', 'jose', 'brandao', '5'),
     						(null, '1', '86432654364', 'jonas', 'santos', '16'),
							(null, '1', '9544623434', 'tico', 'silva', '2'),
							(null, '0', '986648354832', 'teco', 'silva', '1'),
							(null, '1', '9866483434', 'maria', 'assiss', '4'),
							(null, '1', '1264483432', 'jose', 'brandao', '5'),
							(null, '1', '86432654364', 'jonas', 'santos', '16'),
							(null, '1', '9544623434', 'tico', 'silva', '2'),
							(null, '0', '986648354832', 'teco', 'silva', '1');


insert into endereco values  (null, 'rua da souza', 'taboao', 'tatu', 'GO'),
						     (null, 'rua da sopa', 'cate', 'ss', 'BR'),
							 (null, 'rua da independencia', '5 de abril', 'rj', 'RJ'),
							(null, 'rua das naçoes', 'taboao da serra', 'Campo grande', 'MG'),
							(null, 'rua da gloria', 'barr', 'sp', 'SP'),
							(null, 'rua das estrelas', 'Lua', 'costa verde', 'MT');

insert into produto values (null, 'copo',2.67, "copo vermelho"),
							(null, 'Colchao',289.40,"colchao de molas"),
							(null, 'cadeira',500.00,"cadeira gamer"),
							(null, 'violao','250.00','violao de aço'),
							(null, 'chapeu','3.25'," chapeu de festa "),
							(null, 'pneu','765.20',"pneu aro 12"),
                            (null,'refrigerante',4.35,"refri de laranja")
                            ;




insert into formadepagamento values ('0', 'BOLETO'),
									('1', 'CARTAO DE CREDITO'),
									('2', 'PIX');
                                    
insert into pedido    values(null, '2', '3', 'EM PROCESSAMENTO', '3', '2021-02-11', '2022-09-14 16:28:45', '560.00', '2'),
						(null, '3', '1', 'ENVIADO', '2', '2022-12-03', '2022-09-14 16:28:45', '3.00', '1'),
						(null, '4', '6', 'EM PROCESSAMENTO', '1', '2022-02-23', '2022-09-14 16:28:45', '760.00', '2'),
						(null, '5', '5', 'CANCELADO', '4', '2022-08-31', '2022-09-14 16:28:45', '3.05', '1');


