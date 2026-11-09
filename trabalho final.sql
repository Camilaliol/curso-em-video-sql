1- Cria uma base de dados com o nome GestaoLoja. A base de dados deverá ser criada no servidor MySQL.
CREATE DATABASE  GESTAO_LOJA;
+--------------------+
| Database           |
+--------------------+
| bd_cursos          |
| bd_vendas1         |
| cadastro           |
| gestao_loja        |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
+--------------------+

2- 5. Etapa 2 – Criação das tabelas
Cria as cinco tabelas seguintes, respeitando os campos, tipos de dados e regras indicados.

CREATE TABLE CLIENTE (
    ID_CLIENTE INT PRIMARY KEY,
    NOME VARCHAR(100),
    EMAIL VARCHAR(100),
    TELEFONE VARCHAR(20),
    CIDADE VARCHAR(50)
);

SELECT * FROM CLIENTE;

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY,
    NOME_CATEGORIA VARCHAR(50),
    DESCRICAO VARCHAR(150)
);

CREATE TABLE PRODUTO (
    ID_PRODUTO INT PRIMARY KEY,
    NOME_PRODUTO VARCHAR(100),
    PRECO DECIMAL(10,2),
    STOCK INT,
    ID_CATEGORIA INT,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA) --a REFERENCIA É NECESSARIA PARA FALAR DE ONDE VEM A INFORMAÇÃO
);
 
CREATE TABLE ENCOMENDA (
    ID_ENCOMENDA INT PRIMARY KEY,
    DATA_ENCOMENDA DATE,
    ESTADO VARCHAR(30),
    ID_CLIENTE INT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);


CREATE TABLE LINHA_ENCOMENDA(
    id_linha INT PRIMARY KEY,
    id_encomenda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (ID_ENCOMENDA) REFERENCES ENCOMENDA(ID_ENCOMENDA),
    FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO)
);

+-----------------------+
| Tables_in_gestao_loja |
+-----------------------+
| categoria             |
| cliente               |
| encomenda             |
| linha_encomenda       |
| produto               |
+-----------------------+


Etapa 3 – Criação das associações
Estabelece as seguintes relações:
• Uma categoria pode ter vários produtos; cada produto pertence a uma categoria (1:N).

4- Etapa 4 – Inserção de dados
Insere dados nas cinco tabelas, respeitando as chaves estrangeiras e as relações definidas. Deverão existir
encomendas com vários produtos e clientes com mais do que uma encomenda.
Tabela Número mínimo de registos
Clientes 8
Categorias 4
Produtos 12
Encomendas 10
LinhasEncomenda 20

INSERT INTO CLIENTE (ID_CLIENTE, NOME, EMAIL, TELEFONE, CIDADE) VALUES
(1, 'JOÃO SILVA', 'JOAO.SILVA@EMAIL.COM', '912345678', 'PORTO'),
(2, 'MARIA FERREIRA', 'MARIA.FERREIRA@EMAIL.COM', '934567890', 'LISBOA'),
(3, 'CARLOS SANTOS', 'CARLOS.SANTOS@EMAIL.COM', '961234567', 'BRAGA'),
(4, 'ANA RODRIGUES', 'ANA.RODRIGUES@EMAIL.COM', '925554433', 'COIMBRA'),
(5, 'PEDRO COSTA', 'PEDRO.COSTA@EMAIL.COM', '918887766', 'AVEIRO'),
(6, 'SOFIA MARTINS', 'SOFIA.MARTINS@EMAIL.COM', '939991122', 'FARO'),
(7, 'RUI ALMEIDA', 'RUI.ALMEIDA@EMAIL.COM', '967773344', 'FUNCHAL'),
(8, 'BEATRIZ GOMES', 'BEATRIZ.GOMES@EMAIL.COM', '921115566', 'VISEU');

SELECT * FROM CLIENTE;
+------------+----------------+--------------------------+-----------+---------+
| ID_CLIENTE | NOME           | EMAIL                    | TELEFONE  | CIDADE  |
+------------+----------------+--------------------------+-----------+---------+
|          1 | JOÃO SILVA     | JOAO.SILVA@EMAIL.COM     | 912345678 | PORTO   |
|          2 | MARIA FERREIRA | MARIA.FERREIRA@EMAIL.COM | 934567890 | LISBOA  |
|          3 | CARLOS SANTOS  | CARLOS.SANTOS@EMAIL.COM  | 961234567 | BRAGA   |
|          4 | ANA RODRIGUES  | ANA.RODRIGUES@EMAIL.COM  | 925554433 | COIMBRA |
|          5 | PEDRO COSTA    | PEDRO.COSTA@EMAIL.COM    | 918887766 | AVEIRO  |
|          6 | SOFIA MARTINS  | SOFIA.MARTINS@EMAIL.COM  | 939991122 | FARO    |
|          7 | RUI ALMEIDA    | RUI.ALMEIDA@EMAIL.COM    | 967773344 | FUNCHAL |
|          8 | BEATRIZ GOMES  | BEATRIZ.GOMES@EMAIL.COM  | 921115566 | VISEU   |
+------------+----------------+--------------------------+-----------+---------+

