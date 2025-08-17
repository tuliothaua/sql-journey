#Túlio Thauã Dutra :D >>

#Creating the Market Database
CREATE DATABASE Market_db;

#Choosing the database to use
USE Market_db;

#Creating the tables
CREATE TABLE tb_clients (
		id_client int auto_increment primary key,
        client_name varchar(50) not null,
        client_email varchar(100) unique,
        client_cpf varchar(14) not null unique,
        client_address varchar(250),
        client_phone varchar(15)
);
CREATE TABLE tb_employees (
		id_employee int auto_increment primary key,
        employee_name varchar(50),
        employee_cpf varchar(14) not null unique,
        employee_role varchar(50) 
);
CREATE TABLE tb_products (
		id_product int auto_increment,
        product_name varchar(100) not null,
        product_price decimal(11,2) not null,
        product_stock int,
        primary key (id_product)
);
CREATE TABLE tb_sales (
	id_sale int auto_increment,
    client_id int,
    date_sale date not null,
    primary key (id_sale),
    foreign key (client_id) references tb_clients(id_client)
);
CREATE TABLE tb_sale_products (
	sale_id	int,
    product_id int,
    quantity int not null,
    primary key (sale_id, product_id),
    foreign key (sale_id) references tb_sales(id_sale),
    foreign key (product_id) references tb_products(id_product)
);