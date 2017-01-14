CREATE TABLE [dbo].[CustWOCustDesc] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (80) DEFAULT (' ') NOT NULL,
    [Type]        VARCHAR (10) DEFAULT (' ') NOT NULL,
    [Code]        SMALLINT     DEFAULT ((0)) NOT NULL,
    CONSTRAINT [CustWOCustDesc_INDEX01] PRIMARY KEY CLUSTERED ([Description] ASC, [Type] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CustWOCustDesc_INDEX02]
    ON [dbo].[CustWOCustDesc]([Type] ASC, [Description] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CustWOCustDesc_INDEX03]
    ON [dbo].[CustWOCustDesc]([Type] ASC, [Code] ASC);

