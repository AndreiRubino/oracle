/*
	FLASHBACK
*/

• O Oracle FlashBack é uma funcionalidade que permite visualizar dados ‘do passado’ 
• Semelhante à lixeira do sistema operacional, mas com linhas da tabela 
• Indicamos um momento (point in time) ou SCN (System Change Number – identificador de transação)
• Somente funciona para transações que já foram finalizadas (commit)
• Necessita de uma tablespace de UNDO e a configuração de alguns parâmetros 
	• UNDO_MANAGEMENT: TRUE ou AUTO p/ gerenciamento automático da tablespace de UNDO 
	• UNDO_RETENTION: tempo (seg.) para manter o dado 
	• UNDO_TABLESPACE: nome da tablespace de UNDO
	

--VERIFICAR SE A TABLESPACE UNDO ESTÁ COM GERENCIAMENTO AUTOMATICO HABILITADO
	SHOW PARAMETERS;
	SELECT * FROM V$TABLESPACE;

--VERIFICAR PERMISSÕES DE EXECUÇÃO NO PACOTE DBMS_FLASHBACK
	

--DAR PERMISSÃO DE EXECUÇÃO NO PACOTE DBMS_FLASHBACK
	GRANT EXECUTE ON DBMS_FLASHBACK TO USUARIO;
	
	
--VOLTAR A TABELA PARA ANTES DE UM PROBLEMA
	CREATE TABLE TAB_DATA (ID INT PRIMARY KEY, NAME VARCHAR(100));
	CREATE TABLE TAB_FLASHBACK (MOMENT DATE ); -- Tabela auxiliar para guardar a data que ocorreu o problema
	
	INSERT INTO TAB_DATA VALUES(1,'A');  --  Inserindo alguns dados 	
	INSERT INTO TAB_DATA VALUES(2,'B'); 
	INSERT INTO TAB_DATA VALUES(3,'C'); 
	INSERT INTO TAB_DATA VALUES(4,'D'); 
	COMMIT;; 
	
	INSERT INTO TAB_FLASHBACK VALUES(SYSDATE);  -- Guardando a data para podermos voltar a este momento
	COMMIT;
	
	DELETE TAB_DATA WHERE ID = 2;  -- Simulando um erro que necessite olhar para os dados no passado 
	COMMIT;
	
	SELECT * FROM TAB_DATA;
	
	DECLARE   -- Obtendo a data e ‘voltando no tempo’ 
		R DATE;
	BEGIN 
		SELECT MOMENT INTO R FROM TAB_FLASHBACK;
		DBMS_FLASHBACK.ENABLE_AT_TIME(R); 
	END;
	
	SELECT * FROM TAB_DATA; -- Checando os dados: notem que o ID=2 existe! Aqui podemos copiar estes dados para outra tabela.
	
	BEGIN  -- Voltando a tabela para o ‘momento atual’ 
		DBMS_FLASHBACK.DISABLE;
	END; 
	
	SELECT * FROM TAB_DATA;  -- Registro foi apagado novamente.


--TIRAR DA LIXEIRA UMA TABELA APAGADA
	Confirme se parâmetro RECYCLEBIN está ON 
	• Para o exemplo de RECYCLEBIN é preciso criar um novo usuário 
	• Nome: C##_ANDREI 
	• Permissões (Granted Roles): CONNECT e DBA 
	• Utilize a opção DBA do SQLDeveloper para criar um novo usuário 
	• Abra a conexão com ousuário C##_ANDREI
	
	CREATE TABLE TESTE (A INT);  -- Criando e apagando uma tabela 
	SELECT * FROM TESTE; 
	DROP TABLE TESTE; 
	
	SELECT * FROM RECYCLEBIN; -- Dando uma olhada na 'lixeira'
	FLASHBACK TABLE T1 TO BEFORE DROP;   -- Recuperando a tabela da 'lixeira'
	DROP TABLE T1 PURGE; -- Removendo a tabela sem passar pela 'lixeira' 