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
    dept_description varchar(100) not null
);
#Employee's Table
CREATE TABLE tb_employees (
	id_employee int auto_increment primary key,
    name_employee varchar(30),
    cpf_employee varchar(11),
    department_id int,
    foreign key (department_id) references tb_department(id_department)
); 
#Project's Table
CREATE TABLE tb_projects (
	id_project int auto_increment primary key,
    name_project varchar(30),
    project_description varchar(100) not null
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
-- Some changes in the base that teacher gattino want me to do --
--------------------------------------------------------------------------------
ALTER TABLE tb_employees
	ADD  COLUMN commission decimal (8,4) not null, -- thx for your slide --
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
