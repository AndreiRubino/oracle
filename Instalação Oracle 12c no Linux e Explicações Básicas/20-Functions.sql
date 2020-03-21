FUNCTIONS
	Parecidas com Stored Procedures
	Diferenças
		São Obrigadas a retornar valores
		Somente aceitam parametros IN
		Podem ser utilizadas em clausulas SQL where, order by, group by, etc.
		Restrições a alguns comando SQL
			Cancelar Transações, Alter system etc.
		Não aceia comandos DML, CREATE, ALTER, DELETE.
			
	Geralmente para calcular alguma expressão ou fazer manipulação de valores simples.
	Regras de negocios complexas são colocadas em procedures
	
	
	Procedure
		Executada como uma instrução do PL/SQL
		Parametros IN,OUT e IN OUT
		0, 1 ou mais valores de retorno
		Sem restriçoes SQL
		
	Function
		Chamada como parte de uma isntrução
		Parametros IN
		Obrigatorio retornar 1 valor
		Alagumas restriçoes SQL
	
	CREATE [OR REPLACE] FUNCITON <name>
	[(parametro1 type1, parametro2 type])
	RETURN <datatype>
	IS
	BEGIN
	...
	EXCEPTION
	
		
	END <name>;
	
	CREATE [OR REPLACE] FUNCITON F_SALARY
	[(p_id in employees.employee_id%type])
	RETURN NUMBER
	IS
		v_sal employees.salary%type;
	BEGIN
		select salary into v_sal from employees where employee_id = p_id;
		return v_sal*1.1;
	EXCEPTION
				
	END F_SALARY;