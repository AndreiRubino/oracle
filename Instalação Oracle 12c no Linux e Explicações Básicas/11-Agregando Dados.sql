Agregando Dados
	Valor agregado/totalizado dos dados.
	
	Menor, Média e Maior valor ou Soma;
	
	Sintaxe
	SELECT <colunas>
	FROM <tabelas>
	[WHERE <condições>]
	[ORDER BY <colunas>]
	
	Principais funções
	AVG() - Média de valores
	COUNT() - Contagem de valores
	MIN - Valor Minimo
	MAX() - Valor Máximo
	SUM() - Somatorio de Valores]
	
	SELECT 	AVG(SALARY) AS MEDIA
	MIN(SALARY) AS MENOR
	MAX(SALARY) AS MAIOR
	SUM(SALARY) AS SOMA FROM EMPLOYEES;
	
	SELECT COUNT(*) FROM EMPLOYEES;
	SELECT COUNT(DISTINCT EMPLOYEES_ID) FROM EMPLOYEES;
	
	GROUP BY
	SELECT <colunas>
	FROM <tabelas>
	[WHERE <condições>]
	[ORDER BY <colunas>]
	[GROUP BY <colunas>]
	
	Valor Médio(AVG) de salario por Departamento(Group by)
	SELECT DEPARTAMENT_ID, AVG(SALARY) 
	FROM EMPLOYEES 
	GROUP BY DEPARTAMENT_ID 
	ORDER BY DEPARTAMENT_ID;
	
	Valor Médio(AVG) de salario por Departamento e por cargo (Group by)
	SELECT DEPARTAMENT_ID, JOB_ID,  AVG(SALARY) 
	FROM EMPLOYEES 
	GROUP BY DEPARTAMENT_ID, JOB_ID 
	ORDER BY DEPARTAMENT_ID;	
	
	Valor Médio(AVG) de salario por Departamento e por cargo (Group by) menos funcionario especifico.
	SELECT DEPARTAMENT_ID, JOB_ID,  AVG(SALARY) 
	FROM EMPLOYEES 
	WHERE EMPLOYEES_ID != 202 
	GROUP BY DEPARTAMENT_ID, JOB_ID 
	ORDER BY DEPARTAMENT_ID;	
	
	Valor Médio(AVG) de salario por Departamento e por cargo (Group by) filtrando linha agregada HAVING = WHERE dos comandos agreagados.
	SELECT DEPARTAMENT_ID, JOB_ID,  AVG(SALARY) 
	FROM EMPLOYEES 
	HAVING AVG(SALARY) > 500 
	GROUP BY DEPARTAMENT_ID, JOB_ID 
	ORDER BY DEPARTAMENT_ID;	
	
	
Dois grupos importantes
	Data dictionary tables
	Dynamic performance tables
	
São criados pelo script catalog.sql em $ORACLE_HOME/RDBMS/ADMIN
e procedures em catproc.sql

Prefixo e Escopo
	CDB_XXX: Todos objetos do container
	DBA_XXX: Está em todos os schemas
	ALL_XXX: Objetos que apenas o usuário atual pode ter acesso
	USER_XXX: Objetos cujo propietário é o usuário atual
	
	SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM DBA_OBJECTS;
	SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM ALL_OBJECTS;
	SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS;

View Dinamicas
	Dynamic performance views V$: dados obtidos a partir de tabelas de performance
	interna do ORACLE_HOME/RDBMS/ADMIN
	O usuário SYS é o propietário
	Mostram a atividade do banco de dados e da instancia 
	Podem retornar dados da memória e dos arquivos de controle
	Acesso somente de leitura
	Muitas vezes é preciso fazer join entre varias V$
	
	Use o comando DESCRIBE V$; para verificar seu fonte.
	
Views muito utilizadas	
	Informações gerais de objetos
	SELECT * FROM DICTIONARY;
	SELECT * FROM DICT_COLUMNS;
	
	Objetos do Schema
	SELECT * FROM DBA_TABLES;
	SELECT * FROM DBA_INDEXES;
	SELECT * FROM DBA_TAB_COLUMN;
	SELECT * FROM DBA_CONSTRAINSTS;

	Alocação de espaço
	SELECT * FROM DBA_SEGMENTS;
	SELECT * FROM DBA_EXTENTS;	
	
	Estrutura de tabelas
	SELECT * FROM DBA_TABLESPACES;
	SELECT * FROM DBA_DATA_FILES;	
	
Oracle Database Concepts B28318-06 versão online
	