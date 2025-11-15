# Boteco do zé Projeto final!

drop database if exists tulio_thaua_dutra;

create database tulio_thaua_dutra;

use tulio_thaua_dutra;

create table clientes (
    id_cliente int primary key auto_increment,
    nome_cliente varchar(100),
    fone varchar(20),
    genero char(1),
    rua varchar(70),
    numero int,
    cidade varchar(30),
    bairro varchar (20)
);

create table cargos (
    id_cargo int primary key auto_increment,
    descricao varchar(100)
);

create table funcionarios (
    id_funcionario int primary key auto_increment,
    nome_funcionario varchar(100),
    cpf varchar(11),
    fone varchar(20),
    salario decimal(11,2),
    cargo_id int
);

create table produtos (
    id_produto int primary key auto_increment,
    nome_produto varchar(50),
    descricao varchar(100),
    validade date,
    valor decimal(11,2)
);

create table lanches (
    id_lanche int primary key auto_increment,
    nome_lanche varchar(50),
    descricao varchar(150),
    valor decimal(11,2),
    tamanho varchar(20),
    categoria_id int
);

create table categorias (
    id_categoria int primary key auto_increment,
    descricao_categoria varchar(50)
);

create table drinks (
    id_drink int primary key auto_increment,
    nome_drink varchar(50),
    descricao varchar(100),
    valor decimal(11,2)
);

create table vendas (
    id_venda int primary key auto_increment,
    cliente_id int not null,
    data_venda date not null,
    hora_venda time not null,
    valor_total decimal(11,2),
    desconto decimal(11,2),
    forma_pagto_id int
);

create table formas_pagamento (
    id_forma_pagamento int primary key auto_increment,
    descricao_forma varchar (30)
);

create table itens_produtos (
    id_item_produto int primary key auto_increment,
    venda_id int,
    valor_unitario decimal(11,2),
    qtde int,
    produto_id int,
    funcionario_id int
);

create table itens_lanches (
    id_item_lanche int primary key auto_increment,
    venda_id int,
    valor_unitario decimal(11,2),
    qtde int,
    lanche_id int,
    funcionario_id int
);

create table itens_drinks (
    id_item_drinks int primary key auto_increment,
    venda_id int,
    valor_unitario decimal(11,2),
    qtde int,
    drink_id int,
    funcionario_id int
);

### CONSTRAINTS FOREIGN KEYS

alter table funcionarios add constraint fk_funcionario_cargo foreign key (cargo_id) references cargos(id_cargo);

alter table vendas add constraint fk_venda_cliente foreign key (cliente_id) references clientes(id_cliente);
alter table vendas add constraint fk_venda_formas foreign key (forma_pagto_id) references formas_pagamento(id_forma_pagamento);

alter table itens_produtos add constraint fk_itens_prod_venda foreign key (venda_id) references vendas(id_venda);
alter table itens_produtos add constraint fk_itens_prod_produto foreign key (produto_id) references produtos(id_produto);
alter table itens_produtos add constraint fk_itens_prod_funcionario foreign key (funcionario_id) references funcionarios(id_funcionario);

alter table itens_lanches add constraint fk_itens_lanche_venda foreign key (venda_id) references vendas(id_venda);
alter table itens_lanches add constraint fk_itens_lanche_produto foreign key (lanche_id) references lanches(id_lanche);
alter table itens_lanches add constraint fk_itens_lanche_funcionario foreign key (funcionario_id) references funcionarios(id_funcionario);

alter table itens_drinks add constraint fk_itens_drink_venda foreign key (venda_id) references vendas(id_venda);
alter table itens_drinks add constraint fk_itens_drink_produto foreign key (drink_id) references drinks(id_drink);
alter table itens_drinks add constraint fk_itens_drink_funcionario foreign key (funcionario_id) references funcionarios(id_funcionario);

alter table lanches add constraint fk_lanche_categoria foreign key (categoria_id) references categorias(id_categoria);


######## COLOQUE AQUI OS SEUS NOVOS CREATES E ALTER TABLES ##########



######## COLOQUE AQUI OS SEUS INSERTS ##########
