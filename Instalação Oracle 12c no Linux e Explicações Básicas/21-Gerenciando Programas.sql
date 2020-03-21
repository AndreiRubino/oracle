Gerenciando Programas
	Subprogrmas(procedures e funtion) 
	Recomendações gerais
		Utilizar formatador para facilitar a visualização do código
		Siga regras de nomenclatura (www.sqlstyle.guide)
		
	Tabela USER_OBJECTS lista todos objetos.
		SELECT * FROM USER_OBJECTS;
		
		SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE IN('PROCEDURE','FUNCTION')
		ORDER BY OBJECT_NAME;
		
		
	Tabela USER_SOURCE lista o código fonte dos objetos
		SELECT * FROM USER_SOURCE;
		SELECT TEXT FROM USER_SOURCE WHERE NAME = 'SECURE_DML';
		
	Lidando com Erros
		SELECT * FROM USER_ERROS;
	
DEBUG NO SQL DEVELOPER
	SQLDEVELOPER possui recursos para fazer o debug interativo de subprogramas
		Parametros
		Breackpoints
		Step into, step over
		Watches
		
	Passo a Passo
		Escolha a procedure na janela de conexões e clique com o botão direito e escolha "Compile for debug/Compilar para depurar"
		Clique com o botão direito e escolha "Debug"
		Confira os parametros e clique em Ok
		
	