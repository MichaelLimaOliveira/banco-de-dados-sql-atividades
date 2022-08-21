CREATE TABLE vendedores(
    idvendedor int PRIMARY key AUTO_INCREMENT,
    nome VARCHAR(30) not null,
    sexo enum('F','M') not null,
    janeiro FLOAT(10,2) not null,
    fevereiro FLOAT(10,2) not null,
    marco FLOAT(10,2) not null
);

INSERT INTO vendedores VALUE(null, 'Carlos','M',312312.23,231223.23,123234.12);
INSERT INTO vendedores VALUE(null, 'Antonio','M',486423.32,321312.12,4456546.45);
INSERT INTO vendedores VALUE(null, 'Eduardo','M',542165.67,444656.43,787884.12);
INSERT INTO vendedores VALUE(null, 'Maria','F',541235.51,231223.23,848956.12);
INSERT INTO vendedores VALUE(null, 'Alexandre','M',45613216.23,4564654.23,564545.12);
INSERT INTO vendedores VALUE(null, 'Adriana','F',1561561.22,2325364.23,56455.12);
INSERT INTO vendedores VALUE(null, 'Efigenia','F',54651232.64,4354332.23,548915.12);
INSERT INTO vendedores VALUE(null, 'Paula','F',4564516.51,16443445.23,878945.32);
INSERT INTO vendedores VALUE(null, 'Luiza','F', 6156165.13,5456114.23,8456156.45);
INSERT INTO vendedores VALUE(null, 'Jenifer','F',81625453.27,13551233.23,1561321.12);
INSERT INTO vendedores VALUE(null, 'Augusto','M',16165156.63,23123254.23,5641231.12);
INSERT INTO vendedores VALUE(null, 'Pedro','M',545426.53,2234523.23,5942354.12);

/*Menor valor de cada mes*/

SELECT min(v.janeiro) as min_jan,
       min(v.fevereiro) as min_fev,
       min(v.marco) as min_mar
from vendedores v;

+-----------+-----------+----------+
| min_jan   | min_fev   | min_mar  |
+-----------+-----------+----------+
| 312312.22 | 231223.23 | 56455.12 |
+-----------+-----------+----------+

/*maior valor de cada mes*/

SELECT max(v.janeiro) as max_jan,
       max(v.fevereiro) as max_fev,
       max(v.marco) as max_mar
from vendedores v;

+-------------+-------------+------------+
| max_jan     | max_fev     | max_mar    |
+-------------+-------------+------------+
| 81625456.00 | 23123254.00 | 8456156.00 |
+-------------+-------------+------------+

/*o valor medio de cada mes*/

SELECT avg(v.janeiro) as avg_jan,
       avg(v.fevereiro) as avg_fev,
       avg(v.marco) as avg_mar
from vendedores v;

+-----------------+----------------+----------------+
| avg_jan         | avg_fev        | avg_mar        |
+-----------------+----------------+----------------+
| 19292972.843750 | 6621516.190341 | 2643514.504616 |
+-----------------+----------------+----------------+

/*varias funcoes juntas*/

select min(v.janeiro) as min_jan,
       max(v.janeiro) as max_jan,
       avg(v.janeiro) as avg_jan,
       min(v.fevereiro) as min_fev,
       max(v.fevereiro) as max_fev,
       avg(v.fevereiro) as avg_fev,
       min(v.marco) as min_mar,
       max(v.marco) as max_mar,
       avg(v.marco) as avg_mar
from vendedores v;

+-----------+-------------+-----------------+-----------+-------------+----------------+----------+------------+----------------+
| min_jan   | max_jan     | avg_jan         | min_fev   | max_fev     | avg_fev        | min_mar  | max_mar    | avg_mar        |
+-----------+-------------+-----------------+-----------+-------------+----------------+----------+------------+----------------+
| 312312.22 | 81625456.00 | 19292972.843750 | 231223.23 | 23123254.00 | 6621516.190341 | 56455.12 | 8456156.00 | 2643514.504616 |
+-----------+-------------+-----------------+-----------+-------------+----------------+----------+------------+----------------+

/*truncate dados */

select min(v.janeiro) as min_jan,
       max(v.janeiro) as max_jan,
       truncate(avg(v.janeiro),2 ) as avg_jan,
       min(v.fevereiro) as min_fev,
       max(v.fevereiro) as max_fev,
       truncate(avg(v.fevereiro),2 ) as avg_fev,
       min(v.marco) as min_mar,
       max(v.marco) as max_mar,
       truncate(avg(v.marco),2 )as avg_mar
from vendedores v;

+-----------+-------------+-------------+-----------+-------------+------------+----------+------------+-----------+
| min_jan   | max_jan     | avg_jan     | min_fev   | max_fev     | avg_fev    | min_mar  | max_mar    | avg_mar   |
+-----------+-------------+-------------+-----------+-------------+------------+----------+------------+-----------+
| 312312.22 | 81625456.00 | 19292972.84 | 231223.23 | 23123254.00 | 6621516.19 | 56455.12 | 8456156.00 | 2643514.5 |
+-----------+-------------+-------------+-----------+-------------+------------+----------+------------+-----------+

/*Agregando com sum*/

select sum(v.janeiro) as total_jan,
       sum(v.fevereiro) as total_fev,
       sum(v.marco) as total_mar
from vendedores v;

+--------------+-------------+-------------+
| total_jan    | total_fev   | total_mar   |
+--------------+-------------+-------------+
| 212222701.28 | 72836678.09 | 29078659.55 |
+--------------+-------------+-------------+

/*agregando por sexo*/

select v.sexo, sum(v.janeiro) as total_jan
from vendedores v 
group by sexo;

+------+--------------+
| sexo | total_jan    |
+------+--------------+
| M    |  63122535.03 |
| F    | 149100166.25 |
+------+--------------+

select min(v.marco) as menor_mar, v.nome from vendedores v
where v.marco in (
    select min(v.marco) from vendedores v
);

select v.nome, v.marco from vendedores v 
where v.marco = (select min(v.marco) from vendedores v);

+-----------+---------+
| menor_mar | nome    |
+-----------+---------+
|  56455.12 | Adriana |
+-----------+---------+

select max(v.marco) as maior_mar, v.nome from vendedores v
where v.marco in (
    select max(v.marco) from vendedores v
);

select v.nome, v.marco from vendedores v 
where v.marco = (select max(v.marco) from vendedores v);

+------------+-------+
| maior_mar  | nome  |
+------------+-------+
| 8456156.00 | Luiza |
+------------+-------+

select avg(v.fevereiro) as media_fev from vendedores v;

+----------------+
| media_fev      |
+----------------+
| 6621516.190341 |
+----------------+

select v.fevereiro, v.nome 
from vendedores v 
where v.fevereiro <= (select avg(v.fevereiro) from vendedores v);

+-------------+---------+
| fevereiro   | nome    |
+-------------+---------+
| 16443445.00 | Paula   |
| 13551233.00 | Jenifer |
| 23123254.00 | Augusto |
+-------------+---------+

/*somando as linhas das colunas*/

select v.nome,
       v.sexo,
       v.janeiro,
       v.fevereiro,
       v.marco, 
       (v.janeiro + v.fevereiro + v.marco) as total_trimestre,
       truncate(v.janeiro + v.fevereiro + v.marco / 3, 2) as media_trimestral
from vendedores v;