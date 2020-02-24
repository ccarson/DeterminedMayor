CREATE TABLE [dbo].[RprCodes] (
    [Recnum]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [Code]        DECIMAL (6)   DEFAULT ((0)) NOT NULL,
    [Description] VARCHAR (100) DEFAULT (' ') NOT NULL,
    [Status]      CHAR (1)      DEFAULT ('A') NOT NULL
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [RprCodes_INDEX00]
    ON [dbo].[RprCodes]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO



GO
CREATE UNIQUE NONCLUSTERED INDEX [RprCodes_INDEX01]
    ON [dbo].[RprCodes]([Code] ASC) WITH (FILLFACTOR = 70);

