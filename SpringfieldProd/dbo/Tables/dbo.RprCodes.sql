CREATE TABLE [dbo].[RprCodes] (
    [Recnum]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [Code]         DECIMAL (6)   DEFAULT ((0)) NOT NULL,
    [PartGroup]    VARCHAR (25)  DEFAULT (' ') NOT NULL,
    [Description]  VARCHAR (100) DEFAULT (' ') NOT NULL,
    [ProductGroup] VARCHAR (25)  DEFAULT (' ') NOT NULL,
    CONSTRAINT [RprCodes_INDEX01] PRIMARY KEY CLUSTERED ([ProductGroup] ASC, [PartGroup] ASC, [Description] ASC, [Code] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_RprCodes_ProductGroup] FOREIGN KEY ([ProductGroup]) REFERENCES [dbo].[RprProdG] ([Product])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RprCodes_INDEX00]
    ON [dbo].[RprCodes]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RprCodes_INDEX02]
    ON [dbo].[RprCodes]([Code] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RprCodes_INDEX03]
    ON [dbo].[RprCodes]([ProductGroup] ASC, [Code] ASC) WITH (FILLFACTOR = 70);

