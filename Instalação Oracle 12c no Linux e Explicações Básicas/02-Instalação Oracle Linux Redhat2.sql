/*=================================================================*/
/* Instalação Oracle12c em Linux Redhat                            */
/*=================================================================*/


Acertando a permissão do xhost (como root): -- FAZER ISSO COM O USUÁRIO QUE LOGOU NO S.O
	xhost +

Usuários e grupos que são necessários para administrar e gerenciar o ambiente, realizar a instalação,e manutenção.
Qualquer acesso ao Oracle deve ser realizado apenas e somente por estes usuários e grupos, ou seja, outros usuários 
não devem ter acesso para fazer qualquer alteração.
Os seguintes grupos e usuários devem ser criados no Sistema Operacional:

	oinstall: Oracle Inventory;
	dba: Grupo DBA do sistema operacional;
	oracle: O usuário que será utilizado para instalar o binário do banco.

Criação de grupos e usuários do Oracle (como root):
	# xhost +
	# groupadd oinstall	
	# groupadd dba

Confirmando se foram criados

	# grep oinstall /etc/group
	# grep dba /etc/group

Adicionando usuário oracle ao grupo oinstall e dba
	# adduser -g oinstall -G dba oracle
	
Setando a senha
	# passwd oracle
	digitar senha

Confirmando ID:
	# id oracle
	
Criação de pasta para a instalação (como root)
	# cd /
	# mkdir -p /ora_place
	# chown -R oracle:oinstall /dev/mapper/ol-u01
	  chown -R oracle:oinstall /01
	  
	  
	# chmod -R 775 /ora_place
	
	# chown -R oracle:oinstall /dev/mapper/ol-u01
	# chown -R 775 /u01
	  chown -R 775 /u01
	
	
	mkdir -p /u01
	mkdir -p /u02
	chown -R oracle:oinstall /u01
	chown -R oracle:oinstall /u02
	chmod -R 775 /u01
	chmod -R 775 /u02
Confirmando
	# ls -la
	
Checar configurações do usuário	oracle	
	$ su - oracle
	$ umask        //deve retornar 0022 ( 022 = proibindo a permissão de escrita para o grupo e outros).
	
Alterar valor variável DISPLAY no arquivo .bash_profile
	$ su - oracle
	$ cd /etc/profile
	$ vi .bash_profile
	
	após o if
	DISPLAY=:0.0
	export DISPLAY/
	
	:wq            // para salvar
Verificar se a variável de ambiente DISPLAY está inicializando com o valor 0.0
	$ exit
	$ su - oracle
	$ echo $DISPLAY     //deve retornar 0.0
	
	obs: instalação remota requer outros detalhes
	
	$env | more  //verificar se retorna alguma variavel de ambiente com ORA (não deve haver nenhuma).
	
Criar pasta chamada oracle_install como usuario oracle e copiar os arquivos
	$ su - oracle
	$ mkdir oracle_install
	# su - root
	# cd /home/oracle/oracle_install
	# cp /home/student/Downloads/linuxamd64_12102_database_1of2.zip
	# cp /home/student/Downloads/linuxamd64_12102_database_2of2.zip
	
	
Alterar o dono do arquivo database.zip para o usuario oracle
	# su - root
	# chown oracle linuxamd64_12102_database_1of2.  //chown altera o dono do arquivo para o usuario desejado
	# chown oracle linuxamd64_12102_database_1of2.
	# su - oracle
	$ cd /home/oracle/oracle_install
	$ unzip  linuxx64_12201_database.zip
	$ ls -la // deve haver a pasta database
	
Instalação com OUI Oracle Universal Installer
	Abrir novo terminal com usuário oracle
	$ xhost +
	$ cd database
	$ ./runInstaller
	
	Configurar host do arquivo LISTENER, 
	# cd /ora_place/product/network/admin/
	 cd /u01/product/12.2.0/dbhome_1/network/admin/
	# gedit listener.ora
	 HOST = localhost
	
	Obs: é preciso ter o Java JRE Instalado
		é necessário acesso a interface gráfica
		Sigar os passos via interface grafica
		
	