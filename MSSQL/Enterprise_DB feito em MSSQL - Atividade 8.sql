/* ⚠ Túlio Thauã Dutra >> */

-- CRIAR DATABASE
create database enterprise_mssql_db;
go

-- USAR DATABASE
use enterprise_mssql_db;
go

/* DEPARTMENT'S TABLE */
create table tb_department (
	id_department int primary key,
	name_department varchar(30),
	dept_description varchar(50) not null
);
go

/* EMPLOYEE'S TABLE */
create table tb_employees (
	id_employee int primary key,
	name_employee varchar(30),
	cpf_employee varchar(11),
	department_id int,
	foreign key(department_id) references tb_department(id_department)
);
go

/* PROJECT'S TABLE */
create table tb_projects (
	id_project int primary key,
	name_project varchar(30),
	project_description varchar(100)
);
go

/* PROJECT EMPLOYEE'S TABLE */
create table tb_project_employee (
	id_project_employee int primary key,
	name_project_employee varchar(30),
	thestart_date date,
	theend_date date,
	employee_id int,
	department_id int,
	project_id int,
	foreign key(employee_id) references tb_employees(id_employee),
	foreign key(project_id) references tb_projects(id_project),
	foreign key(department_id) references tb_department(id_department)
);
go

/* EMPLOYEE'S TABLE */
alter table tb_employees
	add comission_employee decimal(8,2),
		document_employee varchar(50),
		sex_employee varchar(20),
		salary_employee decimal(11,2);
go

alter table tb_employees
	drop column cpf_employee;
go

alter table tb_employees
	alter column name_employee varchar(50);
go

/* DEPARTMENT'S TABLE */
alter table tb_department
	alter column name_department varchar(50);
go

exec sp_rename 'tb_department.dept_description', 'name_description', 'column';
go

insert into tb_department (id_department, name_department, name_description) 
values 
(1, 'Desenvolvimento', 'Setor de desenvolvimento de software'),
(2, 'Marketing', 'Setor de estratégias de vendas'),
(3, 'Vendas', 'Equipe de vendedores'),
(4, 'Tecnologia', 'Infraestrutura e suporte'),
(5, 'Administração', 'Gestão administrativa');
go

insert into tb_employees (id_employee, name_employee, department_id, salary_employee, sex_employee)
values 
(1, 'Túlio', 4, 5000.00, 'MACHO'), 
(2, 'Luan', 5, 3000.00, 'MACHO'), 
(3, 'Pedrinho', 2, 500.00, 'MACHO'), 
(4, 'Arthur', 2, 1500.00, 'MACHO'),
(5, 'Matheus', 3, 2000.00, 'MACHO'),
(6, 'Kaue', 1, 2000.00, 'MACHO'),
(7, 'Natanael', 1, 2000.00, 'MACHO'),
(8, 'Vinicius', 5, 3000.00, 'MACHO'),
(9, 'Nicolas', 1, 4000.00, 'MACHO'),
(10, 'Jaqueline', 2, 1500.00, 'FEMEA'),
(11, 'Rafael', 2, 1200.00, 'MACHO'),
(12, 'Paulo', 3, 5000.00, 'MACHO'),
(13, 'Angelita', 5, 5000.00, 'FEMEA'),
(14, 'Claudemar', 1, 4000.00, 'MACHO'),
(15, 'Suelem', 3, 1000.00, 'FEMEA'),
(16, 'Gustavo', 4, 1200.00, 'MACHO'),
(17, 'Anthoni', 1, 1200.00, 'MACHO'),
(18, 'John Wick', 1, 15000.00, 'MACHO'),
(19, 'Marcelo', 3, 1300.00, 'MACHO'),
(20, 'Winston', 5, 3000.00, 'MACHO');
go

alter table tb_projects
	add department_id int;
go

insert into tb_projects (id_project, name_project, project_description, department_id)
values 
(1, 'Desenvolvimento de Inovação', 'processo de desenvolvimento focando na inovação e eficiência', 1),
(2, 'Marketing de vendas', 'Estratégia de vendas e divulgação', 2),
(3, 'Gerenciamento de Vendas', 'Controlar e Análise do processo de vendas ', 3),
(4, 'Software da Empresa', 'Engenharia do Software da Empresa', 4),
(5, 'Administração', 'Negociações e Segurança', 5);
go

insert into tb_project_employee 
(id_project_employee, name_project_employee, employee_id, thestart_date, theend_date, project_id)
values 
(1, 'Desenvolvimento de Inovação', 9, '2025-04-15', '2025-05-15', 1),
(2, 'Software da Empresa', 1, '2025-03-11', '2025-09-11', 4),
(3, 'Marketing de vendas', 11, '2025-06-21', '2025-11-20', 2);
go

update tb_employees 
set salary_employee = salary_employee * 1.15
where department_id = 1;
go
update tb_employees 
set comission_employee = 0.15 
where department_id = 1;
go

delete from tb_project_employee where employee_id = 2;
delete from tb_project_employee where project_id = 2;
delete from tb_projects where id_project = 2;
go
