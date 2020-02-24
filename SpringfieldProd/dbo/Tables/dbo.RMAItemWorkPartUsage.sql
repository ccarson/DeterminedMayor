CREATE TABLE [dbo].[RMAItemWorkPartUsage] (
    [ID]              BIGINT       IDENTITY (1, 1) NOT NULL,
    [ItemWorkID]      BIGINT       CONSTRAINT [DF_RMAItemWorkPartUsage_ItemWorkID] DEFAULT ((0)) NOT NULL,
    [PartNum]         VARCHAR (20) CONSTRAINT [DF_RMAItemWorkPartUsage_PartNum] DEFAULT ('') NOT NULL,
    [PartDescription] VARCHAR (35) CONSTRAINT [DF_RMAItemWorkPartUsage_PartDescription] DEFAULT ('') NOT NULL,
    [Quantity]        SMALLINT     CONSTRAINT [DF_RMAItemWorkPartUsage_Quantity] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [RMAItemWorkPartUsage_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RMAItemWorkPartUsage_RMAItemWork] FOREIGN KEY ([ItemWorkID]) REFERENCES [dbo].[RMAItemWork] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [RMAItemWorkPartUsage_INDEX02]
    ON [dbo].[RMAItemWorkPartUsage]([ItemWorkID] ASC, [ID] ASC);

