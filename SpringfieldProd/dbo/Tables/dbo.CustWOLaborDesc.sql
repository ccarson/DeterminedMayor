CREATE TABLE [dbo].[CustWOLaborDesc] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (80)   DEFAULT (' ') NOT NULL,
    [Type]        VARCHAR (10)   DEFAULT (' ') NOT NULL,
    [Hours]       NUMERIC (6, 2) NULL,
    [Charge]      NUMERIC (8, 2) NULL,
    [Code]        SMALLINT       DEFAULT ((0)) NOT NULL,
    CONSTRAINT [CustWOWorkDesc_INDEX01] PRIMARY KEY CLUSTERED ([Description] ASC, [Type] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CustWOWorkDesc_INDEX02]
    ON [dbo].[CustWOLaborDesc]([Type] ASC, [Description] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CustWOWorkDesc_INDEX03]
    ON [dbo].[CustWOLaborDesc]([Type] ASC, [Code] ASC);

