create database atividade9;

use atividade9;

create table tb_departamento (
    id_departamento INT NOT NULL auto_increment,
    nome varchar (100) NOT NULL,
    PRIMARY KEY (id_departamento)
);

create table tb_empregado (
    id_empregado INT NOT NULL auto_increment,
    nome VARCHAR(100) NOT NULL,
    sexo INT,
    salario DECIMAL(11,2),
    data_nascimento DATE,
    departamento_id INT,
    PRIMARY KEY (id_empregado),
    CONSTRAINT FK_departamentoempregado FOREIGN KEY
(departamento_id) REFERENCES tb_departamento(id_departamento)
);

create table tb_projeto(
    id_projeto INT NOT NULL auto_increment,
    nome varchar (30) NOT NULL,
    PRIMARY KEY (id_projeto)
);

create table tb_projeto_empregado (
    id_projeto_empregado INT NOT NULL auto_increment,
    empregado_id INT,
    projeto_id INT,
    data_inicial DATE,
    data_final DATE,
    PRIMARY KEY (id_projeto_empregado),
    CONSTRAINT FK_ProjetoEmpregado FOREIGN KEY (projeto_id) REFERENCES tb_projeto(id_projeto),
    CONSTRAINT FK_EmpregadoProjeto FOREIGN KEY (empregado_id) REFERENCES tb_empregado(id_empregado)
);

# INSERINDO DADOS NA TABELA DE DEPARTAMENTOS
INSERT INTO tb_departamento
    (nome)
VALUES
    ('Desenvolvimento'),
    ('Financeiro'),
    ('Contabilidade'),
    ('Vendas'),
    ('Recursos Humanos');


# INSERINDO DADOS NA TABELA DE EMPREGADOS
INSERT INTO tb_empregado
    (nome, sexo, salario, data_nascimento, departamento_id)
VALUES
    ('João da Silva', 1, 1000, '2000-03-07', 1),
    ('Maria Silveira', 2, 1000,'2003-04-13', 1),
    ('Lidia Pereira', 2, 1200, '2000-05-20', 1),
    ('Victor Oliveira', 1, 1500, '1991-06-29', 1),
    ('Paulo Silva Campos', 1, 5000, '1992-05-31', 2),
    ('Pedro Campos', 1, 10000, '2001-02-10', 2),
    ('José da Silva Oliveira', 1, 9500, '2000-02-28', 2),
    ('João Carlos Pereira', 1, 15000, '1999-03-30', 2),
    ('Ana Paula Amorim', 2, 20000, '1998-07-19', 3),
    ('Antônia de Castro', 2, 2000, '1965-10-22', 3),
    ('Elisa Silveira Campos', 2, 3000, '1980-12-16', 3),
    ('Gilson Machado', 1, 1000, '1982-11-13',3),
    ('Andreia Vitoria Silva', 2, 1200, '1990-11-17',4),
    ('Vicente da Rosa Silva', 1, 2200, '1995-10-08',4),
    ('Juliana Oliveira', 2, 3500, '1997-08-05',4),
    ('Marlon da Silva', 1, 2400,'1996-09-03',4),
    ('Silvio Luis Oliveira', 1, 1800, '2006-09-01',5),
    ('Roberto Carlos Castro', null, 4300, '2002-02-11',5),
    ('Maria Betânia Amorim', null, 5500, '1999-03-2',5),
    ('Rita de Castro Campos', null, 3800, '1975-01-7',5);


INSERT INTO tb_projeto
    (nome)
VALUES
    ("Alfa"),
    ("Beta"),
    ("Gama"),
    ("Delta"),
    ("Omega"),
    ("Lambda");


INSERT INTO tb_projeto_empregado
    (empregado_id, projeto_id, data_inicial, data_final)
VALUES
    (1, 1, '2022-01-01', '2022-01-31'),
    (2, 1, '2022-01-10', '2022-02-28'),
    (3, 1, '2022-03-01', '2022-03-31'),
    (4, 2, '2022-04-01', '2022-04-30'),
    (5, 2, '2022-05-01', '2022-05-31'),
    (6, 2, '2022-06-01', '2022-06-30'),
    (7, 3, '2022-07-01', '2022-07-31'),
    (8, 3, '2022-08-01', '2022-08-31'),
    (9, 3, '2022-09-01', '2022-09-30'),
    (10, 4, '2022-10-01', '2022-10-31'),
    (11, 4, '2022-11-01', '2022-11-30'),
    (12, 4, '2022-12-01', '2022-12-31'),
    (13, 5, '2021-01-01', '2021-01-31'),
    (14, 5, '2021-02-01', '2021-02-28'),
    (15, 5, '2021-03-01', '2021-03-31');
--------------------------------------------------------------
-------- # SELECIONANDO COM TÚLIO THAUÃ DUTRA ----------------
--------------------------------------------------------------
#1) Busque todos os registros da tabela departamento;
select * from tb_departamento;

#2) Busque todos os registros da tabela empregado;
select * from tb_empregado;

#3) Busque todos os registros da tabela projeto;
select * from tb_projeto;

#4) Busque os empregados que iniciam com a letra “J”;
select * from tb_empregado where nome like 'J%';

#5) Busque os empregados que terminam com a letra “O”;
select * from tb_empregado where nome like '%O';

#6) Busque os empregados que contenham a letra “A”;
select * from tb_empregado where nome like '%A%';

#7) Busque todas as mulheres;
select * from tb_empregado where sexo like 2;

#8) Busque os empregados do departamento 2;
select * from tb_empregado where departamento_id = 2;

#9) Busque as empregados ordenados por salario;
select * from tb_empregado order by salario;

#10) Busque os empregados com salario maior que 10 mil e do departamento 1;
select * from tb_empregado where salario >= 10000 and departamento_id = 1; 

#11) Busque as os projetos com data inicial entre 01/03/2022 e 31/03/2022.
select * from tb_projeto_empregado where data_inicial between '2022-03-01' and '2022-03-31';
