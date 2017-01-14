CREATE TABLE [dbo].[TabTable] (
    [Recnum]      BIGINT       IDENTITY (1, 1) NOT NULL,
    [TableName]   VARCHAR (25) CONSTRAINT [DF__TabTable__TableN__0922BCB4] DEFAULT (' ') NOT NULL,
    [InitialOnly] VARCHAR (1)  NULL,
    CONSTRAINT [TabTable_INDEX01] PRIMARY KEY CLUSTERED ([TableName] ASC)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [TabTable_INDEX00]
    ON [dbo].[TabTable]([Recnum] ASC);

