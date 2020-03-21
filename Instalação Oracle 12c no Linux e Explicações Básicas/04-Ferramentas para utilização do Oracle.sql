Ferramentas para utilização do Oracle

	Mais utilizadaas
	SQL PLUS: ferramente de console e acesso remoto com ssh
	SQL Developer: ferramenta GUI amigavel para trabalhar com consultas
	RMAN: ferramenta para backup
	
	Comandos de texto simples: vi, gedit, etc
	
SQL PLUS	
	Requer a configuração das variaveis de ambiente $ORACLE_SID e $ORACLE_HOME
	Utilizado mais para trabalho SSH
	
	Parametros de conexão
	$ sqlplus system@orcl
	
Entrar no site Oracle e fazer o Donwload do SQL Developer versão Linux RPM
	$ su - oracle
	$ sudo yum remove java
	 wget --no-check-certificate --no-cookies --header
	 "Cookie: oraclelicense=accept-securebackup-cookie"
	 "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz" 
	 
	$ cd Downloads
	$ mv sqldeveloper-4.1.3.20.78.noarch.rpm /home/oracle
	$ sudo rpm -Uhv sqldeveloper-4.1.3.20.78.noarch.rpm     //ou executar como root
	$ cd usr/local/bin
	$ ./sqldeveloper
	Idicar local do JDK padrão para primeira vez de abertura.
	$ /usr/java/jdk1.8.0..
	
Iniciar o Banco de Dados
	$ sqlplus / as sysdba
	$ lsnrctl start
	$ startup
	
Após isso é só criar um nova conexão com o SQL Developer
	
	 wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz" 
	 
	