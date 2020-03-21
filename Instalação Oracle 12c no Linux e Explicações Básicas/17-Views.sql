VIEWS
	Basicamente uma instrução select, utilizado para Selects complexos.	
	View podem ser somente para leitura READ ONLY ou permitir a modificação de dados.
	É possivel criar indices especiais em views (views materalizadas).
	
	CREATE [OR REPLACE] VIEW <nome-view>
	AS
		<instrução SELECT>;
		
	Existem restrições no SELECT, como uso do ORDER BY.
	
	CREATE OR REPLACE VIEW VW_TESTE
	AS	
		SELECT EMPLOYEE_ID, 
		LAST_NAME,
		SALARY, 
		FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,
		ROWNUM AS NUM 
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID = 80
	WITH READ ONLY; -- Somente leitura
		

	CREATE OR REPLACE VIEW VW_DEPT_SUM_VU(NAME, MINSAL, MAXSAL, AVGSAL)
	AS	
		SELECT D.DEPARTMENT_NAME, 
		MIN(E.SALARY),
		MAX(E.SALARY), 
		AVG(E.SALARY),
		ROWNUM AS NUM 
	FROM EMPLOYEES E, DEPARTMENTS D
	WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
	GROUP BY D.DEPARTMENT_NAME;
	
	DROP VIEW <nome-view>;