/*
dados da data base para teste
*/
INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'joao@gmail.com', '15495875612');
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'M', 'carlos@gmail.com', '74682541268');
INSERT INTO CLIENTE VALUES(NULL, 'ANA', 'F', 'ana@gmail.com', '59246317895');
INSERT INTO CLIENTE VALUES(NULL, 'CLARA', 'F', 'clara@gmail.com', '54285241788');
INSERT INTO CLIENTE VALUES(NULL, 'JORGE', 'M', 'jorge@gmail.com', '74535614258974');
INSERT INTO CLIENTE VALUES(NULL, 'CELTA', 'M', 'celta@gmail.com', '58423674121');
INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');


INSERT INTO ENDERECO VALUES(NULL,'Rua Antonio Sa', 'Centro', 'Belo Horizonte', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);
INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','BELO HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','44522578',20);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','88687909',2);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','99655768',17);


/*atividades DML*/

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IdCliente | int           | NO   | PRI | NULL    | auto_increment |
| Nome      | varchar(30)   | NO   |     | NULL    |                |
| Sexo      | enum('M','F') | NO   |     | NULL    |                |
| Email     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IdEndereco | int         | NO   | PRI | NULL    | auto_increment |
| Rua        | varchar(50) | NO   |     | NULL    |                |
| Bairro     | varchar(30) | NO   |     | NULL    |                |
| Cidade     | varchar(30) | NO   |     | NULL    |                |
| Estado     | char(2)     | NO   |     | NULL    |                |
| Id_Cliente | int         | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

+------------+-------------------------------------------+------+-----+---------+----------------+
| Field      | Type                                      | Null | Key | Default | Extra          |
+------------+-------------------------------------------+------+-----+---------+----------------+
| IdTelefone | int                                       | NO   | PRI | NULL    | auto_increment |
| Tipo       | enum('RESIDENCIAL','COMERCIAL','CELULAR') | NO   |     | NULL    |                |
| Numero     | varchar(15)                               | NO   | UNI | NULL    |                |
| Id_Cliente | int                                       | YES  | MUL | NULL    |                |
+------------+-------------------------------------------+------+-----+---------+----------------+

/*Atividade 1 => Relatorio geral de todos os clientes */

SELECT C.idcliente, C.Nome, C.Sexo, C.Email, C.CPF,
       E.Rua, E.Bairro, E.Cidade, E.Estado,
       T.Tipo, T.Numero
FROM CLIENTE C 
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/*Relatorio dos homens*/

SELECT C.idcliente, C.Nome, C.Sexo, C.Email, C.CPF,
       E.Rua, E.Bairro, E.Cidade, E.Estado,
       T.Tipo, T.Numero
FROM CLIENTE C 
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.Sexo = 'M';

SELECT C.Nome, C.Sexo 
From CLIENTE C
WHERE C.IdCliente IN (12, 13, 18, 19);

UPDATE CLIENTE C
SET Sexo = 'F'
WHERE C.IdCliente IN (12, 13, 18, 19);


/*Relatorio das mulheres*/

SELECT C.idcliente, C.Nome, C.Sexo, C.Email, C.CPF,
       E.Rua, E.Bairro, E.Cidade, E.Estado,
       T.Tipo, T.Numero
FROM CLIENTE C 
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.Sexo = 'F';

SELECT C.Nome, C.Sexo 
From CLIENTE C
WHERE C.IdCliente IN (16);

UPDATE CLIENTE C
SET Sexo = 'M'
WHERE C.IdCliente IN (16);

+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+
| idcliente | Nome    | Sexo | Email             | CPF         | Rua                | Bairro     | Cidade         | Estado | Tipo        | Numero   |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+
|         3 | ANA     | F    | ana@gmail.com     | 59246317895 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CELULAR     | 78989765 |
|         3 | ANA     | F    | ana@gmail.com     | 59246317895 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CELULAR     | 99766676 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 55689654 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CELULAR     | 88668786 |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COMERCIAL   | 88687979 |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COMERCIAL   | 88965676 |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RESIDENCIAL | 89955665 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77455786 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RESIDENCIAL | 77755785 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COMERCIAL   | 44522578 |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+-------------+----------+

/*Quantidade de homens e mulheres*/

SELECT C.Sexo, COUNT(*) AS Quantidade 
FROM CLIENTE C
WHERE C.Sexo = 'F' OR C.Sexo = 'M'
GROUP BY C.Sexo;

+------+------------+
| Sexo | Quantidade |
+------+------------+
| M    |         10 |
| F    |         10 |
+------+------------+

/*Ids e emails das mulheres que moram no centro do rio de janeiro e nao tem celular*/

