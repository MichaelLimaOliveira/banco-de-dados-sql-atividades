CREATE DATABASE COMERCIO;

SHOW DATABASE;

USE COMERCIO;

CREATE TABLE CLIENTE(
    IdCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Sexo ENUM('M','F') NOT NULL,
    Email VARCHAR(50) UNIQUE,
    CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
    IdEndereco INT PRIMARY KEY AUTO_INCREMENT,
    Rua VARCHAR(50) NOT NULL,
    Bairros VARCHAR(30) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Estado CHAR(2) NOT NULL,
    Id_Cliente INT UNIQUE,
    FOREIGN KEY(Id_Cliente)
    REFERENCES CLIENTE(IdCliente)
);

CREATE TABLE TELEFONE(
    IdTelefone INT PRIMARY KEY AUTO_INCREMENT,
    Tipo ENUM('RESIDENCIAL', 'COMERCIAL', 'CELULAR') NOT NULL,
    Numero VARCHAR(15) NOT NULL,
    Id_Cliente INT,
    FOREIGN KEY(Id_Cliente)
    REFERENCES CLIENTE(IdCliente)
);


insert into CLIENTE values(null, 'JOAO', 'M', 'joao@gmail.com', '15495875612');
insert into CLIENTE values(null, 'CARLOS', 'M', 'carlos@gmail.com', '74682541268');
insert into CLIENTE values(null, 'ANA', 'F', 'ana@gmail.com', '59246317895');
insert into CLIENTE values(null, 'CLARA', 'F', 'clara@gmail.com', '54285241788');
insert into CLIENTE values(null, 'JORGE', 'M', 'jorge@gmail.com', '74535614258974');
insert into CLIENTE values(null, 'CELTA', 'M', 'celta@gmail.com', '58423674121');

/*

+-----------+--------+------+------------------+----------------+
| IdCliente | Nome   | Sexo | Email            | CPF            |
+-----------+--------+------+------------------+----------------+
|         1 | JOAO   | M    | joao@gmail.com   | 15495875612    |
|         2 | CARLOS | M    | carlos@gmail.com | 74682541268    |
|         3 | ANA    | F    | ana@gmail.com    | 59246317895    |
|         4 | CLARA  | F    | clara@gmail.com  | 54285241788    |
|         5 | JORGE  | M    | jorge@gmail.com  | 74535614258974 |
|         6 | CELTA  | M    | celta@gmail.com  | 58423674121    |
+-----------+--------+------+------------------+----------------+

*/

desc ENDERECO;

insert into ENDERECO values(null, 'Rua Antonio Sa', 'Centro', 'Belo Horizonte', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

/*

+------------+--------------------+----------+----------------+--------+------------+
| IdEndereco | Rua                | Bairros  | Cidade         | Estado | Id_Cliente |
+------------+--------------------+----------+----------------+--------+------------+
|          1 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          2 | RUA PRES VARGAS    | JARDINS  | SAO PAULO      | SP     |          3 |
|          3 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |          2 |
|          4 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |          6 |
|          5 | RUA URUGUAIANA     | CENTRO   | VITORIA        | ES     |          5 |
+------------+--------------------+----------+----------------+--------+------------+

*/

DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);


select *
from CLIENTE
inner join TELEFONE
on IdCliente = Id_Cliente; 


select * from CLIENTE
inner join TELEFONE 
on IdCliente = Id_Cliente
where IdCliente = 5;

select Nome, sexo, Bairros, cidade 
from CLIENTE
inner join ENDERECO
on IdCliente = Id_Cliente;

+--------+------+----------+----------------+
| Nome   | sexo | Bairros  | cidade         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| CELTA  | M    | FLAMENGO | RIO DE JANEIRO |
| JORGE  | M    | CENTRO   | VITORIA        |
+--------+------+----------+----------------+

select Nome, sexo, Bairros, cidade 
from CLIENTE
inner join ENDERECO
on IdCliente = Id_Cliente
where sexo = 'F';

