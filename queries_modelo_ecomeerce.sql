-- realizando querys no esquema e-commerce
use e_commerce;
show tables;
-- realizar consulta nos clientes que são pessoa fisica
select * from pessoa_fisica;

select * from pessoa_juridica;

select * from clientes;

select * from clientes, pessoa_fisica;

select concat(primeiro_nome,' ',nome_do_meio,' ',ultimo_nome) Nome_Completo,cidade,cpf
from clientes,pessoa_fisica
where PF_idPF = 1
group by cpf;
  

select razão_social,cidade,cnpj
from clientes,pessoa_juridica
where PJ_idPJ = 1
group by cnpj;

-- realizando consulta de clientes que fizeram pedido

select razão_social,cidade,primeiro_nome
from clientes,pedido,pessoa_fisica,pessoa_juridica
group by cnpj;

select * from entrega;