SELECT C.idcliente, C.Email, C.Nome, C.Sexo 
FROM CLIENTE C 
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+-----------+-------------------+---------+------+
| idcliente | Email             | Nome    | Sexo |
+-----------+-------------------+---------+------+
|         1 | joao@gmail.com    | JOAO    | M    |
|         1 | joao@gmail.com    | JOAO    | M    |
|         1 | joao@gmail.com    | JOAO    | M    |
|         2 | carlos@gmail.com  | CARLOS  | M    |
|         2 | carlos@gmail.com  | CARLOS  | M    |
|         3 | ana@gmail.com     | ANA     | F    |
|         3 | ana@gmail.com     | ANA     | F    |
|         5 | jorge@gmail.com   | JORGE   | M    |
|         5 | jorge@gmail.com   | JORGE   | M    |
|         5 | jorge@gmail.com   | JORGE   | M    |
|         9 | FLAVIO@IG.COM     | FLAVIO  | M    |
|         9 | FLAVIO@IG.COM     | FLAVIO  | M    |
|        11 | NULL              | GIOVANA | F    |
|        11 | NULL              | GIOVANA | F    |
|        11 | NULL              | GIOVANA | F    |
|        12 | KARLA@GMAIL.COM   | KARLA   | F    |
|        13 | DANIELE@GMAIL.COM | DANIELE | F    |
|        15 | NULL              | EDUARDO | M    |
|        16 | ANTONIO@IG.COM    | ANTONIO | M    |
|        17 | ANTONIO@UOL.COM   | ANTONIO | M    |
|        18 | ELAINE@GLOBO.COM  | ELAINE  | F    |
|        19 | CARMEM@IG.COM     | CARMEM  | F    |
|        19 | CARMEM@IG.COM     | CARMEM  | F    |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    |
+-----------+-------------------+---------+------+

SELECT C.idcliente, C.Email, C.Nome, C.Sexo 
FROM CLIENTE C 
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.Sexo = 'F';

+-----------+-------------------+---------+------+
| idcliente | Email             | Nome    | Sexo |
+-----------+-------------------+---------+------+
|         3 | ana@gmail.com     | ANA     | F    |
|         3 | ana@gmail.com     | ANA     | F    |
|        11 | NULL              | GIOVANA | F    |
|        11 | NULL              | GIOVANA | F    |
|        11 | NULL              | GIOVANA | F    |
|        12 | KARLA@GMAIL.COM   | KARLA   | F    |
|        13 | DANIELE@GMAIL.COM | DANIELE | F    |
|        18 | ELAINE@GLOBO.COM  | ELAINE  | F    |
|        19 | CARMEM@IG.COM     | CARMEM  | F    |
|        19 | CARMEM@IG.COM     | CARMEM  | F    |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    |
+-----------+-------------------+---------+------+

SELECT C.idcliente, C.Email, C.Nome, C.Sexo 
FROM CLIENTE C 
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.Sexo = 'F'
AND E.Bairro = 'CENTRO'
AND E.Cidade = 'RIO DE JANEIRO';

+-----------+-------------------+---------+------+
| idcliente | Email             | Nome    | Sexo |
+-----------+-------------------+---------+------+
|        11 | NULL              | GIOVANA | F    |
|        11 | NULL              | GIOVANA | F    |
|        11 | NULL              | GIOVANA | F    |
|        19 | CARMEM@IG.COM     | CARMEM  | F    |
|        19 | CARMEM@IG.COM     | CARMEM  | F    |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    |
+-----------+-------------------+---------+------+

SELECT C.idcliente, C.Email, C.Nome, C.Sexo, T.Tipo 
FROM CLIENTE C 
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.Sexo = 'F'
AND E.Bairro = 'CENTRO'
AND E.Cidade = 'RIO DE JANEIRO'
AND (T.Tipo = 'RESIDENCIAL' or T.Tipo = 'COMERCIAL');

/* EXERCICIO BONUS => PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT C.Nome, C.Email, T.Numero
FROM CLIENTE C 
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE E.ESTADO = 'RJ' AND T.Tipo = 'CELULAR';

+---------+------------------+----------+
| Nome    | Email            | Numero   |
+---------+------------------+----------+
| JOAO    | joao@gmail.com   | 87866896 |
| CARLOS  | carlos@gmail.com | 88687909 |
| GIOVANA | NULL             | 33567765 |
| GIOVANA | NULL             | 88668786 |
+---------+------------------+----------+

/*PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR*/


SELECT C.Nome, C.Email, T.Numero
FROM CLIENTE C 
JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE E.ESTADO = 'SP' AND T.Tipo = 'CELULAR' AND C.Sexo = 'F';


+------+---------------+----------+
| Nome | Email         | Numero   |
+------+---------------+----------+
| ANA  | ana@gmail.com | 78989765 |
| ANA  | ana@gmail.com | 99766676 |
+------+---------------+----------+