+------+------+---------+-----------+
| Nome | sexo | Bairros | cidade    |
+------+------+---------+-----------+
| ANA  | F    | JARDINS | SAO PAULO |
+------+------+---------+-----------+

/*nome sexo email tipo numero*/

select nome, email, tipo, numero
from CLIENTE
    inner join TELEFONE
    on IdCliente = Id_Cliente;

+--------+------------------+-------------+----------+
| nome   | email            | tipo        | numero   |
+--------+------------------+-------------+----------+
| JORGE  | jorge@gmail.com  | CELULAR     | 78458743 |
| JORGE  | jorge@gmail.com  | RESIDENCIAL | 56576876 |
| JOAO   | joao@gmail.com   | CELULAR     | 87866896 |
| CARLOS | carlos@gmail.com | COMERCIAL   | 54768899 |
| JOAO   | joao@gmail.com   | RESIDENCIAL | 99667587 |
| ANA    | ana@gmail.com    | CELULAR     | 78989765 |
| ANA    | ana@gmail.com    | CELULAR     | 99766676 |
| JOAO   | joao@gmail.com   | COMERCIAL   | 66687899 |
| JORGE  | jorge@gmail.com  | RESIDENCIAL | 89986668 |
| CARLOS | carlos@gmail.com | CELULAR     | 88687909 |
+--------+------------------+-------------+----------+

/*nome sexo bairros cidade tipo numero*/
select cliente.nome, cliente.sexo, endereco.bairros, endereco.cidade, TELEFONE.tipo, telefone.numero
from CLIENTE
inner join ENDERECO
on CLIENTE.IdCliente = ENDERECO.Id_Cliente
inner join TELEFONE
on CLIENTE.IdCliente = TELEFONE.Id_Cliente;

+--------+------+---------+----------------+-------------+----------+
| nome   | sexo | bairros | cidade         | tipo        | numero   |
+--------+------+---------+----------------+-------------+----------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CELULAR     | 87866896 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RESIDENCIAL | 99667587 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COMERCIAL   | 66687899 |
| ANA    | F    | JARDINS | SAO PAULO      | CELULAR     | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CELULAR     | 99766676 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COMERCIAL   | 54768899 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CELULAR     | 88687909 |
| JORGE  | M    | CENTRO  | VITORIA        | CELULAR     | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 56576876 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 89986668 |
+--------+------+---------+----------------+-------------+----------+

select *
from CLIENTE
inner join ENDERECO
on CLIENTE.IdCliente = ENDERECO.Id_Cliente
inner join TELEFONE
on CLIENTE.IdCliente = TELEFONE.Id_Cliente;


select c.nome, c.sexo, e.bairros, e.cidade, t.tipo, t.numero
from CLIENTE c
inner join ENDERECO e
on c.IdCliente = e.Id_Cliente
inner join TELEFONE t
on c.IdCliente = t.Id_Cliente;

+--------+------+---------+----------------+-------------+----------+
| nome   | sexo | bairros | cidade         | tipo        | numero   |
+--------+------+---------+----------------+-------------+----------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CELULAR     | 87866896 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RESIDENCIAL | 99667587 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COMERCIAL   | 66687899 |
| ANA    | F    | JARDINS | SAO PAULO      | CELULAR     | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CELULAR     | 99766676 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COMERCIAL   | 54768899 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CELULAR     | 88687909 |
| JORGE  | M    | CENTRO  | VITORIA        | CELULAR     | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 56576876 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 89986668 |
+--------+------+---------+----------------+-------------+----------+

/* DML => data manipulation language*/

insert into cliente values(null, 'Paula', 'M', Null, '77457493');

insert into endereco values(null, 'Rua Joaquin Silva', 'Alvorada', 'Niteroi', 'RJ', 7);

update endereco 
set rua = 'RUA JOAQUIN SILVA', bairros = 'ALVORADA', cidade = 'NITEROI'
where IdEndereco = 6;

select * from cliente c
join endereco e
on c.idcliente = e.id_cliente;

insert into cliente values(null, 'xxxx', 'M', Null, 'xxxxxxxxxxx');

