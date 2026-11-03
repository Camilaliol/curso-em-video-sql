1.  PARA ABRIR O TERMINAR:

mysql -u root -p



2. PARA EXPORTAR E FAZER UM BACKUP TOTAL :

mysqldump -u root -p --all-databases > backup_geral.sql

apenas para o mac:
mysqldump -u root -p --set-gtid-purged=OFF --single-transaction --all-databases --triggers --routines --events > backup_geral.sql

3. JÁ PARA EXPORTAÇÃO APENAS DE UMA DELAS FAÇA:

msqldump -u root -p --databases cadastro > backup_cadastro.sql

configuraçao para o mac
mysqldump -u root -p --set-gtid-purged=OFF --single-transaction cadastro > backup_cadastro.sql

4.0 para apagar o banco de dados:

DROP DATABASE CADASTRO; --APAGA O BANCO DE DADOS TODO


4. PARA IMPORTAR O BANCO DE DADOS:

mysql -u root -p < backup_geral.sql 