INSERT INTO CATEGORIA (ID_CATEGORIA, NOME_CATEGORIA, DESCRICAO) VALUES
(1, 'TECNOLOGIA', 'PRODUTOS ELETRÓNICOS, INFORMÁTICA E ACESSÓRIOS'),
(2, 'VESTUÁRIO', 'ROUPAS, CALÇADO E ACESSÓRIOS DE MODA'),
(3, 'CASA E JARDIM', 'MÓVEIS, DECORAÇÃO E UTENSÍLIOS DOMÉSTICOS'),
(4, 'LIVROS', 'LIVROS FÍSICOS, EBOOKS E MATERIAL ESCRITO');

SELECT * FROM CATEGORIA

+--------------+----------------+------------------------------------------------+
| ID_CATEGORIA | NOME_CATEGORIA | DESCRICAO                                      |
+--------------+----------------+------------------------------------------------+
|            1 | TECNOLOGIA     | PRODUTOS ELETRÓNICOS, INFORMÁTICA E ACESSÓRIOS |
|            2 | VESTUÁRIO      | ROUPAS, CALÇADO E ACESSÓRIOS DE MODA           |
|            3 | CASA E JARDIM  | MÓVEIS, DECORAÇÃO E UTENSÍLIOS DOMÉSTICOS      |
|            4 | LIVROS         | LIVROS FÍSICOS, EBOOKS E MATERIAL ESCRITO      |
+--------------+----------------+------------------------------------------------+


INSERT INTO PRODUTO (ID_PRODUTO, NOME_PRODUTO, PRECO, STOCK, ID_CATEGORIA) VALUES
(1, 'PORTÁTIL GAMER', 1299.99, 15, 1),
(2, 'SMARTPHONE 5G', 799.90, 30, 1),
(3, 'RATO SEM FIOS', 45.50, 120, 1),
(4, 'T-SHIRT ALGODÃO', 19.99, 200, 2),
(25, 'CRUZ DE SÃO TIAGO', 5.50, 50, 4),
(5, 'SWEATSHIRT COM CAPUZ', 39.90, 85, 2),
(6, 'SAPELES CORRIDA', 89.95, 40, 2),
(7, 'SOFÁ 3 LUGARES', 450.00, 5, 3),
(8, 'LÂMPADA INTELIGENTE LED', 14.99, 150, 3),
(9, 'VASO DE CERÂMICA', 24.90, 60, 3),
(10, 'O FEITICEIRO DE OZ', 15.90, 45, 4),
(11, 'INTRODUÇÃO AO SQL', 29.99, 80, 4);

SELECT * FROM PRODUTO;

+------------+-------------------------+---------+-------+--------------+
| ID_PRODUTO | NOME_PRODUTO            | PRECO   | STOCK | ID_CATEGORIA |
+------------+-------------------------+---------+-------+--------------+
|          1 | PORTÁTIL GAMER          | 1299.99 |    15 |            1 |
|          2 | SMARTPHONE 5G           |  799.90 |    30 |            1 |
|          3 | RATO SEM FIOS           |   45.50 |   120 |            1 |
|          4 | T-SHIRT ALGODÃO         |   19.99 |   200 |            2 |
|          5 | SWEATSHIRT COM CAPUZ    |   39.90 |    85 |            2 |
|          6 | SAPELES CORRIDA         |   89.95 |    40 |            2 |
|          7 | SOFÁ 3 LUGARES          |  450.00 |     5 |            3 |
|          8 | LÂMPADA INTELIGENTE LED |   14.99 |   150 |            3 |
|          9 | VASO DE CERÂMICA        |   24.90 |    60 |            3 |
|         10 | O FEITICEIRO DE OZ      |   15.90 |    45 |            4 |
|         11 | INTRODUÇÃO AO SQL       |   29.99 |    80 |            4 |
|         25 | CRUZ DE SÃO TIAGO       |    5.50 |    50 |            4 |
+------------+-------------------------+---------+-------+--------------+

