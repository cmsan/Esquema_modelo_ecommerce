-- vamos criar o esquema a partir do diagrama e-commerce feito anteriormente.

create database e_commerce;

use e_commerce;

show tables;

select * from Pessoa_Fisica;

create table Pessoa_Fisica(
	idPF integer not null,
    primeiro_nome varchar(15),
    nome_do_meio varchar(15),
    ultimo_nome varchar(15),
    cpf int(11) not null,
    data_nascimento date not null,
    constraint unique_cpf_PF unique(cpf),
    constraint pk_PF primary key(idPF)
);

create table Pessoa_Juridica(
	idPJ int primary key,
    razão_social varchar(45) not null,
    cnpj int(14) not null,
    data_inscrição date not null,
    constraint unique_cnpj_PJ unique(cnpj)
);

create table clientes(
	idcliente INT NOT NULL auto_increment,
    rua varchar(45) not null,
    nº int(6) not null,
    bairro varchar(30) not null,
    cidade varchar(15) not null,
    estado varchar(20) not null,
    telefone int(12) not null,
    email varchar(45) not null,
    PF_idPF int,
    PJ_idPJ int,
    constraint pk_idcliente primary key(idcliente),
    constraint unique_idcliente unique(idcliente),
    constraint fk_clientes_PF foreign key (PF_idPF) references Pessoa_Fisica(idPF),
    constraint fk_clientes_PJ foreign key (PJ_idPJ) references Pessoa_Juridica(idPJ)
);

select * from clientes;

create table Pedido(
	Nº_Pedido int not null auto_increment,
    descrição varchar(45),
    status_Pedido enum('Processando','Em andamento','Enviado','Entregue') default 'Processando',
    frete float,
    valor_pedido float not null,
    clientes_idcliente int,
    pagamento_idPagamento int,
    entrega_idEntrega int,
    constraint pk_Pedido primary key(Nº_Pedido),
    constraint fk_Pedido_Clientes foreign key (clientes_idcliente) references Clientes(idcliente),
    constraint fk_Pedido_Pagamento foreign key (pagamento_idPagamento) references Pagamento(idPagamento),
    constraint fk_Pedido_Entrega foreign key (entrega_idEntrega) references Entrega (idEntrega)
   );

select * from Pedido;

create table Pagamento(
	idPagamento int not null unique,
    status_Pagamento enum('Aguardando','Processando','Realizado','Cancelado') default 'Aguardando',
    valor_Pagamento float not null,
    cartão_crédito_idPagamento_Cartão_Crédito int,
    pix_idPagamento_Pix int,
    boleto_idPgamento_Boleto int,
    pedido_NºPedido int not null,
    pedido_Clientes_idCliente int not null,
    pedido_Entrega_idEntrega int not null,
    constraint primary key (idPagamento),
    constraint fk_Pagamento_Pagamento_cartão_crédito_ foreign key (cartão_crédito_idPagamento_Cartão_Crédito) references Pagamento_Cartão_Crédito(idPagamento_Cartão_Crédito),
    constraint fk_Pagamento_Pagamento_Pix foreign key (pix_idPagamento_Pix) references Pagamento_Pix(idPagamento_Pix),
    constraint fk_Pagamento_Pagamento_Boleto foreign key (pix_idPagamento_Pix) references Pagamento_Pix(idPagamento_Pix)
);

create table pagamento_Boleto(
	idBoleto int(48) not null,
    data_pagamento date not null,
    valor_Boleto float not null,
    vencimento_Boleto date not null,
    constraint primary key (idBoleto)
);

create table Pagamento_Cartão_Crédito(
	idPagamento_Cartão_Crédito int not null unique auto_increment,
    bandeira_Cartão_crédito varchar(20) not null,
    Nº_Cartão_Crédito int(16) not null unique,
    nome_cliente_Cartão_Crédito varchar(45) not null,
    validade_Cartão_Crédito date not null,
    valor_pago_Cartão float not null,
    constraint primary key(idPagamento_Cartão_Crédito)
);

create table Pagamento_Pix(
	idPagamento_Pix int not null auto_increment,
    valor_Pix float not null,
    chave_Pix varchar(32) not null,
    constraint Pagamento_Pix_unique unique(idPagamento_Pix),
    constraint primary key(idPagamento_Pix)
);

create table Produto(
	idProduto int not null auto_increment,
    nome varchar(45) not null,
    valor float not null,
    descrição varchar(45),
    categoria enum('Eletrônico','Vestimenta','Brinquedos','Moveis') not null default 'Eletrônico',
    classificação_Kids boolean default false,
    constraint Produto_unique unique(idProduto),
    constraint primary key(idProduto)
);

create table Estoque(
	idEstoque int not null,
    endereço varchar(45) not null,
    item varchar(45) not null,
    quantidade_Item int default 1,
   constraint primary key(idEstoque)
);
    
create table Entrega(
		idEntrega int not null,
        StatusEntrega enum('Em Preparação', 'Com a Trasnportadora', 'Em Transito', 'Entregue') not null default 'Em Preparação',
        código_de_Rastreio varchar(13) not null,
        dataEntrega date ,
        data_saida_Entrega date not null,
        constraint Entrega_unique unique (código_de_Rastreio,dataEntrega,data_saida_Entrega),
        constraint primary key(idEntrega)
);
 
 select * from Entrega;
 
create table Fornecedor(
		idFornecedor int not null,
        Razão_Social  varchar(45) not null,
        CNPJ int(14) not null,
        constraint Fornecedor_unique unique(CNPJ),
        constraint primary key(idFornecedor)
);
    
create table Vendedor(
		idVendedor int not null,
        razão_Social varchar(45) not null,
        endereço varchar(45) not null,
        cnpj int(14) not null,
        constraint Vendedor_unique unique(cnpj),
        constraint primary key(idVendedor)
);
    
create table Consulta_Produto_Estoque(
		Produto_idProduto int not null,
        Estoque_idEstoque int not null,
        status_Consulta_Produto_Estoque enum('Com Estoque', 'Sem Estoque'),
        quantidade_Consulta int not null,
        constraint fk_Consulta_Produto foreign key (Produto_idProduto) references Produto (idProduto),
	    constraint fk_Consulta_Estoque foreign key (Estoque_idEstoque) references Estoque(idEstoque)
);
        
    create table Produto_Vendedor(
		Produto_idProduto int not null,
        Vendedor_idVendedor int not null,
        quantidade int,
        constraint fk_Produto_Vendedor_Produto foreign key (Produto_idProduto) references Produto(idProduto),
	    constraint fk_Produto_Vendedor_Vendedor foreign key (Vendedor_idVendedor) references Vendedor(idVendedor)
);
    
create table Disponibilidade_Produto_Pedido(
	Pedido_Nº_Pedido int not null,
    Produto_idProduto int not null,
    Status_disponibilidade ENUM('Disponivel', 'Indisponivel'),
    constraint fk_Disponibilidade_Pedido foreign key(Pedido_Nº_Pedido) references Pedido(Nº_Pedido),
    constraint fk_Disponibilidade_Produto foreign key(Produto_idProduto) references Produto(idProduto)
);    

create table Consulta_Produto_Fornecedor(
	Produto_idProduto int not null,
    Fornecedor_idFornecedor int not null,
    constraint fk_ConsultaProduto foreign key(Produto_idProduto) references Produto(idProduto),
    constraint fk_ConsultaFornecedor foreign key(Fornecedor_idFornecedor) references Fornecedor(idFornecedor)
   );
   