Constraints
	São Objetos do BD que restringem dados nas colunas
	Utilizada para garantir a intergridade dos dados
	Geralmente criamos as constrainst durante a criação da tabela
	mas é possível inseri-las depois da criação.
	A verificação da constrainst é feita na inserção INSERT
	alteração UPDATE e remoção DELETE de linhas
	A modelagem é muito importante para ajudar a definicr as constrainst,
	especialmente a chave primaria PK e a chave estrangeira FK;
	Constraints possuem nome gerados automaticamentes ou fornecidos durante a criação
	Veremos as Constraints NULL/NOT NULL, Unique, Primary Key, Foreign Key e Check
	
	Constraints NOT NULL / NULL
	
	CONSTRAINT CHECK
	Utilizada para garantir que a coluna irá receber apenas valores pré selecionados,
	ou valores válidos. Ex: Maior ou menor que algum número, 'M' ou 'F' para sexo.
		
	CREATE TABLE CUSTOMERS
	(
		ID_CUSTOMERS 	INT,
		NAME 			VARCHAR2(50),
		IDADE			INT NOT NULL CHECK(IDADE>0),
		LOCATION_ID		INT,
		CONSTRAINT PK_CUSTOMERS PRIMARY KEY(ID_CUSTOMERS),
		CONSTRAINT FK_CUSTOMERS_LOCATION FOREIGN KEY(LOCATION_ID)
		REFERENCES LOCATIONS(LOCATION_ID)
	);
	
Alterando Constraints
	ALTER TABLE <tabela> ADD 
	DROP CONSTRAINT <nome constrainst>
	
	Desabilitar e Habilitar Constraints PK e FK
	Geralmente são utilizados para inserção de grande volumes de dados.
	ALTER TABLE <tabela> DISABLE CONSTRAINT <nome constrainst>
	ALTER TABLE <tabela> ENABLE CONSTRAINT <nome constrainst>