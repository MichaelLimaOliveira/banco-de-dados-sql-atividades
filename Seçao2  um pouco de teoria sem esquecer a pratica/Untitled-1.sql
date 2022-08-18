/* comando para criar DB */
CREATE DATABASE PROJETO;
/* comando para usar/connectar o  DB*/
USE CLIENTE;
/*Criando a tabela de cliente*/
CREATE TABLE CLIENTE(
    NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(30),
    CPF INT(11),
    TELEFONE VARCHAR(30),
    ENDERECO VARCHAR(100)
);

/*mostrando a tabela criada*/
SHOW TABLES;
/*mostrando como e a estrutura da tabela*/
DESC CLIENTE;
/*Inserindo valores na tabela*/
INSERT INTO CLIENTE(NOME,SEXO,EMAIL,CPF,TELEFONE,ENDERECO) VALUES('Michael', 'M', 'michaellima.contato@gmail.com',12151458610,'(31) 99572-6797', 'Avenida Francisco De Paula Castro, N-114, Bomsucesso');

INSERT INTO CLIENTE VALUES ('Michael', 'M', 'michaellima.contato@gmail.com',12151458610,'(31) 99572-6797', 'Avenida Francisco De Paula Castro, N-114, Bomsucesso');

INSERT INTO CLIENTE VALUES('Miguel', 'F', 'mi0.contato@gmail.com',121522586,'(31) 94552-6257', 'Avenida Francisco Castro, N-4, Bomsso'),
('Estevão','M','estevao@gmial.com',123456789,'(31) 99321-0998','Avenida Casa Dele La, N-666, Bairros');

/*comando select 
Seleção projeção e junção*/
SELECT NOW() as DATA_HORA, 'Michael' AS ALUNO;
SELECT 'Michael lima';
SELECT 'BANCO DE DADOS';

/* Alias de colunas*/
SELECT NOME AS CLIENTE, SEXO, ENDERECO FROM CLIENTE;
SELECT NOME, SEXO, EMAIL FROM CLIENTE;

/*Filtrando a query*/
SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO ='M';

SELECT NOME, EMAIL FROM CLIENTE
WHERE SEXO ='F';

/*caracter curinga "%" pode ser usado no inicio, fim ou ambos para representar que tem algo antes, depois ou entre o filtro*/
SELECT NOME, EMAIL FROM CLIENTE
WHERE ENDERECO LIKE 'Avenida%';

SELECT NOME, EMAIL FROM CLIENTE
WHERE ENDERECO LIKE '%N%';


CREATE TABLE LIVROS(
    ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID),
    NOME_DO_AUTOR VARCHAR(30),
    SEXO_DO_AUTOR CHAR(1),
    NOME_DO_LIVRO VARCHAR(50),
    VALOR_DO_LIVRO DECIMAL(10,2),
    NOME_DA_EDITORA VARCHAR(50),
    ESTADO_UF_DA_EDITORA CHAR(2),
    ANO_PUBLICACAO CHAR(4),
    NUMERO_DE_PAGINAS INT(4)
);

select * from livraria.livros;

INSERT INTO LIVROS(
    NOME_DO_AUTOR,
    SEXO_DO_AUTOR,
    NOME_DO_LIVRO,
    VALOR_DO_LIVRO,
    NOME_DA_EDITORA,
    ESTADO_UF_DA_EDITORA,
    ANO_PUBLICACAO,
    NUMERO_DE_PAGINAS
) VALUES (
    'Ana Claudia',
    'F',
    'Cavaleiro Real',
    49.90,
    'Atlas',
    'RJ',
    '2009',
    465
);

INSERT INTO LIVROS(
    NOME_DO_LIVRO,
    NOME_DO_AUTOR,
    SEXO_DO_AUTOR,
    NUMERO_DE_PAGINAS,
    NOME_DA_EDITORA,
    VALOR_DO_LIVRO,
    ESTADO_UF_DA_EDITORA,
    ANO_PUBLICACAO
) VALUES (
    'SQL para leigos',
    'João Nunes',
    'M',
    450,
    'Addison',
    98.00,
    'SP',
    '2018'
);
insert into cliente(NOME, SEXO, CPF, TELEFONE, ENDERECO) values('Maria', 'F', 12454653, '31 95464864', 'sadkasdjkasdj jaksdjklasd kadsjkads');


