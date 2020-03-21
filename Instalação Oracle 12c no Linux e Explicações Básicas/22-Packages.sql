Packages
	Agrupam variaveis, procedures, functions, cursores e outros objetos
	
	Vantagens
		Modularização e encapsulamento
		Design da aplicação (com foco no banco), organização.
		Performance: Oracle coloca mutiplos objetos na memória de uma só vez
		Facilidade para gerenciamento de permissões
		Nota: packages possuem semelhanças com conceitos de orientação a objetos
		
	Para criação são divididos em duas partes
		Specification
			Declare as variaveis publicas e assinaturas de procedures e functions
			Não contém implementação do código
			Separa a lógica da interface
			Pode ser criado sem umm package body
		Body
		
	Ex:
		CREATE [OR REPLACE] PACKAGE <NOME>
		IS | AS
			<tipos_publicos>
			<variaveis_publicas>
			<assinaturas>
		END <NOME>;
		
		
		CREATE OR REPLACE PACKAGE PCK_1
		IS 
			g_PI CONSTANT NUMBER:= 3.1415;
			PROCEDURE PROC_CALC(X NUMBER);
			FUNCTION F_CALC(X IN NUMBER, Y OUT NUMBER);
		END PCK_1;
		
	Sobrecarga OVERLOAD
		Mesma procedure com mesmo nome e com assinaturas diferentes.
		Quanto temos procedures com 2 assinaturas, com 1 e 2 parametros.
		Quando recebe 1 parametro ela executa de uma forma e com 2 parametro executa de forma diferente.

		CREATE OR REPLACE PACKAGE PCK_2
		IS 
			g_PI NUMBER := 3.1415;
			PROCEDURE PROC_CALC(X NUMBER);
			PROCEDURE PROC_CALC(X NUMBER, Y NUMBER);
			
			FUNCTION F_CALC(X IN NUMBER);
			FUNCTION F_CALC(X IN NUMBER, Y OUT NUMBER);
		
		END PCK_2;
		
	PACKAGE BODY
		Contém a definição dos programas
		Recebe a implementação e a lógica da regra de negocio
		Pode possuir variaveis privadas
		Requer a especificação
		Pode inicializar as variaveis do pacote.
		
		
		
		CREATE [OR REPLACE] PACKAGE BODY <NOME>
		IS | AS
			<tipos_privados>
			<variaveis_privados>
			<corpo dos subprograma>
		END <NOME>;
		
	CREATE OR REPLACE PACKAGE PCK_A
	IS	
		PROCEDURE PROC_CALC(x IN NUMBER);
	END PCK_A;
	
	
	CREATE OR REPLACE PACKAGE BODY PCK_A
	IS
		PROCEDURE PROC_CALC(X IN NUMBER)
		IS	
		BEGIN
			DBMS_OUTPUT.PUT_LINE('X: ' || TO_CHAR(X*2));
		END;
	END PCK_A;
	
	Execução
	BEGIN 
		PCK_A.PROC_CALC(10);
	END.
	
	
	
	CREATE OR REPLACE PACKAGE PCK_B
	IS	
		PROCEDURE PROC_CALC(x IN NUMBER);
		PROCEDURE PROC_CALC(x IN NUMBER, Y IN NUMBER);
	END PCK_B;
	
	CREATE OR REPLACE PACKAGE BODY PCK_B
	IS
		PROCEDURE PROC_CALC(X IN NUMBER)
		IS	
		BEGIN
			DBMS_OUTPUT.PUT_LINE('X: ' || TO_CHAR(X*2));
		END;
		
		PROCEDURE PROC_CALC(X IN NUMBER, Y IN NUMBER)
		IS	
		BEGIN
			DBMS_OUTPUT.PUT_LINE('X: ' || TO_CHAR(X*Y));
		END;
		
	END PCK_B;
	
	Execução
	BEGIN 
		PCK_B.PROC_CALC(10);
		PCK_B.PROC_CALC(10,8);
	END.
	
	
	CREATE OR REPLACE PACKAGE PCK_C
	IS	
		s_value NUMBER;
	END PCK_C;
	
	CREATE OR REPLACE PACKAGE BODY PCK_C
	AS
	BEGIN
		SELECT SALARY INTO s_value 
		FROM EMPLOYEES WHERE EMPLOYEE_ID = 176;
	END PCK_C;
	
	Execução
	BEGIN 
		DBMS_OUTPUT.PUT_LINE('SALARY: ' || TO_CHAR(PCK_C.s_value));
		
	END.
		
	
		
		
		
		
		
		
		
		

