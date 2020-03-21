Instruções INSERT
	INSERT INTO <tabela> (<colunas>,<coluna_2>) VALUES (<value1>,<value2>);
	INSERT INTO DEPARTAMENTS (DEPARTAMENT_ID,DEPARTAMENT_NAME,MANAGER_ID,LOCATION_ID)
	VALUES (300, 'Maintance', 1, 5);
	INSERT INTO DEPARTAMENTS (DEPARTAMENT_ID,DEPARTAMENT_NAME)
	VALUES (310, 'Services');
	INSERT INTO DEPARTAMENTS VALUES (310, 'Services', null,null);
	
	
	UPDATE <tabela> set <coluna=valor, coluna=valor> WHERE <condição>;
	UPDATE EMPLOYEES set LAST_NAME = 'RUBINO' WHERE EMPLOYEES_ID = 114;
	UPDATE EMPLOYEES SET SALARY = SALARY *1.1 WHERE EMPLOYEES_ID = 114;
	
	DELETE FROM DEPARTAMENTS WHERE DEPARTAMENT_NAME = 'Maintance';
	DELETE FROM DEPARTAMENTS WHERE DEPARTAMENT_ID = 60;
	
Transações
	Todo comando que manipula dados (Insert, Update e Delete)
	Caso ocorra tudo bem a transação é completada é realizado o COMMIT
	Caso haja algum erro o Oracle volta os dados para o estado inicial e cancela a transição ROLLBACK
	Por Padrão SQL Developer ou SQLPLUS requerem o fim da transação para que ela possa ser visualizada
	pelos demais usuários.
	COMMIT = finaliza transação
	ROLLBACK = cancela transação
	