Criando um banco de dados
	O instalador do oracle já criou um BD de exemplo
	Para visualizar os arquivos de dados, control e redo log utilize as vies:
	SELECT * FROM V$LOGFILE;
	SELECT * FROM V$CONTROLFILE;
	SELECT * FROM V$DATAFILE;

Criando um novo banco de dados com o usuário oracle do linux.
	Obs: que já tem as variaveis de ambiente criadas no s.oracle	
	Uma instancia do Oracle é associada a apenas um banco de dados por vez. padrão (orcl)
	8 Passos
		- Verifique a autenticação dos arquivos de senha ou participação em grupo do SO e permissões em pastas.
		- Finalize a instancia atual com o comando SHUTDOWN
		- Configure as variaveis de ambiente para o usuario do SO ($ORACLE_PLACE,$ORACLE_HOME, $ORACLE_SID E $PATH)
		- Edite ou crie o arquivo com os parametros PFILE ou SPFILE
		- Inicializar a instancia no modo NOMOUNT
		- Crie o banco com o script CREATE DATABASE
		- Verifique o conteúdo do banco
		- Crie o dicionario de dados tabelas e procs
		
	$ su - oracle
	$ id oracle
	$ sqlplus sys as sysdba@orcl
	$ shutdown
	Alterar SID para novo banco
	$ gedit .bash_profile
		export ORACLE_SID=ORATEST
	
Criar arquivo initORATEST.ora em $ORACLE_HOME/dbs com os dados 
control_files= (ora_control03, ora_control04)
	undo-management= auto
	db_name = ORATEST
	db_block_size = 8192
	undo_tablespace='undotbs'
	diagnostic_dest=/ora_place/product/12.1.0/dbhome_1/rdbms/log
	
Conectar no sqlplus e inicialize a instancia no modo NOMOUNT
	$ sqlplus /NOLOG 
	$ connect / as sysdba
	$ startup NOMOUNT;
	
Criar Banco de Dados
	> @createdb.sql
	$ CREATE DATABASE ORATEST 
	






	
	
	
	
		