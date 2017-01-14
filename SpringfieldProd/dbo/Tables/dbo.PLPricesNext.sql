CREATE TABLE [dbo].[PLPricesNext] (
    [RECNUM]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [PriceListID]  BIGINT         CONSTRAINT [DF__PLPricesN__Price__702CF1B8] DEFAULT ((0)) NOT NULL,
    [PriceType]    VARCHAR (20)   CONSTRAINT [DF__PLPricesN__Price__712115F1] DEFAULT (' ') NOT NULL,
    [Factor]       NUMERIC (8, 4) NOT NULL,
    [FromPrice]    VARCHAR (12)   NOT NULL,
    [CalcHow]      VARCHAR (1)    NOT NULL,
    [DollarAmount] NUMERIC (8, 2) NOT NULL,
    [Round]        VARCHAR (1)    NOT NULL,
    [Price]        NUMERIC (8, 2) NOT NULL,
    [OrdPrice]     NUMERIC (8, 2) NOT NULL,
    [SortBy]       SMALLINT       CONSTRAINT [DF__PLPricesN__SortB__72153A2A] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PLPricesNext_INDEX01] PRIMARY KEY CLUSTERED ([PriceListID] ASC, [PriceType] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_PLPricesNext_PriceListID] FOREIGN KEY ([PriceListID]) REFERENCES [dbo].[PriceLstNext] ([ID]),
    CONSTRAINT [FK_PLPricesNext_PriceType] FOREIGN KEY ([PriceType]) REFERENCES [dbo].[PLTypes] ([PriceType])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLPricesNext_INDEX00]
    ON [dbo].[PLPricesNext]([RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLPricesNext_INDEX02]
    ON [dbo].[PLPricesNext]([PriceListID] ASC, [SortBy] ASC, [PriceType] ASC) WITH (FILLFACTOR = 70);