select * from cliente;

select * from cliente 
where idcliente = 8;

delete from cliente 
where idcliente = 8;

/*DDL => data definition language */

/*change e bem mais seguro para mudar nome dos campos*/
alter table endereco 
CHANGE Bairro Bairro VARCHAR(30) not null;

/*modify e bem maais seguro para mudar os tipos dos campos*/

alter table cliente 
modify cpf int(11) not null;

/*adicionando coluna*/
alter table endereco 
add numero_da_casa VARCHAR(10) not null;

/*apagando coluna*/
ALTER TABLE ENDERECO
DROP COLUMN numero_da_casa;

/* acdicionando a coluna na orderm especifica*/
alter table endereco
add numero_da_casa VARCHAR(10) not null
after rua;

alter table endereco
add numero_da_casa VARCHAR(10) not null
first;

/*nome email endereco telefone*/

select c.nome,
       c.email,
       e.estado,
       t.numero
from cliente c
join endereco e 
on c.idcliente = e.id_cliente
join telefone t
on c.idcliente = t.id_cliente;

+---------+-------------------+--------+----------+
| nome    | email             | estado | numero   |
+---------+-------------------+--------+----------+
| JORGE   | jorge@gmail.com   | ES     | 78458743 |
| JORGE   | jorge@gmail.com   | ES     | 56576876 |
| JOAO    | joao@gmail.com    | RJ     | 87866896 |
| CARLOS  | carlos@gmail.com  | RJ     | 54768899 |
| JOAO    | joao@gmail.com    | RJ     | 99667587 |
| ANA     | ana@gmail.com     | SP     | 78989765 |
| ANA     | ana@gmail.com     | SP     | 99766676 |
| JOAO    | joao@gmail.com    | RJ     | 66687899 |
| JORGE   | jorge@gmail.com   | ES     | 89986668 |
| CARLOS  | carlos@gmail.com  | RJ     | 88687909 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 68976565 |
| GIOVANA | NULL              | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM | ES     | 88965676 |
| ANTONIO | ANTONIO@IG.COM    | SP     | 88679978 |
| ELAINE  | ELAINE@GLOBO.COM  | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 44522578 |
| GIOVANA | NULL              | RJ     | 33567765 |
| GIOVANA | NULL              | RJ     | 88668786 |
| EDUARDO | NULL              | PR     | 89966809 |
| ANTONIO | ANTONIO@UOL.COM   | PR     | 99655768 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 99656675 |
+---------+-------------------+--------+----------+

select c.nome as "Name",
       ifnull(c.email, "E-mail não cadastrado !!!") as "E-mail",
       e.estado as "Estate",
       t.numero as "Phone Number"
from cliente c
join endereco e 
on c.idcliente = e.id_cliente
join telefone t
on c.idcliente = t.id_cliente;

+---------+----------------------------+--------+--------------+
| Name    | E-mail                     | Estate | Phone Number |
+---------+----------------------------+--------+--------------+
| JORGE   | jorge@gmail.com            | ES     | 78458743     |
| JORGE   | jorge@gmail.com            | ES     | 56576876     |
| JOAO    | joao@gmail.com             | RJ     | 87866896     |
| CARLOS  | carlos@gmail.com           | RJ     | 54768899     |
| JOAO    | joao@gmail.com             | RJ     | 99667587     |
| ANA     | ana@gmail.com              | SP     | 78989765     |
| ANA     | ana@gmail.com              | SP     | 99766676     |
| JOAO    | joao@gmail.com             | RJ     | 66687899     |
| JORGE   | jorge@gmail.com            | ES     | 89986668     |
| CARLOS  | carlos@gmail.com           | RJ     | 88687909     |
| FLAVIO  | FLAVIO@IG.COM              | MG     | 68976565     |
| GIOVANA | E-mail não cadastrado !!!  | RJ     | 55689654     |
| KARLA   | KARLA@GMAIL.COM            | RJ     | 88687979     |
| DANIELE | DANIELE@GMAIL.COM          | ES     | 88965676     |
| ANTONIO | ANTONIO@IG.COM             | SP     | 88679978     |
| ELAINE  | ELAINE@GLOBO.COM           | SP     | 89955665     |
| CARMEM  | CARMEM@IG.COM              | RJ     | 77455786     |
| CARMEM  | CARMEM@IG.COM              | RJ     | 89766554     |
| ADRIANA | ADRIANA@GMAIL.COM          | RJ     | 77755785     |
| ADRIANA | ADRIANA@GMAIL.COM          | RJ     | 44522578     |
| GIOVANA | E-mail não cadastrado !!!  | RJ     | 33567765     |
| GIOVANA | E-mail não cadastrado !!!  | RJ     | 88668786     |
| EDUARDO | E-mail não cadastrado !!!  | PR     | 89966809     |
| ANTONIO | ANTONIO@UOL.COM            | PR     | 99655768     |
| FLAVIO  | FLAVIO@IG.COM              | MG     | 99656675     |
+---------+----------------------------+--------+--------------+

