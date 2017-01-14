CREATE TABLE [dbo].[CustWOLabor] (
    [CustWONum]   NUMERIC (12, 2) NOT NULL,
    [Code]        SMALLINT        DEFAULT ((0)) NOT NULL,
    [Description] VARCHAR (60)    DEFAULT (' ') NOT NULL,
    [Hours]       NUMERIC (6, 2)  NULL,
    [Rate]        NUMERIC (6, 2)  NULL,
    [Total]       NUMERIC (8, 2)  NULL,
    [RepairTech]  VARCHAR (3)     NULL,
    [Warranty]    VARCHAR (1)     NULL,
    [ID]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [ActualMin]   SMALLINT        NULL,
    [ActualCost]  NUMERIC (6, 2)  NULL,
    CONSTRAINT [CustWOLabor_INDEX01] PRIMARY KEY CLUSTERED ([CustWONum] ASC, [Description] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CustWOLabor_INDEX02]
    ON [dbo].[CustWOLabor]([ID] ASC);

