Comando SELECT
	SELECT * FROM TABLE;
	SELECT COLUNA_1, COLUNA_2 FROM TABLE;
	SELECT EMPLYEE_ID || ' - ' || FROM TABLE;
	
	
Restringindo e ordenando dados
	SELECT <colunas> FROM <tabela> where <condições>;
	SELECT  * FROM EMPLOYEE  where EMPLOYEE_ID = 90;
	SELECT  * FROM EMPLOYEE  where LAST_NAME = 'King';
	SELECT  * FROM EMPLOYEE  where HIRE_DATE = '13-JAN-90';
	
	Operadores
	= igual
	< menor
	> maior
	<= menor igual
	>= maior igual
	<>, !=, ^= diferente
	
	Beetween   valores no intervalo
	SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 5000 AND 80000;
	IN() especificar valores
	SELECT * FROM EMPLOYEE WHERE SALARY IN (80,90,100);
	
	Operadores lógicos
	AND, OR e NOT
	SELECT * FROM EMPLOYEE WHERE LAST_NAME '%a' AND DEPARTAMENT_ID = 100
	SELECT * FROM EMPLOYEE WHERE LAST_NAME '%a' OR DEPARTAMENT_ID = 100
	SELECT * FROM EMPLOYEE WHERE LAST_NAME '%a' NOT DEPARTAMENT_ID = 100
	
	Ordenando Resultados
	ORDER BY <coluna> ASC|DESC;
	SELECT * FROM EMPLOYEE WHERE LAST_NAME '%a' AND DEPARTAMENT_ID = 10 ORDER BY DEPARTAMENT_ID;