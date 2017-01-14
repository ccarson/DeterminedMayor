CREATE TABLE [dbo].[PLModel] (
    [Recnum]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [ID]           DECIMAL (10)   DEFAULT ((0)) NOT NULL,
    [Model]        VARCHAR (6)    DEFAULT (' ') NOT NULL,
    [Description]  VARCHAR (60)   DEFAULT (' ') NOT NULL,
    [Sortby]       DECIMAL (6)    DEFAULT ((0)) NOT NULL,
    [Note]         VARCHAR (MAX)  NULL,
    [DealerMarkup] DECIMAL (8, 4) DEFAULT ((0)) NOT NULL,
    [RetailMarkup] DECIMAL (8, 4) DEFAULT ((0)) NOT NULL,
    [Type]         VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [Round]        VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [NewPageAfter] VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [PrintIt]      VARCHAR (1)    NULL,
    CONSTRAINT [PLModel_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLModel_INDEX00]
    ON [dbo].[PLModel]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLModel_INDEX02]
    ON [dbo].[PLModel]([Model] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLModel_INDEX03]
    ON [dbo].[PLModel]([Sortby] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

