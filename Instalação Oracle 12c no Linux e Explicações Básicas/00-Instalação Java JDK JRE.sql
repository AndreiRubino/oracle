Instalação Java JRE
Logar como root, criar diretorio java na pasta opt 
	$ su root 
	# mkdir /opt/java 
	# cd /home/user/Downloads
	# mv jre-8u73-linux-x64.tar.gz /opt/java
	# tar zxvf jre-8u73-linux-x64.tar.gz
	
Criar link simbolico da pasta e configurar o PATH
	# ln -s jre.1.8.0_211 jre 
	# gedit /etc/profile 
	
Adicione no início do arquivo: 
	export JAVA_HOME="/opt/java/jdk"
	export CLASSPATH="$JAVA_HOME/lib":$CLASSPATH
	export PATH="$JAVA_HOME/bin":$PATH
	export MANPATH="$JAVA_HOME/man":$MANPATH
	:wq
	
Criar os links simbólicos dos comandos da JDK dentro da pasta /usr/local/bin: 
	# ln -s /opt/java/jdk/bin/java /usr/local/bin/
	# ln -s /opt/java/jdk/bin/javac /usr/local/bin/ 

Pronto. Agora digite no seu terminal: 

 java -version 

Se aparecer a versão do Java que você acabou de configurar, está certo. ;~) 