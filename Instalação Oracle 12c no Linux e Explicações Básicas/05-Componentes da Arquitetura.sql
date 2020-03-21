Componentes da Arquitetura

Um servidor Oracle é composto de:
	Uma instância do Oracle e um BD Oracle dentro dessa instância
	
Uma instância define como acessar um banco de dados
	Abre apenas um banco de dados
	É composta de estrutura de memórias e processos
	Contém o SGA System Global Area e processos de background
	
Importante
	Oracle standalone/single instance - somente uma instancia
	Oracle cluster - mais de uma instância
	
Diagrama
	SGA -> estrutura de memoria que aloca uma quantidade da memoria quando a 
	instância é inicializada
	
	PGA -> estrutura de memoria que aloca quando o processo do 
	servidor é inicializado para uma conexão cliente (varia o consumo devido
	a entrada e saida de conexões)
	
Comando para ver alocação do SGA
	SQL Developer
	show sga;
	
Areas de Memoria
	* cache do oracle e não da máquina
	Database buffer cache: armazena o resultado de consultas no cache
	Redo log buffer cache: guarda os dados de log de REDO no cache
	Library cache: armazena as instruções SQL, código fonte de procedures no cache 
	Data dictionary cache: armazena metados no cache
	
Conexões
	Dois tipos basicos de conexões cliente ao Oracle
	Dedicated server conection
		Um processo cliente para um processo no servidor
	
	Shared server connection
		Multiplos processos do servidor responder a processos de clientes
		Mais de um processo cliente compartilha um mesmo processo no servidor
		
Arquivos do Banco de Dados
	Três tipos principais de arquivos binários de um BD Oracle
		Arquivos de dados (datafiles.dbf)
		Arquivos de controle (controlfiles.ctl) -> armazena informações como estado do banco local e 
		dos arquivos de dados, etc.
		Redo Log (.log) -> armazena os dados associados ao log de transação para processos de transação e rollback
	
No nosso exemplo estão todos em
	/ora_place/oradata/orcl
	ou
	$ORACLE_BASE/oradata/$ORACLE_SID
	
Principais processo interno do servidor Oracle
	DBWn - Database Writer: Escreve os dados do database buffer cache para os arquivos de dados (datafiles)
	LWGR - Log Writer: Escreve as entradas do Redo Log buffer para os arquivos redo log
	SMON - System Monitor: Faz o roll foward, rollback e abre o banco de dados
	PMON - Process Monitor: Faz a "limpeza" após os processos e transações falharem
	CKPR - Checkpoint: Controla quando e como o checkpoint acontece. Escreve dados nos arquivos de controle (.ctl)
	
Estruturas de armazenamento
	Dados no Oracle são organizados em estruturas de memoria importante
	Existe uma hierarquia:
		BLOCK->EXTENT->SEGMENT->TABLESPACE->DATABASE
	
	