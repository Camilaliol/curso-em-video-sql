1. Faça uma lista com o nome de todas as gafanhotas.

select nome from gafanhotos
where sexo = 'F';

+------------------------+
| nome                   |
+------------------------+
| Talita Nascimento      |
| Leila Martins          |
| Letícia Neves          |
| Janaína Couto          |
| Andreia Delfino        |
| Rosana Kunz            |
| Josiane Dutra          |
| Nara Matos             |
| Ana Carolina Mendes    |
| Monique Precivalli     |
| Karine Ribeiro         |
| Jarismar Andrade       |
| Janaina Oliveira       |
| Daniele Moledo         |
| Ana Carolina Hernandes |
| Bruna Teles            |
| Elaine Nunes           |
| Jucinei Teixeira       |
| Bruna Santos           |
| Rita Pontes            |
| Dayana Dias            |
| Silvana Albuquerque    |
+------------------------+


2. crie um lista com dados de todos aqueles que nasceram entre 01/01/2000 a 31/12/2015.

select * from gafanhotos 
where nascimento between '2000-01-01' and '2015-12-31';
+----+---------------------------+----------------------+------------+------+--------+--------+---------------+
| id | nome                      | profissao            | nascimento | sexo | peso   | altura | nacionalidade |
+----+---------------------------+----------------------+------------+------+--------+--------+---------------+
|  8 | Carlisson Rosa            | Professor            | 2010-08-01 | M    |  78.22 |   1.98 | Brasil        |
| 16 | Elvis Schwarz             | Dentista             | 2011-05-07 | M    |  66.69 |   1.76 | EUA           |
| 20 | Marcos Dissotti           | Empreendedor         | 2010-01-01 | M    |  53.79 |   1.54 | Portugal      |
| 21 | Ana Carolina Mendes       | Ator                 | 2000-12-15 | F    |  88.30 |   1.54 | Brasil        |
| 22 | Guilherme de Sousa        | Dentista             | 2001-05-18 | M    | 132.70 |   1.97 | Moçambique    |
| 23 | Bruno Torres              | Auxiliar Administrat | 2000-01-30 | M    |  44.65 |   1.65 | Brasil        |
| 27 | Monique Precivalli        | Auxiliar Administrat | 2013-12-30 | F    |  48.20 |   1.22 | Brasil        |
| 32 | Roberto Luiz Debarba      | Ator                 | 2007-01-09 | M    |  77.44 |   1.56 | Brasil        |
| 33 | Jarismar Andrade          | Dentista             | 2000-06-23 | F    |  63.70 |   1.33 | Brasil        |
| 35 | Márcio Mello              | Programador          | 2011-11-20 | M    |  54.11 |   1.55 | EUA           |
| 36 | Robson Rodolpho           | Auxiliar Administrat | 2000-08-08 | M    | 110.10 |   1.76 | Brasil        |
| 37 | Daniele Moledo            | Empreendedor         | 2006-08-11 | F    | 101.30 |   1.99 | Brasil        |
| 39 | Neriton Dias              | Auxiliar Administrat | 2009-10-30 | M    |  48.99 |   1.29 | Brasil        |
| 41 | Isaias Buscarino          | Dentista             | 2001-01-07 | M    |  99.90 |   1.55 | Moçambique    |
| 46 | Diogo Padilha             | Auxiliar Administrat | 2000-03-03 | M    |  54.34 |   1.88 | Angola        |
| 49 | Silvio Ricardo            | Programador          | 2012-03-12 | M    |  65.99 |   1.23 | EUA           |
| 50 | Denilson Barbosa da Silva | Empreendedor         | 2000-01-08 | M    |  97.30 |   2.00 | Brasil        |
| 58 | Carlos Camargo            | Programador          | 2005-02-22 | M    | 124.65 |   1.33 | Brasil        |
| 59 | Philppe Oliveira          | Auxiliar Administrat | 2000-05-23 | M    | 105.10 |   2.19 | Brasil        |
+----+---------------------------+----------------------+------------+------+--------+--------+---------------+
19 rows in set (0,001 sec)


3. Fça uma lista com o nome de todos os homens que trabalham como programadores.

select nome,profissao from gafanhotos
where sexo = 'm' and profissao = 'computacao';

nao existe

select nome,profissao from gafanhotos
where sexo = 'm' and profissao = 'progamador'
+-----------------+-------------+
| nome            | profissao   |
+-----------------+-------------+
| Emerson Gabriel | Programador |
| Jackson Telles  | Programador |
| Allan Silva     | Programador |
| Raian Porto     | Programador |
| Anderson Rafael | Programador |
| Márcio Mello    | Programador |
| André Schmidt   | Programador |
| Silvio Ricardo  | Programador |
| Andre Santini   | Programador |
| Ruan Valente    | Programador |
| Carlos Camargo  | Programador |
+-----------------+-------------+
11 rows in set (0,001 sec)




4. Faça uma lista com todas as mulheres que nasceram no brassil e que tem seu nome iniciado com a letra j.

select nome,nacionalidade from gafanhotos
where nome like 'j%' and sexo = 'f' and nacionalidade = 'Brasil'
+------------------+---------------+
| nome             | nacionalidade |
+------------------+---------------+
| Jarismar Andrade | Brasil        |
+------------------+---------------+



5. faça uma lista com o nome e nascionalidade de todos os homens que tem Silva no nome e nao nasceram no Brasil e pesam menos de 100kg

select nome,peso, nacionalidade from gafanhotos
where nome like '%Silva%' and sexo = 'm' and nacionalidade <> 'brasil' and peso >100;


6. Qual ºe a maior autura entre os gafanhotos homens que moram no brasil?

7. qual a media de peso dos gafanhotos cadastrados?

8.Qual é o menor peso entre as gafanhotas mulheres que nasceram forra do brasil entre 01/01/1990 e 31/12/2000?

9. Quantas gafanhotas mulheres tem mais de 1.90m de autura ?

select nome, peso from gafanhotos
where nacionalidade <> 'brasil' and sexo = 'M' and peso >100;