INSERT INTO LIVROS(
    NOME_DO_LIVRO,
    NOME_DO_AUTOR,
    SEXO_DO_AUTOR,
    NUMERO_DE_PAGINAS,
    NOME_DA_EDITORA,
    VALOR_DO_LIVRO,
    ESTADO_UF_DA_EDITORA,
    ANO_PUBLICACAO
) VALUES (
    'O peder da mente',
    'Clara Mafra',
    'F',
    120,
    'Continental',
    56.58,
    'RS',
    '2017'
);

select NOME_DO_LIVRO, ESTADO_UF_DA_EDITORA FROM livraria.LIVROS
WHERE SEXO_DO_AUTOR = 'M';

4 - SELECT NOME_DO_LIVRO, NUMERO_DE_PAGINAS FROM livraria.LIVROS
WHERE SEXO_DO_AUTOR = 'F';


5 - SELECT VALOR_DO_LIVRO FROM livraria.livros
WHERE ESTADO_UF_DA_EDITORA = 'SP';

6 - SELECT * FROM livraria.livros
WHERE SEXO_DO_AUTOR = 'M'
WHERE ESTADO_UF_DA_EDITORA = 'RJ'
WHERE ESTADO_UF_DA_EDITORA = 'SP';

SELECT * FROM livraria.livros
WHERE SEXO_DO_AUTOR = 'M' && (ESTADO_UF_DA_EDITORA = 'SP' || ESTADO_UF_DA_EDITORA = 'RJ');

ALTER TABLE livraria.livros
MODIFY COLUMN ANO_PUBLICACAO int;

/* contando os registros da tabela*/

select count(*) from livros;

/*usando alias 'as ... '*/
select count(*) as "quantidade de livros da tabela" from livros;

/* agrupa por algo 'group by ...'*/
select SEXO_DO_AUTOR, count(*) 
from livros
group by SEXO_DO_AUTOR;

/* exercicio 1*/

select * from exercicio.funcionarios
WHERE(departamento = 'Roupas' or departamento = 'Filmes');

/* exercicio 2*/

select nome, sexo, email, departamento from exercicio.funcionarios
where((departamento = 'Lar' or departamento = 'Filmes') and sexo = 'Feminino');

/* exercicio 3*/

select * from exercicio.funcionarios
where(sexo = 'Masculino' or departamento = 'Jardim');

/*correçao exercicio 1*/
select count(*), departamento
from funcionarios
group by departamento
order by 1;

/*21 | Filmes*/
/*53 | Roupas*/

select * from funcionarios
where departamento = 'Roupas' or departamento = 'Filmes';

/*correçao exercicio 2*/

select count(*), sexo
from funcionarios
group by sexo;

/* mulheres e igual a 491 ocorrencias*/
/*trabalhos em lar e igual a 52 ocorrencias*/
/*trabalhos em filmes igual a 21 ocorrencias*/

select nome, sexo, email, departamento from funcionarios
where (departamento = 'Lar' and sexo = 'Feminino') or (departamento = 'Filmes' and sexo = 'Feminino');

/* 'is null' 'is not null'*/

select NOME, SEXO, EMAIL from projeto.cliente
where EMAIL is not null;

select NOME, SEXO, EMAIL from projeto.cliente
where EMAIL is null;

update cliente
set EMAIL = 'Maria1@gmail.com' 
where NOME = 'Maria' and EMAIL is null;

update cliente
set email = 'maria@gmail.com'
where email = '';

/* cuidado ao usar a clausula delete dicas
utilizar o count(*) e verificar quantas ocorrencias existem no banco de dados e depois verificar quantas
ocorrencias com o seu where de busca existem e apos isso exucutar o delete logo apos verificar se o numero de aruivos que deveria ser deletado
bate com oq foi deletado*/
select count(*) from Cliente;


delete from cliente
where nome = 'Maria' and email = 'Maria1@gmail.com';


