CREATE TABLE [dbo].[WebStoreDetail] (
    [OrderNum]      BIGINT         DEFAULT ((0)) NOT NULL,
    [LineNumber]    SMALLINT       DEFAULT ((0)) NOT NULL,
    [SprNum]        VARCHAR (20)   NULL,
    [Qty]           INT            NULL,
    [UnitPrice]     NUMERIC (8, 2) NULL,
    [Desc]          VARCHAR (50)   NULL,
    [SaleName]      VARCHAR (250)  NULL,
    [PriceCategory] TINYINT        CONSTRAINT [DF_WebStoreDetail_PriceCategory] DEFAULT ((0)) NOT NULL,
    [YardCode]      VARCHAR (4)    NULL,
    CONSTRAINT [WebStoreDetail_INDEX01] PRIMARY KEY CLUSTERED ([OrderNum] ASC, [LineNumber] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_WebStoreDetail_OrderNum] FOREIGN KEY ([OrderNum]) REFERENCES [dbo].[WebStoreHeader] ([OrderNum])
);





GO
CREATE UNIQUE NONCLUSTERED INDEX [WebStoreDetail_INDEX02]
    ON [dbo].[WebStoreDetail]([OrderNum] ASC, [PriceCategory] ASC, [LineNumber] ASC);

