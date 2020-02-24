CREATE TABLE [dbo].[RMAItemWorkCombined] (
    [ID]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemID]        BIGINT         CONSTRAINT [DF_RMAItemWorkCombined_ItemID] DEFAULT ((0)) NOT NULL,
    [Code]          INT            CONSTRAINT [DF_RMAItemWorkCombined_Code] DEFAULT ((0)) NOT NULL,
    [StartDate]     DATETIME       CONSTRAINT [DF_RMAItemWorkCombined_StartDate] DEFAULT ('1753-01-01') NOT NULL,
    [FinishDate]    DATETIME       CONSTRAINT [DF_RMAItemWorkCombined_FinishDate] DEFAULT ('1753-01-01') NOT NULL,
    [Initials]      CHAR (4)       CONSTRAINT [DF_RMAItemWorkCombined_Initials] DEFAULT ('') NOT NULL,
    [WorkType]      CHAR (1)       CONSTRAINT [DF_RMAItemWorkCombined_WorkType] DEFAULT ('W') NOT NULL,
    [BillableHours] NUMERIC (6, 2) CONSTRAINT [DF_RMAItemWorkCombined_BillableHours] DEFAULT ((0)) NOT NULL,
    [WarrantyHours] NUMERIC (6, 2) CONSTRAINT [DF_RMAItemWorkCombined_WarrantyHours] DEFAULT ((0)) NOT NULL,
    [CreatedBy]     CHAR (4)       CONSTRAINT [DF_RMAItemWorkCombined_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]   DATETIME       CONSTRAINT [DF_RMAItemWorkCombined_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RMAItemWorkCombined] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RMAItemWorkCombined_RMAItem] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[RMAItem] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [RMAItemWorkCombined_INDEX03]
    ON [dbo].[RMAItemWorkCombined]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAItemWorkCombined_INDEX02]
    ON [dbo].[RMAItemWorkCombined]([ItemID] ASC, [ID] ASC);

