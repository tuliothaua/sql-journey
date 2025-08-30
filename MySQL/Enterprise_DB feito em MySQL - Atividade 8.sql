####Túlio Thauã Dutra 🚜 >>

-- Creating the thauã-enterprise database --
CREATE DATABASE enterprise_db;

-- Using this crazy database --
USE enterprise_db;

-- Creating the tables --
#Department's Table
CREATE TABLE tb_department ( 
	id_department int auto_increment primary key,
    name_department varchar(30) not null,
    dept_description varchar(100)  
);
#Employee's Table
CREATE TABLE tb_employees (
	id_employee int auto_increment primary key,
    name_employee varchar(30),
    cpf_employee varchar(11),
    department_id int,
    salary_employee decimal(11,2),
    foreign key (department_id) references tb_department(id_department)
); 
#Project's Table
CREATE TABLE tb_projects (
	id_project int auto_increment primary key,
    name_project varchar(30),
    project_description varchar(100) not null,
    department_id int,
    foreign key (department_id) references tb_department(id_department)
);
#Projects Employee's Table
CREATE TABLE tb_project_employee (
	id_project_employee int auto_increment primary key,
    name_project_employee varchar(30),
    start_date date,
    end_date date,
    employee_id int,
    project_id int,
    foreign key(employee_id) references tb_employees(id_employee),
    foreign key(project_id) references tb_projects(id_project)
);
--------------------------------------------------------------------------------
ALTER TABLE tb_employees
	ADD  COLUMN commission decimal (11,2),
	ADD  COLUMN document varchar(50),
	ADD  COLUMN sex_employee varchar(15),
	DROP COLUMN cpf_employee,
	MODIFY COLUMN name_employee varchar(50);
--------------------------------------------------------------------------------
ALTER TABLE tb_department 
	MODIFY COLUMN name_department varchar(50),
    RENAME COLUMN dept_description TO dept_name;
--------------------------------------------------------------------------------
ALTER TABLE tb_projects
	MODIFY COLUMN name_project varchar(50);
--------------------------------------------------------------------------------
ALTER TABLE tb_project_employee 
	MODIFY COLUMN name_project_employee varchar(50);
--------------------------------------------------------------------------------
insert into tb_department (id_department, name_department) 
values (1, "Desenvolvimento"),
	   (2, "Marketing"),
       (3, "Vendas"),
       (4, "Tecnologia"),
       (5, "Adminitração");
---------------------------------------------------------------------------------
insert into tb_employees (id_employee, name_employee, department_id, salary_employee, sex_employee)
values (1, "Túlio", 4,5000.00, "MACHO"), (2, "Luan", 5,3000.00, "MACHO"), (3, "Pedrinho", 2, 500.00, "MACHO"), (4, "Arthur", 2, 1500.00, "MACHO"), 
	   (5, "Matheus", 3,2000.00, "MACHO"), (6, "Kaue", 1, 2000.00, "MACHO"), (7, "Natanael", 1, 2000.00, "MACHO"), (8, "Vinicius", 5, 3000.00, "MACHO"),
       (9, "Nicolas", 1,4000.00, "MACHO"), (10, "Jaqueline", 2,1500.00, "FEMEA"), (11, "Rafael", 2, 1200.00, "MACHO"), (12, "Paulo", 3, 5000.00, "MACHO"),
       (13, "Angelita", 5,5000.00, "FEMEA"), (14, "Claudemar", 1, 4000.00, "MACHO"), (15, "Suelem", 3, 1000.00, "FEMEA"), (16, "Gustavo", 4, 1200.00, "MACHO"),
       (17, "Anthoni", 1,1200.00, "MACHO"), (18, "John Wick", 1, 15000.00, "MACHO"), (19, "Marcelo", 3, 1300.00, "MACHO"), (20, "Winston", 5, 3000.00, "MACHO");
---------------------------------------------------------------------------------
insert into tb_projects (id_project, name_project, project_description, department_id)
values (1, "Desenvolvimento de Inovação", "processo de desenvolvimento focando na inovação e eficiência", 1),
	   (2, "Marketing de vendas", "Estratégia de vendas e divulgação", 2),
	   (3, "Gerenciamento de Vendas", "Controlar e Análise do processo de vendas ", 3),
       (4, "Software da Empresa", "Engenharia do Software da Empresa", 4),
       (5, "Administração", "Negociações e Segurança", 5);
---------------------------------------------------------------------------------
insert into tb_project_employee 
(id_project_employee, name_project_employee, employee_id, start_date, end_date, project_id)
values (1, "Desenvolvimento de Inovação", 9, "2025-04-15", "2025-5-15", 1),
       (2, "Software da Empresa", 1, "2025-03-11", "2025-09-11", 4),
       (3, "Marketing de vendas", 11, "2025-06-21", "2025-11-20", 2);
---------------------------------------------------------------------------------
alter table tb_department
MODIFY COLUMN dept_name varchar(100);
---------------------------------------------------------------------------------
update tb_employees set salary_employee = salary_employee * 1.15
where department_id = 1;
update tb_employees set commission = 0.15 where department_id = 1;
-----------------------------------------------------------------------------------
delete from tb_project_employee where employee_id = 2;
delete from tb_project_employee where project_id = 2;
delete from tb_projects where id_project = 2;
-----------------------------------------------------------------------------------
