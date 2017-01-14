CREATE TABLE [dbo].[CustWOParts] (
    [CustWONum]   NUMERIC (12, 2) NOT NULL,
    [SprNum]      VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [Description] VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [QtyOrd]      BIGINT          NULL,
    [Price]       NUMERIC (8, 2)  NULL,
    [Total]       NUMERIC (10, 2) NULL,
    [Warranty]    VARCHAR (1)     NULL,
    CONSTRAINT [CustWOParts_INDEX01] PRIMARY KEY CLUSTERED ([CustWONum] ASC, [SprNum] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CustWOParts_INDEX02]
    ON [dbo].[CustWOParts]([SprNum] ASC, [Description] ASC, [CustWONum] ASC);