INSERT INTO ENCOMENDA (ID_ENCOMENDA, DATA_ENCOMENDA, ESTADO, ID_CLIENTE) VALUES
(1, '2026-11-01', 'ENTREGUE', 1),
(2, '2026-11-02', 'ENTREGUE', 2),
(3, '2026-11-03', 'PROCESSAMENTO', 3),
(4, '2026-11-04', 'EXPEDIDO', 4),
(5, '2026-11-05', 'ENTREGUE', 5),
(6, '2026-11-06', 'CANCELADO', 6),
(7, '2026-11-07', 'PROCESSAMENTO', 7),
(8, '2026-11-08', 'EXPEDIDO', 8),
(9, '2026-11-09', 'PROCESSAMENTO', 1),
(10, '2026-11-09', 'PENDENTE', 2);

SELECT * FROM ENCOMENDA;

+--------------+----------------+---------------+------------+
| ID_ENCOMENDA | DATA_ENCOMENDA | ESTADO        | ID_CLIENTE |
+--------------+----------------+---------------+------------+
|            1 | 2026-11-01     | ENTREGUE      |          1 |
|            2 | 2026-11-02     | ENTREGUE      |          2 |
|            3 | 2026-11-03     | PROCESSAMENTO |          3 |
|            4 | 2026-11-04     | EXPEDIDO      |          4 |
|            5 | 2026-11-05     | ENTREGUE      |          5 |
|            6 | 2026-11-06     | CANCELADO     |          6 |
|            7 | 2026-11-07     | PROCESSAMENTO |          7 |
|            8 | 2026-11-08     | EXPEDIDO      |          8 |
|            9 | 2026-11-09     | PROCESSAMENTO |          1 |
|           10 | 2026-11-09     | PENDENTE      |          2 |
+--------------+----------------+---------------+------------+

INSERT INTO LINHA_ENCOMENDA (ID_LINHA, ID_ENCOMENDA, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO) VALUES
(1, 1, 1, 1, 1299.99),
(2, 1, 3, 2, 45.50),
(3, 2, 2, 1, 799.90),
(4, 3, 4, 3, 19.99),
(5, 3, 5, 1, 39.90),
(6, 4, 6, 1, 89.95),
(7, 4, 11, 2, 29.99),
(8, 5, 7, 1, 450.00),
(9, 5, 8, 5, 14.99),
(10, 6, 9, 2, 24.90),
(11, 7, 10, 1, 15.90),
(12, 7, 25, 4, 5.50),
(13, 8, 1, 1, 1299.99),
(14, 8, 4, 2, 19.99),
(15, 9, 2, 1, 799.90),
(16, 9, 3, 1, 45.50),
(17, 9, 8, 3, 14.99),
(18, 10, 5, 1, 39.90),
(19, 10, 6, 1, 89.95),
(20, 10, 11, 1, 29.99);

SELECT * FROM LINHA_ENCOMENDA;

+----------+--------------+------------+------------+----------------+
| id_linha | id_encomenda | id_produto | quantidade | preco_unitario |
+----------+--------------+------------+------------+----------------+
|        1 |            1 |          1 |          1 |        1299.99 |
|        2 |            1 |          3 |          2 |          45.50 |
|        3 |            2 |          2 |          1 |         799.90 |
|        4 |            3 |          4 |          3 |          19.99 |
|        5 |            3 |          5 |          1 |          39.90 |
|        6 |            4 |          6 |          1 |          89.95 |
|        7 |            4 |         11 |          2 |          29.99 |
|        8 |            5 |          7 |          1 |         450.00 |
|        9 |            5 |          8 |          5 |          14.99 |
|       10 |            6 |          9 |          2 |          24.90 |
|       11 |            7 |         10 |          1 |          15.90 |
|       12 |            7 |         25 |          4 |           5.50 |
|       13 |            8 |          1 |          1 |        1299.99 |
|       14 |            8 |          4 |          2 |          19.99 |
|       15 |            9 |          2 |          1 |         799.90 |
|       16 |            9 |          3 |          1 |          45.50 |
|       17 |            9 |          8 |          3 |          14.99 |
|       18 |           10 |          5 |          1 |          39.90 |
|       19 |           10 |          6 |          1 |          89.95 |
|       20 |           10 |         11 |          1 |          29.99 |
+----------+--------------+------------+------------+----------------+


Etapa 5 – Consultas SQL simples

5.1 Listar todos os clientes: Apresenta todos os campos da tabela Clientes.

