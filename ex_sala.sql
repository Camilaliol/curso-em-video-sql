cd c:\xampp\mysql\bin      necessário para abrir o terminal
 
c:\xampp\mysql\bin>mysql -u root -p





SELECT E.ENCOMENFAID,E.ENCOMENDADATA,C.CLIENTEID,C.CLIENTENOME,C.CLIENTE_NIF
P.PRODUTOID,P.PRODUTOTIPO,P.PRODUTOPRECO FROM CLIENTE AS CADASTRJOINENCOMENDA AS E 
ON C.CLIENTEID = E.ENCOMENDACLIENTEID
JOIN PRODUTO AS P
ON E.EMCOMENDAPRODUTOID = P.PRODUTOID

-- EXERCICOS EM SALA 

Total dos vencimentos dos vendedores com comissões entre 0.13 e 0.15;

2.CREATE VIEW V_TOTAL AS
select sum(vencimento) as total_vencimento
from tab_vendedor
where comissao between 0.13 and 0.15;

+------------------+
| total_vencimento |
+------------------+
|             9000 |
+------------------+



2.1. CREATE VIEW V_VENC_COMISSAO AS
select sum((vencimento * comissao) + vencimento) as total_vencimento
from tab_vendedor
where comissao between 0.13 and 0.15;

+------------------+
| total_vencimento |
+------------------+
|         10234.00 |
+------------------+

SELECT * FROM V_VENC_COMISSAO;


b. Vendedores cuja cidade é “Porto”, ordenados por ordem descendente de nome; 

CREATE VIEW V_VENDEDOR_CIT AS
SELECT V.NOME, C.NOME_CIDADE
    FROM tab_vendedor V
    INNER JOIN TAB_CIDADE C
    ON C.NOME_CIDADE = 'PORTO'
    ORDER BY V.NOME DESC;

    SELECT * FROM V_VENDEDOR_CIT;

+---------------+-------------+
| NOME          | NOME_CIDADE |
+---------------+-------------+
| Pedro Santos  | Porto       |
| Mário Sousa   | Porto       |
| Maria Silva   | Porto       |
| José Castro   | Porto       |
| João Sousa    | Porto       |
| Carlos santos | Porto       |
| Carla Costa   | Porto       |
| Andreia Silva | Porto       |
+---------------+-------------+

C.  A comissão mais elevada por cidade;  

CREATE VIEW V_MAIOR_COMISSAO AS 
SELECT C.NOME_CIDADE AS CIDADE,
    MAX(V.COMISSAO) AS 'COMISSAO MAIOR'
FROM TAB_VENDEDOR V
INNER JOIN TAB_CIDADE C 
ON V.CODCIDADE = C.COD_CIDADE
GROUP BY C.NOME_CIDADE DESC;

SELECT * FROM V_MAIOR_COMISSAO;

+---------+----------------+
| CIDADE  | COMISSAO MAIOR |
+---------+----------------+
| Porto   |           0.14 |
| Lisboa  |           0.15 |
| Coimbra |           0.15 |
+---------+----------------+



d. O valor a receber em função do vencimento e comissão recebida para cada  vendedor (incluindo o nome do vendedor).

CREATE VIEW V_COMISSAO_F AS
SELECT NOME,VENCIMENTO,COMISSAO,
VENCIMENTO + (VENCIMENTO * COMISSAO) AS TOTAL_A_RECEBER
FROM TAB_VENDEDOR;

SELECT * FROM V_COMISSAO_F;

e. Todas as cidades e respetivos vendedores, mesmo que não existam vendedores  registados nessa cidade. 

CREATE VIEW V_REGISTRO AS
SELECT C.NOME_CIDADE,V.NOME
FROM TAB_CIDADE C
LEFT JOIN TAB_VENDEDOR V
ON V.CODCIDADE = C.COD_CIDADE;

+-------------+---------------+
| NOME_CIDADE | NOME          |
+-------------+---------------+
| Lisboa      | Andreia Silva |
| Porto       | Carla Costa   |
| Lisboa      | Carlos santos |
| Porto       | José Castro   |
| Coimbra     | João Sousa    |
| Coimbra     | Maria Silva   |
| Porto       | Mário Sousa   |
| Lisboa      | Pedro Santos  |
| Faro        | NULL          |
+-------------+---------------+

SELECT * FROM V_REGISTRO;


3. Crie uma consulta (select) à “vista”:  

CREATE VIEW V_TUDO AS 
SELECT V.NOME, C.NOME_CIDADE AS CIDADE,
    V.VENCIMENTO, V.COMISSAO,
    VENCIMENTO +(VENCIMENTO * COMISSAO) AS VALOR_A_RECEBER
FROM TAB_VENDEDOR V
INNER JOIN TAB_CIDADE C
ON V.CODCIDADE = C.COD_CIDADE;    

+---------------+---------+------------+----------+-----------------+
| NOME          | CIDADE  | VENCIMENTO | COMISSAO | VALOR_A_RECEBER |
+---------------+---------+------------+----------+-----------------+
| Andreia Silva | Lisboa  |       1000 |     0.15 |         1150.00 |
| Carla Costa   | Porto   |       1200 |     0.13 |         1356.00 |
| Carlos santos | Lisboa  |       1100 |     0.13 |         1243.00 |
| José Castro   | Porto   |       1300 |     0.14 |         1482.00 |
| João Sousa    | Coimbra |       1000 |     0.15 |         1150.00 |
| Maria Silva   | Coimbra |       1100 |     0.13 |         1243.00 |
| Mário Sousa   | Porto   |       1200 |     0.13 |         1356.00 |
| Pedro Santos  | Lisboa  |       1100 |     0.14 |         1254.00 |
+---------------+---------+------------+----------+-----------------+

SELECT *FROM  V_TUDO;

a. da alínea 2d. que, possibilite visualizar os vendedores, ordenado por nome de  vendedor e respetiva cidade;  

CREATE VIEW V_VMAIOR AS
SELECT V.NOME, C.NOME_CIDADE AS CIDADE,
    V.VENCIMENTO, V.COMISSAO,
    MAX(VENCIMENTO +(VENCIMENTO * COMISSAO)) AS VALOR_A_RECEBER
FROM TAB_VENDEDOR V
INNER JOIN TAB_CIDADE C
ON V.CODCIDADE = C.COD_CIDADE;   

+---------------+--------+------------+----------+-----------------+
| NOME          | CIDADE | VENCIMENTO | COMISSAO | VALOR_A_RECEBER |
+---------------+--------+------------+----------+-----------------+
| Andreia Silva | Lisboa |       1000 |     0.15 |         1482.00 |
+---------------+--------+------------+----------+-----------------+
SELECT * FROM V_VMAIOR;