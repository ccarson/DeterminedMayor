CREATE TABLE stage.LastChangeVersion(
    ID					INT		NOT NULL
		CONSTRAINT pk_LastChangeVersion PRIMARY KEY CLUSTERED 	
  , SourceTableName     sysname NOT NULL
  , SourceTableSchema   sysname	NOT NULL
  , LastChangeVersionID BIGINT
  , CurrentStageVersion	BIGINT
);

