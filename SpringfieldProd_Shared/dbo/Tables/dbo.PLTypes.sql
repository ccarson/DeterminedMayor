CREATE TABLE [dbo].[PLTypes] (
    [Recnum]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [PriceType] VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [Factor]    DECIMAL (8, 4) DEFAULT ((0)) NOT NULL,
    [FromPrice] VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [CalcHow]   VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [Round]     VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [NoFET]     VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [NoAcc]     VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [NoXD]      VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [SortBy]    DECIMAL (4)    DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PLTypes_INDEX01] PRIMARY KEY CLUSTERED ([PriceType] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLTypes_INDEX00]
    ON [dbo].[PLTypes]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLTypes_INDEX02]
    ON [dbo].[PLTypes]([SortBy] ASC, [PriceType] ASC) WITH (FILLFACTOR = 70);

