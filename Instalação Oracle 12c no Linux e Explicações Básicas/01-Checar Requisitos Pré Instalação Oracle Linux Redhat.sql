/*=================================================================*/
/* Instalação Oracle12c em Linux Redhat-Checar Requisitos Minimos  */
/*=================================================================*/

1 passo Após Instalação do S.O
#sudo yum update;
	

Espaço em disco: minimo 6.4gb
$ df -h
Espaço em disco para o tmp: minimo 1.0gb
df –h /tmp

Mémoria: minimo 1GB
$ grep MemTotal /proc/meminfo

Kernel: 2.6+ e x86_64
$ uname -a

Requisitos especificos do SO: ssh
$ ssh localhost

Pacotes
$ rpm -qa <nome_pacote>
$ rpm -qa | grep glib

Parâmetros do Kernel
$ sysctl -a

Verificar Valores minimos na documentação.
$ sysctl -a | grep shm

Limite de recursos da instalação
$ ulimit -Sn --1024
$ ulimit -Hn --4096

Alterar os limites modificando o arquivo
/etc/security/limits.conf (como root)
	cd /etc/security/
	gedit sudoedit limits.conf
	
Adicionar as duas linhas ao arquivo e salvar
oracle soft nofile 65536
oracle hard nofile 100000
oracle soft stack 10240
oracle hard stack 32768