select c.nome,
       c.sexo,
       ifnull(c.email,'E-mail não cadastrado') as "email",
       t.tipo,
       t.numero,
       e.bairro,
       e.cidade,
       e.estado
from cliente c
join telefone t
on c.idcliente = t.id_cliente
join endereco e
on c.idcliente = e.id_cliente;

CREATE VIEW V_Relatorio as 
select c.nome,
       c.sexo,
       ifnull(c.email,'E-mail não cadastrado') as "email",
       t.tipo,
       t.numero,
       e.bairro,
       e.cidade,
       e.estado,
       e.id_cliente,
       t.id_cliente
from cliente c
right join telefone t
on c.idcliente = t.id_cliente
join endereco e
on c.idcliente = e.id_cliente;

select r.nome, r.sexo, r.email, r.tipo, r.numero, r.bairro, r.cidade, r.estado from V_Relatorio r;

+---------+------+------------------------+-------------+----------+------------+----------------+--------+
| nome    | sexo | email                  | tipo        | numero   | bairro     | cidade         | estado |
+---------+------+------------------------+-------------+----------+------------+----------------+--------+
| JORGE   | M    | jorge@gmail.com        | CELULAR     | 78458743 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | jorge@gmail.com        | RESIDENCIAL | 56576876 | CENTRO     | VITORIA        | ES     |
| JOAO    | M    | joao@gmail.com         | CELULAR     | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | carlos@gmail.com       | COMERCIAL   | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOAO    | M    | joao@gmail.com         | RESIDENCIAL | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ana@gmail.com          | CELULAR     | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ana@gmail.com          | CELULAR     | 99766676 | JARDINS    | SAO PAULO      | SP     |
| JOAO    | M    | joao@gmail.com         | COMERCIAL   | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | jorge@gmail.com        | RESIDENCIAL | 89986668 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | carlos@gmail.com       | CELULAR     | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM          | RESIDENCIAL | 68976565 | CASCADURA  | BELO HORIZONTE | MG     |
| GIOVANA | F    | E-mail não cadastrado  | COMERCIAL   | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM        | COMERCIAL   | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM      | COMERCIAL   | 88965676 | CENTRO     | VITORIA        | ES     |
| ANTONIO | M    | ANTONIO@IG.COM         | COMERCIAL   | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ELAINE  | F    | ELAINE@GLOBO.COM       | RESIDENCIAL | 89955665 | LAPA       | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM          | RESIDENCIAL | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM          | RESIDENCIAL | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM      | RESIDENCIAL | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM      | COMERCIAL   | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | E-mail não cadastrado  | CELULAR     | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | E-mail não cadastrado  | CELULAR     | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| EDUARDO | M    | E-mail não cadastrado  | CELULAR     | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@UOL.COM        | CELULAR     | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| FLAVIO  | M    | FLAVIO@IG.COM          | CELULAR     | 99656675 | CASCADURA  | BELO HORIZONTE | MG     |
+---------+------+------------------------+-------------+----------+------------+----------------+--------+

