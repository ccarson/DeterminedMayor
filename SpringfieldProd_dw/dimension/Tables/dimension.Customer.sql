CREATE TABLE dimension.Customer(
    CustomerKey         BIGINT          NOT NULL
        IDENTITY
        CONSTRAINT pk_Customer 
            PRIMARY KEY CLUSTERED
  , CustomerID          VARCHAR (10)	NOT NULL
  , CustomerName        VARCHAR (36)	NOT NULL
  , DWTimestamp         DATETIME        NOT NULL
        CONSTRAINT df_Customer_DWTimestamp 
            DEFAULT GETDATE()
);
GO


