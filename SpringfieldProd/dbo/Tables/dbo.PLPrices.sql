CREATE TABLE [dbo].[PLPrices] (
    [Recnum]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [PriceListID]  DECIMAL (10)   DEFAULT ((0)) NOT NULL,
    [PriceType]    VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [Factor]       DECIMAL (8, 4) DEFAULT ((0)) NOT NULL,
    [FromPrice]    VARCHAR (20)   DEFAULT (' ') NULL,
    [CalcHow]      VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [DollarAmount] DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [Round]        VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [Price]        DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [OrdPrice]     DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [SortBy]       DECIMAL (4)    DEFAULT ((0)) NOT NULL,
    [PrintIt]      CHAR (1)       CONSTRAINT [DF_PLPrices_PrintIt] DEFAULT ('Y') NOT NULL,
    CONSTRAINT [PLPrices_INDEX01] PRIMARY KEY CLUSTERED ([PriceListID] ASC, [PriceType] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_PLPrices_PriceListID] FOREIGN KEY ([PriceListID]) REFERENCES [dbo].[PriceLst] ([ID]),
    CONSTRAINT [FK_PLPrices_PriceType] FOREIGN KEY ([PriceType]) REFERENCES [dbo].[PLTypes] ([PriceType])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [PLPrices_INDEX00]
    ON [dbo].[PLPrices]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLPrices_INDEX02]
    ON [dbo].[PLPrices]([PriceListID] ASC, [SortBy] ASC, [PriceType] ASC) WITH (FILLFACTOR = 70);

