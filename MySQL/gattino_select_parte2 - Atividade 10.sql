drop database if exists atividade_10;

create database atividade_10;

use atividade_10;

create table tb_departamento (
    id_departamento int primary key auto_increment,
    nome varchar (100) not null
);

create table tb_empregado (
    id_empregado int primary key auto_increment,
    nome varchar(50) not null,
    sexo int,
    salario decimal(11,2),
    data_nascimento date,
    departamento_id int,
    CONSTRAINT FK_Departamento_Empregado FOREIGN KEY (departamento_id) REFERENCES tb_departamento(id_departamento)
);

create table tb_projeto(
    id_projeto int primary key auto_increment,
    nome varchar (30) not null
);

create table tb_projeto_empregado (
     o int primary key auto_increment,
    empregado_id int,
    projeto_id int,
    data_inicial date,
    data_final date,
    CONSTRAINT FK_Projeto_Empregado FOREIGN KEY (projeto_id) REFERENCES tb_projeto(id_projeto),
    CONSTRAINT FK_Empregado_Projeto FOREIGN KEY (empregado_id) REFERENCES tb_empregado(id_empregado)
);

# INSERINDO DADOS NA TABELA DE DEPARTAMENTOS
INSERT INTO tb_departamento
    (nome)
VALUES
    ('Desenvolvimento'),
    ('Financeiro'),
    ('Contabilidade'),
    ('Vendas'),
    ('Recursos Humanos'),
    ('Estoque'),
    ('Atendimento'),
    ('Almoxarifado');


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
    ('Rita de Castro Campos', null, 3800, '1975-01-7',null),
    ('Neymar Jr', null, null, '2000-06-25',null),
    ('Cristiano Ronaldo', null, 5000, '1990-12-25',null),
    ('Lionel Messi', null, 8800, '1993-01-01',null);


INSERT INTO tb_projeto
    (nome)
VALUES
    ("Alfa"),
    ("Beta"),
    ("Gama"),
    ("Delta"),
    ("Omega"),
    ("Kappa"),
    ("Lambda");


INSERT INTO tb_projeto_empregado
    (empregado_id, projeto_id, data_inicial, data_final)
VALUES
    (1, 1, '2025-01-01', '2025-01-31'),
    (2, 1, '2025-01-10', '2025-02-28'),
    (3, 1, '2025-03-01', '2025-03-31'),
    (4, 2, '2025-04-01', '2025-04-30'),
    (5, 2, '2025-05-01', '2025-05-31'),
    (6, 2, '2025-06-01', '2025-06-30'),
    (7, 3, '2025-07-01', '2025-07-31'),
    (8, 3, '2025-08-01', '2025-08-31'),
    (9, 3, '2025-09-01', '2025-09-30'),
    (10, 4, '2025-10-01', '2025-10-31'),
    (11, 4, '2025-11-01', '2025-11-30'),
    (12, 4, '2025-12-01', '2025-12-31'),
    (13, 5, '2021-01-01', '2021-01-31'),
    (14, 5, '2021-02-01', '2021-02-28'),
    (15, 5, '2021-03-01', '2021-03-31');
    
    #Túlio Thauã Dutra >>
    
    #1. Todos os empregados do sexo feminino, mostrando o nome, salario, sexo e departamento.
    select tbe.nome as "Nome", tbe.salario as "Salário", tbd.nome as "Departamento" 
    from tb_empregado tbe join tb_departamento tbd
    on departamento_id = id_departamento
    where tbe.sexo = 2;
    
    #2. Todos os empregados com seus respectivos departamentos, inclusive os departamentos sem empregados.
    select tbe.nome as "Nome", tbd.nome as "Departamento"
    from tb_empregado tbe left join tb_departamento tbd
    on  departamento_id = id_departamento;
    
    #3. Um relatório de departamentos que não possuem empregados para contratação de novos empregados.
	select tbe.nome as "Nome", tbd.nome as "Departamento"
    from tb_empregado tbe right join tb_departamento tbd
    on  departamento_id = id_departamento;
    
    #4. Todos os empregados com nome, salário, sexo e nome dos projetos Delta e Omega.
    select tbe.nome as "Nome", tbe.salario as "Salário", tbe.sexo as "Sexo", tbp.nome as "Nome Projeto"
    from tb_empregado tbe join tb_projeto_empregado tbpe join tb_projeto tbp
    on tbp.id_projeto = tbpe.projeto_id && tbpe.empregado_id = tbe.id_empregado;
    
    #5. Todos os empregados com seus respectivos departamentos, inclusive os empregados sem departamento.
	select tbe.nome as "Nome", tbd.nome as "Departamento"
    from tb_empregado tbe left join tb_departamento tbd
    on  departamento_id = id_departamento;
   
   #6. Todos os empregados com seus respectivos projetos, departamentos e com o salário maior que 1500.
   select tbe.nome as "Nome", tbe.salario as "Salário", tbe.sexo as "Sexo", tbp.nome as "Nome Projeto"
   from tb_empregado tbe join tb_projeto_empregado tbpe join tb_projeto tbp
   on tbp.id_projeto = tbpe.projeto_id && tbpe.empregado_id = tbe.id_empregado
   && tbe.salario > 1500;
   
   #7. Todos os empregados que não estão em nenhum projeto.
   select tbe.nome as "Nome", tbpe.projeto_id as "Projeto"
   from tb_empregado tbe left join tb_projeto_empregado tbpe
   on tbpe.empregado_id = tbe.id_empregado
   where tbpe.projeto_id is null;
   
   #8. Todos os projetos sem nenhum empregado.
   select tbp.nome as "Projeto", tbpe.empregado_id as "Empregados"
   from tb_projeto tbp left join tb_projeto_empregado tbpe
   on tbpe.projeto_id = tbp.id_projeto
   where tbpe.empregado_id is null;
   
   #9. Todos os empregados com seus respectivos projetos,
   #departamentos, com o salário maior que 1500 do sexo masculino.
   
   select tbe.nome as "Nome", tbe.salario as "Salario", tbd.nome as "Departamento", tbp.nome as "Projeto"
   from tb_empregado tbe join tb_projeto_empregado tbpe join tb_projeto tbp join tb_departamento tbd
   on tbe.id_empregado = tbpe.empregado_id && tbp.id_projeto = tbpe.projeto_id 
   && tbd.id_departamento = tbe.departamento_id
   where tbe.salario > 1500 && tbe.sexo = 1;
   
   #10. Todos os empregados e projetos com a data inicial entre 01/01/2025 a 12/05/2025.
   select tbe.nome as "Nome", tbp.nome as "Projeto", tbpe.data_inicial
   from tb_empregado tbe join tb_projeto_empregado tbpe join tb_projeto tbp
   on tbe.id_empregado = tbpe.empregado_id && tbp.id_projeto = tbpe.projeto_id
   where tbpe.data_inicial between '2025-01-01' and '2025-05-12'
   