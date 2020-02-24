CREATE TABLE [dbo].[PromoInfoItems] (
    [ID]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [PromoInfoID] BIGINT          NOT NULL,
    [ItemGroup]   SMALLINT        CONSTRAINT [DF_PromoInfoItems_ItemGroup] DEFAULT ((0)) NOT NULL,
    [SprNum]      VARCHAR (20)    NULL,
    [Qty]         INT             NULL,
    [UnitPrice]   NUMERIC (8, 2)  NULL,
    [Tax]         NUMERIC (6, 2)  NULL,
    [ExtPrice]    NUMERIC (10, 2) NULL,
    [CreatedBy]   VARCHAR (4)     NULL,
    [CreatedDate] DATETIME        NULL,
    [ChangedBy]   VARCHAR (4)     NULL,
    [ChangedDate] DATETIME        NULL,
    CONSTRAINT [PromoInfoItems_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfoItems_INDEX03]
    ON [dbo].[PromoInfoItems]([PromoInfoID] ASC, [ItemGroup] ASC, [SprNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfoItems_INDEX02]
    ON [dbo].[PromoInfoItems]([PromoInfoID] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

