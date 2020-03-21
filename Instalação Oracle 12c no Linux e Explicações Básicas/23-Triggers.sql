Triggers
	Blocos PL/SQL associados a tabelas e views, banco de dadso ou esquemas
	Triggers são executados quando o evento para qual eles foram programados
	É utilizados para implementar regras de negócio:
		Verificação de dados
		Log de operações
		Trace para debug
		Regras de integridade e validação de dados
	Triggers de:
	DML: Insert, Update e Delete
	DDL: Create, Alter e Drop
	Triggers de sistema
	
DML
	Before: Antes
	After: Após
	Evento: Insert, Update e DELETE
	Tipo: Disparadao a cada linha ou a cada instrução
	Também é possível restringir linhas que podem ou não disparar a trigger com a clausula WHEN
	É possível cancelar a instrução que disparou a trigger
	Trigger INSTEAD OF para view: substituem a ação da instrução que disparou a trigger
	
Eventos que disparam trigger:	
	BEFORE STATEMENT TRIGGER
	BEFORE ROW TRIGGER
	AFTER ROW TRIGGER
	Verificação de Constraints
	AFTER STATEMENT TRIGGER
	
	
	CREATE [OR REPLACE] TRIGGER <NOME>
	{TIMING} EVENT1 | EVENT2
	ON {TABELA}
	{CORPO TRIGGER}
	
	CREATE OR REPLACE TRIGGER T_AUX
	BEFORE INSERT ON TABELA_AUX
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Linha Inserida com succeso');
	END;
	
	CREATE OR REPLACE TRIGGER T_AUX 
	AFTER INSERT OR UPDATE OR DELETE ON TABELA_AUX
	FOR EACH ROW --PARA CADA LINHA
	BEGIN
		IF INSERTING THEN
			DBMS_OUTPUT.PUT_LINE('Linha Inserida com succeso');
		ELSIF UPDATING THEN
			DBMS_OUTPUT.PUT_LINE('Linha Atualizada com succeso');
		ELSIF DELETING THEN
			DBMS_OUTPUT.PUT_LINE('Linha Apagada com succeso');
		END;
	END;
	
	CREATE OR REPLACE TRIGGER T_AUX 
	AFTER INSERT OR UPDATE OR DELETE ON TABELA_AUX
	FOR EACH ROW WHEN (NEW.ID = 10) --PARA CADA LINHA QUE A COLUNA ID SEJA = 10
	BEGIN
		IF INSERTING THEN
			DBMS_OUTPUT.PUT_LINE('Linha Inserida com succeso');
		ELSIF UPDATING THEN
			DBMS_OUTPUT.PUT_LINE('Linha Atualizada com succeso');
		ELSIF DELETING THEN
			DBMS_OUTPUT.PUT_LINE('Linha Apagada com succeso');
		END;
	END;