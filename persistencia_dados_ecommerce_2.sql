-- inserção dos dados nas tabelas e_commerce.
-- lembrar os atributos da tabela Pessoa_Fisica
use e_commerce;

alter table pessoa_juridica modify cnpj bigint;
show tables;
select * from pessoa_fisica;        
insert into pessoa_fisica values(1,'José','Silva','dos Santos',99988774412,'1960-12-20'),
								(2,'Ana','Dantas Silva','dos Santos',91488977620,'1965-07-21'),
                                (3,'Antonio','Dantas','Silva',23199877621,'2005-08-01'),
                                (4,'Julia','Dantas','Silva',11132455589,'2006-09-01'),
                                (5,'Clara','Dantas','Silva',09832144589,'2004-01-09'),
                                (6,'Marcia','Silva','dos Santos',76588899905,'1979-07-15');
							
select * from pessoa_juridica;
insert into pessoa_juridica values(1,'Solicitação Empresas',99088744310001,'1988-02-19'),
								  (2,'Int LTDA',88897776650001,'1970-12-23'),
                                  (3,'Ogm',22334455660001,'1994-12-30'),
                                  (4, 'Paranapanema',33445566770001,'1987-10-12');
alter table clientes modify telefone bigint;                                 
select * from clientes;
insert into clientes (rua,nº,bairro,cidade,estado,telefone,email,PF_idPF,PJ_idPJ) values ('Av. Santos Drumont',9014,'Centro','Lauro_de_Freitas','Bahia',071988990304,'silvams@gmail.com',1,null),
																						('Av. Santos Drumont',9014,'Centro','Lauro_de_Freitas','Bahia',071999880304,'antonio@gmail.com',3,null),
                                                                                        ('Av. Santos Drumont',9014,'Centro','Lauro_de_Freitas','Bahia',071999770304,'ana@hotmail.com',2,null),
                                                                                        ('Rua Girino Souza',517,'Vida Nova','Lauro_de_Freitas','Bahia',071955667733,'marcia@gamil.com',6,null),
                                                                                        ('Av. Santos Drumont',3000,'Centro','Lauro_de_Freitas','Bahia',07133345566,'solictaempe@solcitacaoempresas.com.br',null,1),
                                                                                        ('Av. Eng. Oscar Pontes',240,'Calçada','Salvador','Bahia',07122334455,'ogm@ogm.com.br',null,3);
select * from produto;
insert into produto (nome,valor,descrição,categoria,classificação_Kids) values ('capacete',40.0,'Equipamento de segurança individual','vestimenta',default),
																			   ('luva impermeável',10.0,'Equipamento de segurança individual','vestimenta',default),
																			   ('bota de couro',60.0,'Equipamento de segurança individual','vestimenta',default),
																			   ('calça de brim', 25.0,'Item de uniforme','vestimenta',default),
																			   ('camisa de manga longa de brim',20.0,'Item de uniforme','vestimenta',default),
																			   ('oculos de proteção',10.0,'Equipamento de segurança individual','vestimenta',default);


select * from pedido;
insert into pedido(descrição,status_Pedido,frete,valor_pedido,clientes_idcliente) values ('1- bota de couro,1-capacete,2-calças de brim',default,30.0,150.0,1),
																						 ('7-oculos de proteção',default,20.0,70.0,3),
                                                                                         ('3-botas de couro',default,15.0,180.0,6);
                                                                                         
select * from vendedor;
insert into vendedor values (1,'Veneno LTDA','Av. Santos Drumond-1200',51908886660001),
							(2,'Elis costura ltda','Rua Dr. Gerino de Souza',53955554320001);
                            
select * from fornecedor;
insert into fornecedor values (1,'Vestimenta LTDA',55345678490001),
							  (2,'Equipamentos LTDA',53245678930001);
                              
select * from consulta_produto_fornecedor;
insert into consulta_produto_fornecedor values (1,2),
											   (2,2),
                                               (3,2),
                                               (4,1),
                                               (5,1),
                                               (6,2);
                                               
select * from estoque;
insert into estoque values (1,'Av. Luis Viana Filho-2000','bota de couro',100),
						   (2,'Av. Luis Viana Filho-2000','capacete',150),
                           (3,'Av. Luis Viana Filho-2000','luva impermeável',2000),
                           (4,'Av. Luis Viana Filho-2000','oculos de proteção',1500),
                           (5,'Av. Santos Drumond-1000','calça de brim',200),
                           (6,'Av. Santos Drumond-1000','camisa de manga longa de brim',200);

select * from consulta_produto_estoque;
insert into consulta_produto_estoque values (1,3,default,10),
											(2,2,default,30),
                                            (3,1,default,40),
                                            (4,5,default,100),
                                            (5,6,default,50),
                                            (6,4,default,30);
                                            
select * from disponibilidade_produto_pedido;
insert into disponibilidade_produto_pedido values (1,3,default),
												  (1,1,default),
                                                  (1,4,default),
                                                  (2,6,default),
                                                  (3,3,default);
                                                  
select * from pagamento;
insert into pagamento values(1,'Realizado',150,null,null,1,1,1,1),
							(2,'Realizado',70,1,null,null,2,3,2),
                            (3,'Realizado',180,null,1,null,3,6,3);

select * from pagamento_boleto;
insert into	pagamento_boleto values (1,2022-11-20,150,2022-11-25);
									
select * from pagamento_cartão_crédito;
insert into pagamento_cartão_crédito(bandeira_Cartão_crédito,Nº_Cartão_Crédito,nome_cliente_Cartão_Crédito,validade_CArtão_Crédito,valor_pago_Cartão)
																				values ('visa',2133445577889900,'Ademar Souza Santos','2022-12-01',70);

alter table pagamento_cartão_crédito modify Nº_Cartão_Crédito bigint;


select * from pagamento_Pix;
insert into pagamento_Pix (valor_Pix,chave_Pix) value (180,'awwk39383kkjfifndn999m');


select * from entrega;
insert into entrega values (1,default,'23nn23mms',null,'2022-11-21'),
							(2,'Entregue','44mm11sdf','2022-11-21','2022-11-16'),
                            (3,'Em trânsito','21oo33fds',null,'2022-11-15');

alter table entrega modify dataEntrega date;

select * from produto_vendedor;
insert into produto_vendedor values  (1,2,150),
									 (2,2,2000),
                                     (3,2,100),
                                     (4,1,200),
                                     (5,1,200),
                                     (6,2,1500);