SELECT * FROM CLIENTE;
+------------+----------------+--------------------------+-----------+---------+
| ID_CLIENTE | NOME           | EMAIL                    | TELEFONE  | CIDADE  |
+------------+----------------+--------------------------+-----------+---------+
|          1 | JOÃO SILVA     | JOAO.SILVA@EMAIL.COM     | 912345678 | PORTO   |
|          2 | MARIA FERREIRA | MARIA.FERREIRA@EMAIL.COM | 934567890 | LISBOA  |
|          3 | CARLOS SANTOS  | CARLOS.SANTOS@EMAIL.COM  | 961234567 | BRAGA   |
|          4 | ANA RODRIGUES  | ANA.RODRIGUES@EMAIL.COM  | 925554433 | COIMBRA |
|          5 | PEDRO COSTA    | PEDRO.COSTA@EMAIL.COM    | 918887766 | AVEIRO  |
|          6 | SOFIA MARTINS  | SOFIA.MARTINS@EMAIL.COM  | 939991122 | FARO    |
|          7 | RUI ALMEIDA    | RUI.ALMEIDA@EMAIL.COM    | 967773344 | FUNCHAL |
|          8 | BEATRIZ GOMES  | BEATRIZ.GOMES@EMAIL.COM  | 921115566 | VISEU   |
+------------+----------------+--------------------------+-----------+---------+

5.2 Listar os produtos: Apresenta o nome, o preço e o stock de todos os produtos.

SELECT NOME_PRODUTO, PRECO, STOCK FROM PRODUTO;
+-------------------------+---------+-------+
| NOME_PRODUTO            | PRECO   | STOCK |
+-------------------------+---------+-------+
| PORTÁTIL GAMER          | 1299.99 |    15 |
| SMARTPHONE 5G           |  799.90 |    30 |
| RATO SEM FIOS           |   45.50 |   120 |
| T-SHIRT ALGODÃO         |   19.99 |   200 |
| SWEATSHIRT COM CAPUZ    |   39.90 |    85 |
| SAPELES CORRIDA         |   89.95 |    40 |
| SOFÁ 3 LUGARES          |  450.00 |     5 |
| LÂMPADA INTELIGENTE LED |   14.99 |   150 |
| VASO DE CERÂMICA        |   24.90 |    60 |
| O FEITICEIRO DE OZ      |   15.90 |    45 |
| INTRODUÇÃO AO SQL       |   29.99 |    80 |
| CRUZ DE SÃO TIAGO       |    5.50 |    50 |
+-------------------------+---------+-------+

5.3 Produtos com preço superior a 30 €: Apresenta os produtos cujo preço seja superior a 30
euros.

SELECT NOME_PRODUTO, PRECO FROM PRODUTO
WHERE PRECO > 30;

+----------------------+---------+
| NOME_PRODUTO         | PRECO   |
+----------------------+---------+
| PORTÁTIL GAMER       | 1299.99 |
| SMARTPHONE 5G        |  799.90 |
| RATO SEM FIOS        |   45.50 |
| SWEATSHIRT COM CAPUZ |   39.90 |
| SAPELES CORRIDA      |   89.95 |
| SOFÁ 3 LUGARES       |  450.00 |
+----------------------+---------+

5.4 Clientes de uma determinada cidade: Apresenta os clientes que residem numa cidade à tua
escolha.

SELECT CIDADE, NOME FROM CLIENTE
WHERE CIDADE = 'PORTO';

+--------+------------+
| CIDADE | NOME       |
+--------+------------+
| PORTO  | JOÃO SILVA |
+--------+------------+

5.5 Produtos ordenados por preço: Apresenta todos os produtos ordenados por preço, do mais
caro para o mais barato.

SELECT NOME_PRODUTO, PRECO FROM PRODUTO
ORDER BY PRECO DESC; -- ORDER BY ORDENA O PREÇO E O DESC COLOCA DO MAIOR PARA MENOR

+-------------------------+---------+
| NOME_PRODUTO            | PRECO   |
+-------------------------+---------+
| PORTÁTIL GAMER          | 1299.99 |
| SMARTPHONE 5G           |  799.90 |
| SOFÁ 3 LUGARES          |  450.00 |
| SAPELES CORRIDA         |   89.95 |
| RATO SEM FIOS           |   45.50 |
| SWEATSHIRT COM CAPUZ    |   39.90 |
| INTRODUÇÃO AO SQL       |   29.99 |
| VASO DE CERÂMICA        |   24.90 |
| T-SHIRT ALGODÃO         |   19.99 |
| O FEITICEIRO DE OZ      |   15.90 |
| LÂMPADA INTELIGENTE LED |   14.99 |
| CRUZ DE SÃO TIAGO       |    5.50 |
+-------------------------+---------+

5.6 Encomendas realizadas: Apresenta o identificador, a data e o estado das encomendas.

SELECT 