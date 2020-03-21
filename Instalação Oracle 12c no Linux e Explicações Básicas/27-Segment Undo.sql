/*  
	SEGMENTOS DE UNDO
*/

• O segmento de UNDO é utilizado para armazenar dados quando há alguma modificação (DML ou transações) 
• O segmento de UNDO é associado à tablespace de UNDO 
• Seu propósito é fazer o rollback de transações, recuperação da base, fornecer consistência de leitura e prover dados para o Oracle Flashback
• Preenchimento cíclico

-- GERENCIANDO O SEGMENT UNDO 
• Dois tipos de segmentos de UNDO:
• System: usado para objetos da tablespace SYSTEM 
• Non-system: usado para os demais objetos 
• A principal tarefa do DBA em relação ao segmento de UNDO é garantir que ele não está cheio 
• Caso contrário, não haverá espaço para armazenar dados de UNDO e nenhuma transação poderá ser feita 
• O gerenciamento do segmento de UNDO é feito de forma automática ou manual 
• A forma automática é o padrão e extremamente recomendada 
• Cheque os parâmetros UNDO_MANAGEMENT e UNDO_TABLESPACE

	SELECT * FROM V$PARAMETER WHERE NAME like 'undo%'
	
	
-- TABLESPACE DE UNDO 

• A tablespace de UNDO é especificada na criação do banco de dados
• Como qualquer tablespace, é preciso associar arquivos de dados 
• Para criar manualmente uma tablespace de UNDO:
	CREATE UNDO TABLESPACE myundo DATAFILE '/ora_place/oradata/orcl/myundo01.dbf' SIZE 20M;
	
• Demais comandos idênticos a qualquer tablespace 
• Mais de uma tablespace de UNDO é permitida por banco, mas somente uma está ativa(online) por vez 
• Veja o parâmetros UNDO_TABLESPACE

SELECT * FROM V$PARAMETER WHERE NAME like 'undo%'


-- PROBLEMAS COM UNDO  
• Principal problema é a falta de espaço 
• Erros comuns:
	ORA-1555, snapshot too old => NO SPACE IN THE UNDO TABLESPACE 
	ORA-30036, unable to extend segment in undo tablespace => CANNOT GROW THE TABLESPACE 

• Recomendações gerais: 
	• Sempre utilize o auto gerencialmento de UNDO 
	• O tamanho da tablespace depende da quantidade de transações e do banco de dados 
	• Avalie opções de auto crescimento 
	• Faça transações curtas, i.e. que manipulam poucos dados por vez 
	• Garanta que a tablespace de UNDO esteja em um disco e pasta com espaço suficiente 
	• Não esqueça de documentar local, tamanho, nomes e outros detalhes do segmento de UNDO

--INFORMAÇÕES SOBRE O UNDO 
• Principais consultas para obter informações sobre o UNDO:

	SELECT segment_name,owner,tablespace_name,status FROM dba_rollback_segs;
	SELECT * FROM DBA_ROLLBACK_SEGS;
	SELECT * FROM V$ROLLNAME;
	SELECT * FROM V$ROLLSTAT;
	SELECT * FROM V$UNDOSTAT;
	SELECT * FROM V$SESSION;
	SELECT * FROM V$TRANSACTION;