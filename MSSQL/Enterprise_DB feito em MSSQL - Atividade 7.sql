/* ⚠ Túlio Thauã Dutra >> */

-- CREATING THE DATABASE FOR MSSQL --
CREATE DATABASE enterprise_mssql_db;
GO

-- USING THIS DATABASE --
USE enterprise_mssql_db;
GO

-- CREATING THE TABLES --
/* DEPARTMENT'S TABLE */
CREATE TABLE tb_department (
	id_department int primary key,
	name_department varchar(30),
	dept_description varchar(50) not null,
);
GO
/* EMPLOYEE'S TABLE */
CREATE TABLE tb_employees (
	id_employee int primary key,
	name_employee varchar(30),
	cpf_employee varchar(11),
	department_id int,
	foreign key(department_id) references tb_department(id_department)
);
GO
/* PROJECT'S TABLE */
CREATE TABLE tb_projects (
	id_project int primary key,
	name_project varchar(30),
	project_description varchar(100)
);
GO
/* PROJECT EMPLOYEE'S TABLE */
CREATE TABLE tb_project_employee (
	id_project_employee int primary key,
	name_project_employee varchar(30),
	thestart_date date,
	theend_date date,
	employee_id int,
	project_id int,
	foreign key(employee_id) references tb_employees(id_employee),
	foreign key(project_id) references tb_projects(id_project)
);
GO
/* THE CHANGES */

/* EMPLOYEE'S TABLE */
ALTER TABLE tb_employees
	ADD comission_employee decimal(8,4) not null,
		document_employee varchar(50) not null,
		sex_employee varchar(20);
GO

ALTER TABLE tb_employees
	DROP COLUMN cpf_employee;
GO

ALTER TABLE tb_employees
	ALTER COLUMN name_employee varchar(50);
GO

/* DEPARTMENT'S TABLE */
ALTER TABLE tb_department
	ALTER COLUMN name_department varchar(50);
GO


EXEC sp_rename 'tb_department.dept_description', 'name_description', 'COLUMN';

GO
