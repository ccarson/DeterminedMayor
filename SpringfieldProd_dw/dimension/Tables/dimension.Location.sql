CREATE TABLE dimension.Location (
    LocationKey BIGINT          NOT NULL
        IDENTITY 
        CONSTRAINT pk_Location 
			PRIMARY KEY CLUSTERED
  , City        VARCHAR (30)    NOT NULL
  , StateName   VARCHAR (02)    NOT NULL
  , Country     VARCHAR (02)    NOT NULL
  , DWTimestamp DATETIME        NOT NULL 
        CONSTRAINT df_Location_DWTimestamp 
			DEFAULT GETDATE()
);