/*view dml*/

CREATE table jogadores(
    id int PRIMARY key AUTO_INCREMENT,
    nome VARCHAR(30) not null,
    estado char(2) not null
);


INSERT INTO JOGADORES VALUES(1,'GUERRERO','RS');
INSERT INTO JOGADORES VALUES(2,'GABIGOL','RJ');
INSERT INTO JOGADORES VALUES(3,'GANSO','RJ');
INSERT INTO JOGADORES VALUES(4,'NENÊ', 'RJ');
INSERT INTO JOGADORES VALUES(5,'LOVE','SP');

create view v_jogadores as
select nome, estado from jogadores;

delete from v_jogadores
where nome = 'GUERRERO';

select nome, estado from v_jogadores;

update v_jogadores
set nome = 'lolove'
where nome = 'love';

insert into v_jogadores values('GUERRERO','RS');

create view V_deleta as 
delete from cliente
where idcliente = 21;

/*order by view*/

create table alunos(
    numero int,
    nome varchar(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE');

select * from alunos
order by numero;

+--------+---------+
| numero | nome    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANI |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

select * from alunos
order by 1;

+--------+---------+
| numero | nome    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANI |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

select * from alunos
order by 2;

+--------+---------+
| numero | nome    |
+--------+---------+
|      6 | ANA     |
|      2 | ANDRE   |
|      5 | ANTONIO |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | GIOVANI |
|      5 | JANAINA |
|      1 | JANAINA |
|      1 | JOAO    |
|      4 | MAFRA   |
|      3 | MARCELO |
|      1 | MARIA   |
|      6 | VIVIANE |
|      2 | ZOE     |
+--------+---------+

/* Ordenando por mais de uma coluna */

select * from alunos
order by numero, nome;

select * from alunos
order by 1, 2;

+--------+---------+
| numero | nome    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GIOVANI |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

/*Mesclando order by com projecao*/

select * from alunos
order by 1, 2;

select nome from alunos
order by 1, 2;

select nome from alunos
order by numero, nome;

+---------+
| nome    |
+---------+
| CLARA   |
| JANAINA |
| JOAO    |
| MARIA   |
| ANDRE   |
| ZOE     |
| CLARA   |
| MARCELO |
| GIOVANI |
| MAFRA   |
| ANTONIO |
| JANAINA |
| ANA     |
| VIVIANE |
+---------+

/*order by desc / asc */

select * from alunos
order by 1 asc;

select * from alunos
order by 1 desc;

+--------+---------+
| numero | nome    |
+--------+---------+
|      6 | ANA     |
|      6 | VIVIANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      4 | MAFRA   |
|      4 | GIOVANI |
|      3 | CLARA   |
|      3 | MARCELO |
|      2 | ZOE     |
|      2 | ANDRE   |
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
+--------+---------+

select * from alunos 
order by 1 desc, 2 desc;

+--------+---------+
| numero | nome    |
+--------+---------+
|      6 | VIVIANE |
|      6 | ANA     |
|      5 | JANAINA |
|      5 | ANTONIO |
|      4 | MAFRA   |
|      4 | GIOVANI |
|      3 | MARCELO |
|      3 | CLARA   |
|      2 | ZOE     |
|      2 | ANDRE   |
|      1 | MARIA   |
|      1 | JOAO    |
|      1 | JANAINA |
|      1 | CLARA   |
+--------+---------+ 

select c.nome,
        c.sexo,
        ifnull(c.email, 'cliente sem email') as 'e-mail',
        t.tipo,
        t.numero,
        e.bairro,
        e.cidade,
        e.estado
from cliente c 
inner join telefone t 
on c.idcliente = t.id_cliente
inner join endereco e 
on c.idcliente = e.id_cliente
order by 1;

+---------+------+-------------------+-------------+----------+------------+----------------+--------+
| nome    | sexo | e-mail            | tipo        | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+-------------+----------+------------+----------------+--------+
| ADRIANA | F    | ADRIANA@GMAIL.COM | RESIDENCIAL | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | COMERCIAL   | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ana@gmail.com     | CELULAR     | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ana@gmail.com     | CELULAR     | 99766676 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@IG.COM    | COMERCIAL   | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | CELULAR     | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| CARLOS  | M    | carlos@gmail.com  | COMERCIAL   | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | carlos@gmail.com  | CELULAR     | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RESIDENCIAL | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RESIDENCIAL | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COMERCIAL   | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | cliente sem email | CELULAR     | 89966809 | CENTRO     | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | RESIDENCIAL | 89955665 | LAPA       | SAO PAULO      | SP     |
| FLAVIO  | M    | FLAVIO@IG.COM     | RESIDENCIAL | 68976565 | CASCADURA  | BELO HORIZONTE | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CELULAR     | 99656675 | CASCADURA  | BELO HORIZONTE | MG     |
| GIOVANA | F    | cliente sem email | COMERCIAL   | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | cliente sem email | CELULAR     | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | cliente sem email | CELULAR     | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | joao@gmail.com    | CELULAR     | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | joao@gmail.com    | RESIDENCIAL | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | joao@gmail.com    | COMERCIAL   | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | jorge@gmail.com   | CELULAR     | 78458743 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | jorge@gmail.com   | RESIDENCIAL | 56576876 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | jorge@gmail.com   | RESIDENCIAL | 89986668 | CENTRO     | VITORIA        | ES     |
| KARLA   | F    | KARLA@GMAIL.COM   | COMERCIAL   | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+-------------+----------+------------+----------------+--------+

select * from V_Relatorio
order by 1;

+---------+------+------------------------+-------------+----------+------------+----------------+--------+
| nome    | sexo | email                  | tipo        | numero   | bairro     | cidade         | estado |
+---------+------+------------------------+-------------+----------+------------+----------------+--------+
| ADRIANA | F    | ADRIANA@GMAIL.COM      | RESIDENCIAL | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM      | COMERCIAL   | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ana@gmail.com          | CELULAR     | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ana@gmail.com          | CELULAR     | 99766676 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@IG.COM         | COMERCIAL   | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM        | CELULAR     | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| CARLOS  | M    | carlos@gmail.com       | COMERCIAL   | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | carlos@gmail.com       | CELULAR     | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM          | RESIDENCIAL | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM          | RESIDENCIAL | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM      | COMERCIAL   | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | E-mail não cadastrado  | CELULAR     | 89966809 | CENTRO     | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM       | RESIDENCIAL | 89955665 | LAPA       | SAO PAULO      | SP     |
| FLAVIO  | M    | FLAVIO@IG.COM          | RESIDENCIAL | 68976565 | CASCADURA  | BELO HORIZONTE | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM          | CELULAR     | 99656675 | CASCADURA  | BELO HORIZONTE | MG     |
| GIOVANA | F    | E-mail não cadastrado  | COMERCIAL   | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | E-mail não cadastrado  | CELULAR     | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | E-mail não cadastrado  | CELULAR     | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | joao@gmail.com         | CELULAR     | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | joao@gmail.com         | RESIDENCIAL | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | joao@gmail.com         | COMERCIAL   | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | jorge@gmail.com        | CELULAR     | 78458743 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | jorge@gmail.com        | RESIDENCIAL | 56576876 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | jorge@gmail.com        | RESIDENCIAL | 89986668 | CENTRO     | VITORIA        | ES     |
| KARLA   | F    | KARLA@GMAIL.COM        | COMERCIAL   | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
+---------+------+------------------------+-------------+----------+------------+----------------+--------+

status

/*stored procedures*/
select 'Michael';

delimiter $
create procedure nome()
BEGIN

END
$

create procedure nome_empresa()
BEGIN
    select 'UNIVERSIDADE DOS DADOS' as 'Empresa';
END
$

call nome_empresa()$

delimiter $
create procedure conta(numero1 int, numero2 int) 
begin 
    select numero1 + numero2 as conta;
END
$

