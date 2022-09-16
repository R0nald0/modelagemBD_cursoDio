insert into cliente values  (null,'maria', 'assiss','9866483434'),
							(null, 'jose', 'brandao','1264483432'),
							(null,'jonas', 'santos','86432654364'),
							(null, 'tico', 'silva', '9544623434'),
							(null, 'teco', 'silva','09758354725');
                            
insert into cliente_levam_veiculo values (1,5),
											(2,4),
											(3,3),
											(4,2),
											(5,1);                             
                            
                            
insert into veiculo values  (null,'RI48354', 'GOL','1999'),
							(null,'BA95634', 'MUSTANG','2002'),
							(null,'NF84653', 'FIAT','2010'),
							(null,'7U8FHJO', 'PALIO', '2021'),
							(null,'NH85465', 'Hyundai','2001');    

insert into equipe values  (1,3,1),
						   (2,3,4),
						   (3,3,3),
						   (4,3,null),
						   (5,3,null),
						   (6,3,null)
                           ;
							
							 
insert into mecanico_compoe_equipe values (1,3),
                                          (2,3),  							                               
                                          (3,3),  							                               
                                          (4,2),  							                               
                                          (5,2),  							                               
                                          (6,2),  							                               
                                          (7,1),  							                               
                                          (8,1),  							                               
                                          (9,1);  							                               
                            
 insert into  mecanico  values (null,'joana assis','98735274651','especializado em carros antigos'),
								(null, 'joao aguilar','76453856253','Preparador e customizador'),
								(null,'Pedro de antunes','26476937564','Consultor automotivo'),
								(null, 'Sophia santana','09864725347','Especialista em marcas ou segmentos'),
								(null, 'Rodrigo Chistiassem','87467635486','especializado em carros de corrida'),
								(null,'Maria de sabá','75646253475','Consultor automotivo'),
								(null, 'Geovani de souza','87649211970','Especialista em marcas ou segmentos'),
								(null, 'Rodrigo  aguilar','64233243121','especializado em carros de luxo'),
                                (null, 'Macelo   Almeida','86345523419','especialista em troca de pneus')
								;                           


insert into endereco values  ( 1, 'rua da souza', 'taboao', 'tatu', 'GO'),
						     (2, 'rua da sopa', 'cate', 'ss', 'BR'),
							 (3, 'rua da independencia', '5 de abril', 'rj', 'RJ'),
							(4, 'rua das naçoes', 'taboao da serra', 'Campo grande', 'MG'),
							(5, 'rua da gloria', 'barr', 'sp', 'SP'),
							(6, 'rua das estrelas', 'Lua', 'costa verde', 'MT');
                            
insert into cliente_possui_endereco values (1,6),
                                           (2,5),                           
                                           (3,4),
                                           (4,3),
                                           (5,2);     
                                           
                                           
 insert Valores_mao_de_obra values          (null,30.00,'troca de oleo'), 
                                            (null,80.00,'troca de pneu'),
                                            (null,150.00,'Alinhamento e balanceamento.'),
                                            (null,250.32,'Revisão dos componentes de freio'),
                                            (null,90.00,'Checagem do nível de água no radiador'),
                                            (null,100.00,'Manutenção de embreagem'),
                                            (null,69.00,'embreagem patinando'),
                                            (null,78.25,'trepidação'),
                                            (null,127.23,'troca de retrovisor'),
                                            (null,92.53,'troca de farois');
                                            
                                            
insert into servico values (null,4,1,true),
						   (null,10,1,true),
						   (null,1,1,true),
						   (null,3,1,true),
                           (null,8,3,true),
						   (null,2,3,true),
						   (null,3,3,true),
						   (null,4,3,true),
						   (null,7,5,true),
						   (null,3,5,true),
						   (null,6,5,true),
						   (null,8,5,true);
                           
						
insert into equipe_identica_servico values (1,2),
                                            (2,3),
                                             (3,1) ;   
                                             
                                             
insert into peca values(null,123.00,'Kit lâmpada do farol'),
                       (null,213.00,'Alarme para automóveis') ,                                         
                       (null,32.20,'Óleo do motor'),       
                       (null,26.90,'Capa de carro'),       
                       (null,97.21,'Buzina automotiva'),       
                       (null,20.12,'Lâmpada do farol principa'),       
                       (null,50.25,'Macaco'),       
                       (null,42.32,'Cinto de segurança'),       
                       (null,320.99,'pneu'),       
                       (null,63.26,'retrovisor'),       
                       (null,237.43,'freio'); 
                       
                       
                       
insert into Peca_compoe_Ordem_de_servico values(11,1),
											    (1,1),                     
											    (9,3);                     
                        
insert into Ordem_de_servico values(null,default,default,'2022/09/24',3),
								   (null,default,default,'2022/09/24',1),                      
								   (null,default,default,'2022/09/24',2);  
                                   
insert into Ordem_de_servico_contem_Servico values(1,1),                                
												  (1,2), 
												  (1,10),
                                                  (2,9),
                                                  (2,11),
                                                  (3,7),
                                                  (3,6),
                                                  (3,5);
                       
                       
                       
                       