cd c:\xampp\mysql\bin      necessário para abrir o terminal
 
c:\xampp\mysql\bin>mysql -u root -p


1. Crie uma Base de Dados com o nome: “BDCursos”.

CREATE DATABASE BD_CURSOS;

2. Crie as seguintes tabelas, chaves primárias e chaves estrangeiras que considere
adequadas para criar as associações lógicas entre as tabelas (crie as associações entre
as tabelas, antes de inserir os dados)..
1a Tabela:
Nome do Campo Tipo de Dados Tamanho do Campo Obs.
Codigo_Curso integer Not null, primary key, auto

CREATE TABLE TAB_CURSOS(
    COD_CURSO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CURSO VARCHAR (30),
    PRECO_CURSO DECIMAL (10,2)
);

• Inserir os seguintes dados:
INSERT INTO TAB_CURSOS(CURSO,PRECO_CURSO) VALUES("INICIAÇÃO À INFORMÁTICA",130);
INSERT INTO TAB_CURSOS(CURSO,PRECO_CURSO) VALUES("WORD",135), ("EXCEL",140);
INSERT INTO TAB_CURSOS(CURSO,PRECO_CURSO) VALUES("HTML",160), ("JAVASCRIPT",180), ("VISUAL BASIC",190);
INSERT INTO TAB_CURSOS(CURSO,PRECO_CURSO) VALUES("C#",200), ("POWERPOINT",200), ("INTERNET",250),("BASES DE DADOS",250);

SHOW TABLES --pARA VERIFICAR SE FOI CRIADO

CREATE TABLE TAB_COD_POSTAL(
    COD_POSTAL VARCHAR (8) NOT NULL PRIMARY KEY,
    LOCAL VARCHAR(50) 
);

INSERT INTO TAB_COD_POSTAL(COD_POSTAL, LOCAL) VALUES("1100-100","LISBOA"), ("1150-020","LISBOA"), ("2670-100","LOURES"), ("2800-100","ALMADA"), ("2800-200","ALMADA"), ("4000-120","PORTO");


CREATE TABLE TAB_ALUNOS(
    COD_ALUNO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR (50),
    DATA_NASC DATE, 
    COD_POSTAL VARCHAR (8),
    FOTO VARCHAR (50),

    FOREIGN KEY (COD_POSTAL) REFERENCES TAB_COD_POSTAL (COD_POSTAL)
);

INSERT INTO TAB_ALUNOS(NOME, DATA_NASC, COD_POSTAL, FOTO) VALUES ("RAMIRO ALVES", "1995-12-09", "1100-100", NULL);
INSERT INTO TAB_ALUNOS(NOME, DATA_NASC, COD_POSTAL, FOTO) VALUES ("RÚBEN MALAGUETA", "2000-09-19", "1150-020", NULL), ("HELENA TRÓIA", "1996-04-20", "2800-100", NULL), ("RUI DUNAS", "1997-10-06", "2800-200", NULL);
INSERT INTO TAB_ALUNOS(NOME, DATA_NASC, COD_POSTAL, FOTO) VALUES ("FÁTIMA BONIFÁCIA", "1990-08-09", "1100-100", NULL), ("JOSÉ CRISTO ESTRELA", "1976-10-08", "1100-100", NULL);


CREATE TABLE TAB_PROFESSORES (
    COD_PROFESSOR INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(50),
    DATA_ADMISSAO DATE
);

INSERT INTO TAB_PROFESSORES(NOME,DATA_ADMISSAO) VALUES ("ANA SILVA","2008-10-02"), ("LUIS ALVES","2009-12-04"), ("CARLOS MANUEL","2010-10-05"), ("SANDRA NUNES","2011-12-09"), ("JOÃO CARLOS","2012-10-01");


CREATE TABLE TAB_MOVIMENTOS(
    COD_MOV INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DATA_INICIO DATE,
    COD_ALUNO INT,
    COD_PROFESSOR INT,
    COD_CURSO INT,
    NOTA_FINAL DECIMAL (10,2),

    FOREIGN KEY (COD_ALUNO) REFERENCES TAB_ALUNOS(COD_ALUNO),
    FOREIGN KEY (COD_PROFESSOR) REFERENCES TAB_PROFESSORES(COD_PROFESSOR),
    FOREIGN KEY (COD_CURSO) REFERENCES TAB_CURSOS (COD_CURSO)
);


INSERT INTO TAB_MOVIMENTOS(DATA_INICIO, DATA_FIM, COD_ALUNO, COD_PROFESSOR, COD_CURSO, NOTA_FINAL) VALUES ("2019-01-10", "2019-01-11", 2, 2, 2, 13), ("2019-01-01", "2019-01-02", 3, 3, 3, 14), ("2019-01-10", "2019-01-12", 4, 4, 4, 8);
INSERT INTO TAB_MOVIMENTOS(DATA_INICIO, DATA_FIM, COD_ALUNO, COD_PROFESSOR, COD_CURSO, NOTA_FINAL) VALUES ("2019-02-10", "2019-02-12", 2, 2, 2, 17), ("2019-02-01", "2019-02-04", 3, 3, 3, 18), ("2019-02-10", "2019-02-12", 4, 4, 4, 7);


ALTER TABLE TAB_MOVIMENTOS
ADD COLUMN DATA_FIM DATE AFTER DATA_INICIO;

3. Crie “vistas” para:
a. Mostrar todos os movimentos (notas lançadas)

    CREATE VIEW V_MOVIMENTOS AS
 SELECT * FROM TAB_MOVIMENTOS;

 SELECT * FROM V_MOVIMENTOS;
+---------+-------------+-----------+---------------+-----------+------------+
| COD_MOV | DATA_INICIO | COD_ALUNO | COD_PROFESSOR | COD_CURSO | NOTA_FINAL |
+---------+-------------+-----------+---------------+-----------+------------+
|       1 | 2019-01-10  |         2 |             2 |         2 |      13.00 |
|       2 | 2019-01-01  |         3 |             3 |         3 |      14.00 |
|       3 | 2019-01-10  |         4 |             4 |         4 |       8.00 |
|       4 | 2019-02-10  |         2 |             2 |         2 |      17.00 |
|       5 | 2019-02-01  |         3 |             3 |         3 |      18.00 |
|       6 | 2019-02-10  |         4 |             4 |         4 |       7.00 |
+---------+-------------+-----------+---------------+-----------+------------+

b. Mostrar todos os movimentos, incluindo nome do aluno, professor e curso;


CREATE VIEW V_MOVE_TOTAL;
SELECT M.COD_MOV, M.DATA_INICIO,M.DATA_FIM, M.COD_ALUNO, M.COD_PROFESSOR,M.COD_CURSO, M.NOTA_FINAL, 
A.NOME AS 'ALUNO',
P.NOME AS 'PROFESSOR',
C.CURSO AS 'CURSOS'
FROM TAB_MOVIMENTOS M
INNER JOIN TAB_ALUNOS A
ON M.COD_ALUNO = A.COD_ALUNO
INNER JOIN TAB_PROFESSORES P
ON M.COD_PROFESSOR = P.COD_PROFESSOR
INNER JOIN TAB_CURSOS C
ON M.COD_CURSO = C.COD_CURSO;




c. Acrescente à consulta anterior o preço do curso;
d. Mostrar o número de alunos por curso (incluindo o nome do curso);
e. Mostrar o valor recebido por cada curso (soma dos valores de cada curso * no de
alunos);
f. Alterar a vista anterior para mostrar a média do valor recebido por curso,
apresentada com 2 casas decimais (usar a função round(valor, casas decimais))
para obter essa apresentação.
