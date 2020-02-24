CREATE TABLE [dbo].[PromoDealerPoints] (
    [ID]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [PromoID]       BIGINT         NOT NULL,
    [Category]      VARCHAR (6)    CONSTRAINT [DF__PromoDeal__Categ__2D60E881] DEFAULT (' ') NOT NULL,
    [BarrelLength]  NUMERIC (4, 2) CONSTRAINT [DF__PromoDeal__Barre__2E550CBA] DEFAULT ((0)) NOT NULL,
    [SubCategory]   VARCHAR (10)   CONSTRAINT [DF__PromoDeal__SubCa__2F4930F3] DEFAULT (' ') NOT NULL,
    [Points]        NUMERIC (4, 2) NULL,
    [SubCategoryID] BIGINT         NULL,
    [CreatedDate]   DATE           NULL,
    [ChangedDate]   DATE           NULL,
    CONSTRAINT [PromoDealerPoints_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PromoDealerPoints_PromoID] FOREIGN KEY ([PromoID]) REFERENCES [dbo].[Promo] ([ID])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoDealerPoints_INDEX02]
    ON [dbo].[PromoDealerPoints]([PromoID] ASC, [Category] ASC, [SubCategory] ASC, [BarrelLength] ASC);



