Criando e Gerenciando Tabelas
	CREATE = Criar tabelas
	ALTER = Alterar tabelas
	DROP = Deletar tabelas
	
	Nota: A criação das tabelas de BD deve vir após a modelagem.
	Algumas ferramentas após a modelagem gera um script para criação das tabelas.
	
	CREATE <nome_tabela>
	(
		<nome_coluna> <tipo_dados> [DETALHES],
		<nome_coluna> <tipo_dados> [DETALHES]
	);
	
	Tipos de Dados
	VARCHAR2() : caracteres (string)
	INT : números inteiros
	NUMBER: números com precisão decimal
	DATE : data e hora
	LONG: conjunto de caracteres de até 2GB
	BLOBL: dados binários
	
	ALTER TABLE [ADD | MODIFY | DROP] <coluna>;
	ALTER TABLE EMPLOYEES MODIFY (SALARY NUMBER);
	ALTER TABLE EMPLOYEES DROP (SALARY);
	
Renomeando Tabelas	
	RENAME EMPLOYEES TO EMPLOYEES_NEW;

Remover tabela
	DROP TABLE <tabela>;
	DROP TABLE EMPLOYEES;
	
Apagar todos os dados da tabela
	TRUNCATE TABLE EMPLOYEES_NEW;