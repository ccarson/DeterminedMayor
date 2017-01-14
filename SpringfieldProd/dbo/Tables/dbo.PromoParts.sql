CREATE TABLE [dbo].[PromoParts] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [PromoID]     BIGINT       CONSTRAINT [DF__PromoPart__Promo__62E80533] DEFAULT ((0)) NOT NULL,
    [SprNum]      VARCHAR (20) CONSTRAINT [DF__PromoPart__SprNu__63DC296C] DEFAULT (' ') NOT NULL,
    [Active]      VARCHAR (1)  NULL,
    [CreatedBy]   VARCHAR (4)  NULL,
    [CreatedDate] DATETIME     NULL,
    [ChangedBy]   VARCHAR (4)  NULL,
    [ChangedDate] DATETIME     NULL,
    CONSTRAINT [PK_PromoParts] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_PromoParts_PromoID] FOREIGN KEY ([PromoID]) REFERENCES [dbo].[Promo] ([ID]),
    CONSTRAINT [FK_PromoParts_SprNum] FOREIGN KEY ([SprNum]) REFERENCES [dbo].[parts] ([SPRNUM])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoParts_INDEX02]
    ON [dbo].[PromoParts]([PromoID] ASC, [SprNum] ASC) WITH (FILLFACTOR = 70);

