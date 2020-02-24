CREATE TABLE [dbo].[PromoPartsItems] (
    [ID]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [PromoPartsID]       BIGINT         CONSTRAINT [DF__PromoPart__Promo__67ACBA50] DEFAULT ((0)) NOT NULL,
    [Group]              SMALLINT       CONSTRAINT [DF__PromoPart__Group__68A0DE89] DEFAULT ((0)) NOT NULL,
    [SprNum]             VARCHAR (20)   CONSTRAINT [DF__PromoPart__SprNu__699502C2] DEFAULT (' ') NOT NULL,
    [Quantity]           INT            NULL,
    [Capacity]           TINYINT        CONSTRAINT [DF__PromoPart__Capac__6A8926FB] DEFAULT ((0)) NOT NULL,
    [CreatedBy]          VARCHAR (4)    NULL,
    [CreatedDate]        DATETIME       NULL,
    [ChangedBy]          VARCHAR (4)    NULL,
    [ChangedDate]        DATETIME       NULL,
    [BypassCaliberCheck] CHAR (1)       CONSTRAINT [DF_PromoPartsItems_BypassCaliberCheck] DEFAULT ('N') NOT NULL,
    [MaxQuantity]        INT            CONSTRAINT [DF_PromoPartsItems_MaxQuantity] DEFAULT ((1)) NOT NULL,
    [ItemType]           CHAR (1)       CONSTRAINT [DF_PromoPartsItems_ItemType] DEFAULT ('I') NOT NULL,
    [Price]              NUMERIC (8, 2) CONSTRAINT [DF_PromoPartsItems_Price] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_PromoPartsItems] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PromoPartsItems_PromoPartsID] FOREIGN KEY ([PromoPartsID]) REFERENCES [dbo].[PromoParts] ([ID]),
    CONSTRAINT [FK_PromoPartsItems_SprNum] FOREIGN KEY ([SprNum]) REFERENCES [dbo].[parts] ([SPRNUM])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoPartsItems_INDEX02]
    ON [dbo].[PromoPartsItems]([PromoPartsID] ASC, [Group] ASC, [SprNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoPartsItems_INDEX03]
    ON [dbo].[PromoPartsItems]([PromoPartsID] ASC, [Group] ASC, [Capacity] DESC, [ID] ASC);

