Tarefas após a instalação do Oracle
Verificar logs para ver se tem algum erro
	# cd /oracle-place/logs
	# nautilus
	
Checar processos que começam com ORA 
	$ ps - A | grep ora 
	
Configurar variaveis de ambiente do usuário Oracle
ORACLE_BASE=/u01
ORACLE_HOME=$ORACLE_BASE/product/12.2.0/dbhome_1
ORACLE_SID=orcl
	
Acessar via usuário oracle-place
$ su - oracle 
$ gedit .bash_profile

adicionar a variavel PATH  :/u01/product/12.2.0/dbhome_1/bin

Configurar as Variaveis de ambiente .bash_profile	
DISPLAY=:0.0
ORACLE_BASE=/u01
ORACLE_HOME=$ORACLE_BASE/oracle/product/12.2.0/dbhome_1
ORACLE_SID=XE
ORACLE_UNQNAME=XE
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$ORACLE_HOME/bin
	
export DISPLAY 
export ORACLE_BASE
export ORACLE_HOME
export ORACLE_SID
export ORACLE_UNQNAME
export PATH

Abrir SQLPLUS
	$ sqlplus
	$ system
	$ digitar_sua_senha definida na instalação
	
	Caso seja conectado com sucesso a instalação foi concluida com sucesso sem erros.
	Executar os comandos abaixo
	
/u01/oracle/product/12.2.0/dbhome_1/bin/emctl stop dbconsole
/u01/oracle/product/12.2.0/dbhome_1/bin/emctl config emkey -repos -sysman_pwd digitar_sua_senha
/u01/oracle/product/12.2.0/dbhome_1/bin/emctl secure dbconsole -sysman_pwd digitar_sua_senha
/u01/oracle/product/12.2.0/dbhome_1/bin/emctl start dbconsole
/u01/oracle/product/12.2.0/dbhome_1/bin/emctl config emkey -remove_from_repos -sysman_pwd digitar_sua_senha



