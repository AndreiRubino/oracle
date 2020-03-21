Trabalhando com a instacia Oracle
	Processo de inicialização (startup) do Oracle faz a leitura de valores de parâmetros gravados em arquivos de inicialização
	Arquivos estáticos: PFILE (init.ora) //utilizados em versões mais antigas do oracle e podem ser editadas por editor de arquivos
	Arquivos persistentes: SPFILE (spfile<sid>.ora) //utilizados em versões mais novas do oracle, arquivos binarios.
	Geralmente são armazenados em $ORACLE_HOME/DBS
	
Parametros
	Para visualizar os parametros utilizar a view
	Select * from v$system_parameter;
	parametros importanter
	db_name, control_file, background_dump_dest, user_dump_dest
	
Inicialização
	Modos de operação da instacia especificada durante o STARTUP
	SHUTDONW: Desativado, sem acesso e sem alocação de memoria. 
	NOMOUNT: Instancia iniciada mas sem acesso ao BD. Comum para fazer configurações em arquivos de dados ou manutenção.
	MOUNT: Instancia iniciada e acesso apenas a arquivos de controle(control files) sem acesso as tabelas e metadados etc.
	OPEN: Todos arquivos estão abertos e podem ser manipulados.
	
	Para iniciar o banco de dados abra o sqlplus como sysdba
	$ STARTUP
	$ STARTUP [FORCE][RESTRICT][PFILE=filename][OPENRECOVER][database]MOUNT|NOMOUNT]
	FORCE: Aborta a instancia atual antes de inicializar
	RESTRICT: Inicializa e libera acesso apenas para usuarios que possuem privilegios 'RESTRICTED SESSION'
	RECOVER: Inicializa e tenta fazer a recuperação da midia(arquivos) durante o processo
	
	Nota: Muito cuidade com o comando STARTUP
	Nota: Dependendo do banco(tamanho) pode ser que inicialização demore muito
	Nota: Sempre esteja ciente do status do banco.

Alterando Status do Banco
	ALTER DATASE orcl MOUNT;
	ALTER DATASE orcl OPEN READ ONLY;
	
Mudar configurações do sistema com o Alter System.
	ALTER SYSTEM ENABLE|DISABLE RESTRICTED SESSION;
	
	Nota: Sempre esteja ciente do status do banco.
	Nota: Muito cuidado com alterações do estado do banco realizadas com ALTER SYSTEM.
	
Sessões
	Após o STARTUP diversos processos internos do Oracle são inicializados
	Algumas sessões internas são associadas aos processos internos
	Verificar sessões:
		SELECT * FROM V$SESSION;
	A coluna SID identifica a sessão
	É possivel finalizar a sessão em casos extremos com o comando:	
	ALTER SYSTEM KILL '12,22';
	
	Nota: Muito cuidado ao mata sessão, pois dados podem ser perdidos.
	
Finalizando a instancia
	Comando SHUTDOWN possui 4 modos:
	SHUTDOWN NORMAL;
		Não permite mais conexões
		Espera pelo fim das sessões
		Espera pelo fim das transações
		Força um checkpoint e fecha os arquivos
		Não requer recuperação da instancia na proxima inicialização
	
	Nota: é preciso ter as devidas permissões, para teste faça a conexão via sqlplus como sys as sysdba
	
	SHUTDONW TRANSACTIONAL;
		Não permite mais conexões
		Não Espera pelo fim das sessões
		Espera pelo fim das transações
		Força um checkpoint e fecha os arquivos
		Não requer recuperação da instancia na proxima inicialização	

	SHUTDONW IMMEDIATE;
		Não permite mais conexões
		Não Espera pelo fim das sessões
		Não Espera pelo fim das transações
		Força um checkpoint e fecha os arquivos
		Não requer recuperação da instancia na proxima inicialização	

	SHUTDONW ABORT;
		Não permite mais conexões
		Não Espera pelo fim das sessões
		Não Espera pelo fim das transações
		Não Força um checkpoint e fecha os arquivos
		Não requer recuperação da instancia na proxima inicialização		
	
	Nota: Muito cuidado com o SHUTDONW ABORT pois sua instancia pode não subir na proxima inicializados.
	
Logs Importantes
	O oracle possui alguns logs importantes a serem examinados em diversas situações
	
	Alert log: informações gerais sobre o Oracle	
		Arquivo alert<sid>.log
		Local: veja o paramero BACKGROUND_DUMP_DEST
		Exemplo: /ora_place/product/12.1.0/dbhome_1/rdbms/log
		
	Views importantes sobre instancia do Oracle
	SELECT * FROM V$LOGFILE;
	SELECT * FROM V$INSTANCE;
	SELECT * FROM V$SESSION;
	SELECT * FROM V$SYSTEM_PARAMETER;


	
	
	
	
	
	
	
	
	
	
	
	
	