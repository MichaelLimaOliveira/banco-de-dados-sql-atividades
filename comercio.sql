create table CLIENTE(
    IDCLIENTE INT,
    NOME VARCHAR(30) NOT NULL
);

create table TELEFONE(
    IDTELEFONE int,
    TIPO enum('RES','CEL','COM') not null,
    NUMERO int not null,
    ID_CLIENTE int
);

/*Constraint */
ALTER table CLIENTE
add Constraint PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

alter table TELEFONE
add Constraint FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) references CLIENTE (IDCLIENTE);

select constraint_schema as 'BANCO',
       TABLE_NAME as 'TABELA',
       constraint_name as 'NOME DA REGRA',
       constraint_type as 'TIPO'
from TABLE_CONSTRAINTS
where CONSTRAINT_SCHEMA = 'COMERCIO';

+----------+----------+---------------------+-------------+
| BANCO    | TABELA   | NOME DA REGRA       | TIPO        |
+----------+----------+---------------------+-------------+
| comercio | cliente  | PRIMARY             | PRIMARY KEY |
| comercio | telefone | FK_CLIENTE_TELEFONE | FOREIGN KEY |
+----------+----------+---------------------+-------------+

/*apagando constraint regra*/

alter table telefone
drop foreign key FK_CLIENTE_TELEFONE;

alter table TELEFONE
add Constraint FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) references CLIENTE (IDCLIENTE);