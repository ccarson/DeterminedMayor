CREATE TABLE dbo._partsFINQuantityChanges
(
	ID				int				NOT NULL	IDENTITY	PRIMARY KEY CLUSTERED 
  , ChangeDate     	datetime       	NOT NULL
  , SPRNUM         	varchar(20)   	NOT NULL
  , OldFINQuantity 	decimal(10)   	NOT NULL
  , NewFINQuantity 	decimal(10)   	NOT NULL
  , ChangeUser     	nvarchar(128) 
  , ChangeSession  	nvarchar(128) 
  , ChangeSource   	nvarchar(128) 
)
;
GO

CREATE NONCLUSTERED INDEX IX__partsFINQuantityChanges
	ON dbo._partsFINQuantityChanges
		( ChangeDate ASC, ChangeUser ASC, ChangeSession ASC, ChangeSource ASC )
		INCLUDE( SPRNUM, OldFINQuantity, NewFINQuantity )
;
GO



