CREATE TABLE [dbo].[WarrantyTemplate] (
    [SprNum]        VARCHAR (40) DEFAULT ('') NOT NULL,
    [EmailTemplate] VARCHAR (50) DEFAULT ('') NOT NULL,
    [PromoPackage]  VARCHAR (50) DEFAULT ('') NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WarrantyTemplate001]
    ON [dbo].[WarrantyTemplate]([SprNum] ASC, [PromoPackage] ASC);

