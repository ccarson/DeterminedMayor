CREATE TABLE [dbo].[PLCateg] (
    [Recnum]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [ID]            DECIMAL (10)  DEFAULT ((0)) NOT NULL,
    [Category_Name] VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [Description]   VARCHAR (75)  DEFAULT (' ') NOT NULL,
    [Sortby]        DECIMAL (6)   DEFAULT ((0)) NOT NULL,
    [Note]          VARCHAR (MAX) NULL,
    [Model]         VARCHAR (6)   DEFAULT (' ') NOT NULL,
    [NewPageAfter]  VARCHAR (1)   NULL,
    [PrintIt]       VARCHAR (1)   NULL,
    CONSTRAINT [PLCateg_INDEX01] PRIMARY KEY CLUSTERED ([Category_Name] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLCateg_INDEX00]
    ON [dbo].[PLCateg]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLCateg_INDEX02]
    ON [dbo].[PLCateg]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLCateg_INDEX03]
    ON [dbo].[PLCateg]([Sortby] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

