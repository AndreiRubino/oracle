PROCEDURE
	São funções escritas em PL/SQL armazenadas no Oracle
	Geralmente contém as regas de negocios para manipulação de dados
	
	Vantagens:
	Modularidade, Reusabilidade, Extensibilidade, Mantenabilidade, Segurança dos dados,
	Intergridade, Performance, Clareza de código.
	
BLOCOS PL/SQL
	DECLARE -- Coloque as variares
	....
	BEGIN -- Inicio do código
	...
	EXCEPTION -- Tratamento de erros por exceção
	...
	END;
	
	DECLARE	
		media INT := 10;
		
	BEGIN	
		select avg(salary) into media from employees;
		
		DBMS_OUTPUT.PUT_LINE('Media:' || TO_CHAR(media));
		
	END;
	
	CREATE OR REPLACE PROCEDURE PRC_DATE
	IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('DATA:', TO_CHAR(SYSDATE));
	END;
	
	Parametros
	IN: entrada
	OUT: Saída
	IN OUT: recebe e retornar valores;
	
	CREATE OR REPLACE PROCEDURE PROC_CUSTOMERS(ID_CUSTOMER CUSTOMERS.ID%TYPE)
	IS
	BEGIN
		INSERT INTO CUSTOMERS(ID,NOME) VALUES(ID_CUSTOMER, 'TESTE' || TO_CHAR(ID_CUSTOMER);
	COMMIT;
	END;
	
	
	CREATE OR REPLACE PROCEDURE PROC_NAME(
	ID_CUSTOMER IN CUSTOMERS.ID%TYPE,
	NAME OUT CUSTOMERS.NOME%TYPE)
	IS
	BEGIN
		SELECT NOME INTO NAME FROM CUSTOMERS WHERE ID=ID_CUSTOMER;
	COMMIT;
	END;
	
	
	
	
	