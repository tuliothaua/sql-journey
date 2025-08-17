#Túlio Thauã Dutra >>

#Creating the car hire company database
CREATE DATABASE carhire_db;

#Choosing the database to use
USE carhire_db;

#Creating the tables
-- Client's Table --
 CREATE TABLE tb_clients (
	id_client int auto_increment primary key,
    client_name varchar(50) not null, 
    client_email varchar(100) unique, 
    client_cpf varchar(14) not null unique, 
    client_address varchar(250),
    client_phone varchar(15)
);
-- Employee's Table --
CREATE TABLE tb_employees (
	id_employee int auto_increment primary key,
    employee_name varchar(50) not null,
    employee_cpf varchar(14) not null unique,
    employee_role varchar(50)
);
-- Car's Table --
CREATE TABLE tb_cars (
	id_car int auto_increment primary key,
    car_model varchar(100) not null,
    car_plate varchar(10) not null unique,
    car_year int not null,
    car_daily_price decimal(11,2) not null, 
    car_available boolean default true
);
-- Rental's Table --
CREATE TABLE tb_rentals (
	id_rental int auto_increment primary key,
    client_id int,
    employee_id int,
    rental_date date not null,
    return_date date,
    foreign key (client_id) references tb_clients(id_client),
    foreign key (employee_id) references tb_employees(id_employee)
);
-- Table: Rental Cars (Many-to-Many)--
CREATE TABLE tb_rental_cars (
	rental_id int,
    car_id int,
    quantity int not null default 1,
    primary key (rental_id, car_id),
    foreign key (rental_id) references tb_rentals(id_rental),
    foreign key (car_id) references tb_cars(id_car)
);