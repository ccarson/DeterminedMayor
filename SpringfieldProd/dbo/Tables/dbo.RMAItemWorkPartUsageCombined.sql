CREATE TABLE [dbo].[RMAItemWorkPartUsageCombined] (
    [ID]              BIGINT       IDENTITY (1, 1) NOT NULL,
    [ItemWorkID]      BIGINT       CONSTRAINT [DF_RMAItemWorkPartUsageCombined_ItemWorkID] DEFAULT ((0)) NOT NULL,
    [PartNum]         VARCHAR (20) CONSTRAINT [DF_RMAItemWorkPartUsageCombined_PartNum] DEFAULT ('') NOT NULL,
    [PartDescription] VARCHAR (35) CONSTRAINT [DF_RMAItemWorkPartUsageCombined_PartDescription] DEFAULT ('') NOT NULL,
    [Quantity]        SMALLINT     CONSTRAINT [DF_RMAItemWorkPartUsageCombined_Quantity] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [RMAItemWorkPartUsageCombined_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RMAItemWorkPartUsageCombined_RMAItemWorkCombined] FOREIGN KEY ([ItemWorkID]) REFERENCES [dbo].[RMAItemWorkCombined] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [RMAItemWorkPartUsageCombined_INDEX02]
    ON [dbo].[RMAItemWorkPartUsageCombined]([ItemWorkID] ASC, [ID] ASC);

