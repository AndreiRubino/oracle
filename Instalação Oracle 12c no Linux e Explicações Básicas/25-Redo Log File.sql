--REDO LOG FILE
 
Gerenciando os Redo Log Files 
	• Arquivos de redo log gravam todas as modificações feitas nos dados 
	• Eles são utilizados no processo de recovery do banco 
	• São arquivos binários gerenciados pelo Oracle
	• Dois tipos: 
		• Online redo log: usado pelo banco em execução
		• Archived redo log: arquivos de redo log cheios e separados
	• Redo log files são organizados em grupos. Cada arquivo dentro do grupo é chamado de membro
	• Cada grupo de log deve possuir o mesmo número de membros com o mesmo tamanho
	• Recomenda-se colocar arquivos de um mesmo grupo de log em HDs diferentes para evitar ponto de falha
	
Grupos de Redo Log Files - Exemplo
	• View V$LOGFILE mostra informações
	• Comando CREATE DATABASE contém detalhamento dos grupos e membros iniciais (createdb.sql)

Grupos de Redo Log Files – Preenchimento 
	• O processo do Oracle LOGWr grava o mesmo dado em todos os membros do grupo
	• Deste modo todos os membros de um mesmo grupo de redo log são cópias idênticas 
	• Os Redo log são usados de maneira cíclica: encheu um arquivo, pula para o próximo grupo 
	• Acabou os arquivos? Volta para o primeiro grupo, limpa ele e começa a gravar novamente

Grupos de Redo Log Files – Checkpoint e Log Switch 
	• Dois conceitos muito importantes sobre o redo log: checkpoint e log switch
	• Checkpoint: escreve o buffer dados nos arquivos de log • Operação realizada pelo processo DBWn • Ocorre periodicamente e de forma automática • Pode gerar um log switch • Pode ser forçado com o comando ALTER SYSTEM CHECKPOINT;
	• Log Switch: ocorre quando todos os arquivos de um grupo de log estão cheios • Operação realizada pelo processo LGWr • Implica em apenas um grupo de log ativo no momento • Os outros grupos de log ficam em espera (iddle) • Pode ser forçado pelo comando ALTER SYSTEM SWITCH LOGFILE;

Gerenciando grupos de log e membros 
	• Para visualizar os grupos e arquivos de log: SELECT GROUP#, MEMBER FROM V$LOGFILE; SELECT * FROM V$LOG 
	• Para adicionar um novo grupo de log: ALTER DATABASE ADD LOGFILE GROUP 4 ('/ora_place/oradata/orcl/l4.log') SIZE 15M; 
	• Para incluir um novo membro no grupo: ALTER DATABASE ADD LOGFILE MEMBER '/ora_place/oradata/orcl/lD.log' TO GROUP 4;
	• Para remover um membro de um grupo existente: ALTER DATABASE DROP LOGFILE MEMBER '/ora_place/oradata/orcl/l_X.log'; 
	• O arquivo removido não pode estar no grupo de log atual • O arquivo não é removido do sistema operacional 
	• Para remover um grupo existente: ALTER DATABASE DROP LOGFILE GROUP 4;
	
Archived Redo Log Files 
	• Archived redo log files são arquivos de log já preenchido e separados dos arquivos de log usados pelo banco 
	• Utilizados para processo de recuperação de banco de dados e também backup/restore 
	• Esta separação é feita automaticamente se o banco estiver no modo archivedlog 
	• Por padrão o banco NÃO está no modo achivedlog, i.e. os logs são gravados de forma cíclica nos arquivos e não há arquivamento de redo log files cheios 
	• Para verificar o estado do banco veja o parâmetro de inicialização LOG_ARCHIVE_START: 
		• Se for TRUE: a cada log switch gera um archived redo log 
		• Se for FALSE: banco NÃO está no modo archivedlog e é preciso fazer o arquivamento de forma manual
	•	 View V$INSTANCE também mostra o status de archivelog