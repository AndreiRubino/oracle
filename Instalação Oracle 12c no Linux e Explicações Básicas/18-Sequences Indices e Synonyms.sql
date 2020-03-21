SEQUENCES, INDICES E SYNONYMS
	Facilitam a manipulação de dados e otimizam o acesso
	
SEQUENCE
	
		CREATE SEQUENCES <NOME>
		INCREMENT BY<N>
		START WITH<N>
		MAXVALUES<N>
		MINVALUES<N>
		CYCLE | NOCYCLE
		;
		
	NEXTVAL: Próximo valor
	CURRVAL: Valor Atual
	
	CREATE SEQUENCE SEQ_CUSTOMERS
	INCREMENT BY 1
	START WITH 1
	MAXVALUES 9999999
	MINVALUES 1
	NOCYCLE;
		
	
	SELECT SEQ_CUSTOMERS.NEXTVAL FROM DUAL; --próximo valor
	SELECT SEQ_CUSTOMERS.CURRVAL FROM DUAL; --valor atual
	
	
INDEX 
	Objetos que duplicam a informação para tornar o acesso a leitura dos dados mais rápido
	Requerem espaço de armazenamento em disco
	Torna a inserção, remoção e alteração de dados mais lenta;
	Principal Objeto a ser estudado durante o tuning de banco de dados
	Constraints PK e FK criam indices automaticamente
	
	CREATE INDEX <nome> ON <tabela>(<coluna1>,<coluna2>...);
	
	
SYNONYM
	Sinonimos são apelidos para objetos feitos para simplificar nomes grandes de esquemas e objetos
	
	CREATE SYNONYM <nome> FOR <schema.obj>;
	
	CREATE SYNONYM DEP FOR HR.DEPARTMENTS;
	
	
	
	
	
	
	
	
	
	
	