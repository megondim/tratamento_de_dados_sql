create database restaurante;
 use restaurante;
 create table funcionarios (
 id_funcionarios int auto_increment primary key,
 nome varchar(255),
 cpf varchar(14),
 data_nascimento date,
 endereco varchar(255),
 telefone varchar(15),
 email varchar(100),
 cargo varchar(100),
 salario decimal(10,2),
 data_adimissao date
 );
 
 create table clientes (
 id_clientes int auto_increment primary key,
 nome varchar(255),
 cpf varchar(14),
 data_nascimento date,
 endereco varchar(255),
 telefone varchar(15),
 email varchar(100),
 data_cadastro date
 );
 
 create table produtos (
 id_produtos int auto_increment primary key,
 nome varchar(255),
 descricao text,
 preco decimal(10,2),
 categoria varchar(100)
 );
 
 create table pedidos (
 id_pedido int auto_increment primary key,
 id_clientes int,
 foreign key (id_clientes) references clientes (id_clientes),
 id_funcionarios int,
 foreign key (id_funcionarios) references funcionarios (id_funcionarios),
 id_produtos int,
 foreign key (id_produtos) references produtos (id_produtos),
 quantidade int,
 preco decimal(10,2),
 data_pedido date,
 status_pedido varchar(50)
 );
 
 create table info_produtos (
 id_info int auto_increment primary key,
 id_produtos int,
 foreign key (id_produtos) references produtos (id_produtos),
 ingredientes text,
 fornecedor varchar(255)
);

