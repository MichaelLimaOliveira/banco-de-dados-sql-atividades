CREATE database HOSPITAL;

use HOSPITAL;

CREATE TABLE MEDICOS(
    IDMEDICOS int PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) not null,
    SPEC VARCHAR(20) not null
);

create table PACIENTE(
    IDPACIENTE int PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) not null
);

create table CONSULTA(
    IDCONSULTA int PRIMARY KEY AUTO_INCREMENT,
    ID_PACIENTE int,
    ID_MEDICOS int
);

alter table CONSULTA
add Constraint FK_MEDICOS_CONSULTA
FOREIGN KEY(ID_MEDICOS) references MEDICOS(IDMEDICOS);

alter table CONSULTA
add Constraint FK_PACIENTE_CONSULTA
FOREIGN KEY(ID_PACIENTE) references PACIENTE(IDPACIENTE);

INSERT into MEDICOS value(null, 'Marcos', 'Clinico Geral');
INSERT into MEDICOS value(null, 'Beatriz', 'Ortopedista');
INSERT into MEDICOS value(null, 'Antonio', 'Cirurgião');
INSERT into MEDICOS value(null, 'Carlos', 'Anestesista');
INSERT into MEDICOS value(null, 'Paola', 'Enfermeira');
INSERT into MEDICOS value(null, 'Paula', 'Urologista');

INSERT Into PACIENTE value(null, 'Alexandre');
INSERT Into PACIENTE value(null, 'Xandão');
INSERT Into PACIENTE value(null, 'Augusto');
INSERT Into PACIENTE value(null, 'Caio');
INSERT Into PACIENTE value(null, 'Michael');
INSERT Into PACIENTE value(null, 'Luiza');
INSERT Into PACIENTE value(null, 'Estevão');
INSERT Into PACIENTE value(null, 'Jenifer');
INSERT Into PACIENTE value(null, 'Paulinho');
INSERT Into PACIENTE value(null, 'Rick');

INSERT Into CONSULTA value(null, 1, 1);
INSERT Into CONSULTA value(null, 1, 2);
INSERT Into CONSULTA value(null, 1, 6);
INSERT Into CONSULTA value(null, 2, 1);
INSERT Into CONSULTA value(null, 2, 3);
INSERT Into CONSULTA value(null, 2, 5);
INSERT Into CONSULTA value(null, 3, 6);
INSERT Into CONSULTA value(null, 3, 4);
INSERT Into CONSULTA value(null, 4, 6);
INSERT Into CONSULTA value(null, 5, 6);
INSERT Into CONSULTA value(null, 6, 2);
INSERT Into CONSULTA value(null, 7, 3);
INSERT Into CONSULTA value(null, 8, 1);
INSERT Into CONSULTA value(null, 10, 1);
INSERT Into CONSULTA value(null, 10, 4);
INSERT Into CONSULTA value(null, 10, 3);
INSERT Into CONSULTA value(null, 9, 5);

select m.nome as 'MEDICO',
       p.nome as 'Paciente',
       c.IDCONSULTA as 'NUMERO DA CONSULTA'
from MEDICOS m
join CONSULTA c 
on c.ID_MEDICOS = m.IDMEDICOS
join PACIENTE p 
on c.ID_PACIENTE = p.IDPACIENTE
order by 3;