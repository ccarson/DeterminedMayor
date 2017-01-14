CREATE TABLE [dbo].[Tablet] (
    [RecNum]         BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (50)  NOT NULL,
    [ModelNum]       VARCHAR (50)  NULL,
    [SerialNum]      VARCHAR (50)  NULL,
    [LastShowOrdNum] INT           NULL,
    [CheckedOutOn]   DATETIME2 (0) NULL,
    [CheckedOutBy]   VARCHAR (4)   NULL,
    [CheckedInOn]    DATETIME2 (0) NULL,
    [WebServicePwd]  VARCHAR (20)  NULL,
    [LastUpdated]    DATETIME2 (3) NULL,
    CONSTRAINT [Tablet_INDEX01] PRIMARY KEY CLUSTERED ([Name] ASC)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [Tablet_INDEX00]
    ON [dbo].[Tablet]([RecNum] ASC);

