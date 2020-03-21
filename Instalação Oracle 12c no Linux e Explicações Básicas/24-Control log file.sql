--CONTROL LOG FILE
 
	Arquivos de controle (control log files) definem o estado atual de um banco Oracle 
	• Eles são necessários para o correto funcionamento do banco 
	• Podem ser criados com o comando CREATE CONTROL FILE ou no momento da criação do banco com o CREATE DATABASE
	• Arquivo binário lidos no momento que o banco de dados inicia (mount state) 
	• Gerenciados pelo Oracle automaticamente 
	• O que é gravado no arquivo de controle: 
	• O nome do banco e suas propriedades 
	• Informações de tablespaces 
	• Nomes e localizações de arquivos de dados e de redo log 
	• Informações de checkpoint 
	• Informações de backup

	• Caso os arquivos de controle sejam comprometidos é possível restaurar o banco com uma cópia do arquivo de controle 
	• Para ver quais são os arquivos e onde estão os arquivos de controle veja o valor do parâmetro control_files (comando SHOW PARAMETERS)
	
	• Utilize a view V$PARAMETER ou V$CONTROLFILE:
		SELECT name, value FROM V$PARAMETER where name = 'control_files';
		SELECT * FROM V$CONTROLFILE; 
	• No banco de exemplo orcl: 
		• /ora_place/oradata/orcl/control01.ctl 
		• /ora_place/fast_recovery_area/orcl/control02.ctl
	• Nota: extensão de arquivo .ctl é padrão, mas não obrigatória

--	MULTIPLEXAÇÃO 
	
	• Multiplexar significa ter mais de uma cópia do arquivo de controle 
	• Cada cópia possui o mesmo conteúdo e qualquer uma pode ser utilizada para restaurar o banco de dados
	• Recomenda-se separar os arquivos de controle em discos diferentes para evitar único ponto de falha
	• Importante: para restaurar um banco do Oracle é preciso ter o arquivo de controle e outros (dados, redo log, etc)
	• Para adicionar um novo arquivo de controle a um banco de dados é preciso alterar os parâmetros de inicialização no banco 
		• Arquivo .ORA 
		• ALTER SYSTEM para o caso de SPFILE
	• Limite de 8 arquivos de controle por banco 
	
--	BACKUP DO ARQUIVO DE CONTROLE 
	
	• Não é possível copiar o arquivo de controle pelo sistema operacional com o banco de dados Oracle online
	• Para fazer um backup do arquivo de controle sem fazer um shutdown no banco use o comando ALTER DATABASE BACKUP. 
		Exemplo: ALTER DATABASE BACKUP CONTROLFILE  TO '$ORACLE_HOME/bck01.ctl'
	• Dica: tenha uma estratégia para backup do arquivo de controle independente do backup dos dados!
	• Dica: um backup é tão importante quanto sua habilidade para restaurá-lo. Portanto, 
	teste em outro ambiente como restaurar o banco a partir dos arquivos de backup!
