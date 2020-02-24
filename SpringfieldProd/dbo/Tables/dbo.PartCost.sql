CREATE TABLE [dbo].[PartCost] (
    [ID]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [PartNum]     VARCHAR (20)    CONSTRAINT [DF_PartCost_PartNum] DEFAULT ('') NOT NULL,
    [MinQuan]     BIGINT          CONSTRAINT [DF_PartCost_MinQuan] DEFAULT ((0)) NOT NULL,
    [MaxQuan]     BIGINT          CONSTRAINT [DF_PartCost_MaxQuan] DEFAULT ((0)) NOT NULL,
    [Cost]        NUMERIC (12, 6) CONSTRAINT [DF_PartCost_Cost] DEFAULT ((0)) NOT NULL,
    [CreatedBy]   CHAR (4)        CONSTRAINT [DF_PartCost_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate] DATETIME2 (3)   CONSTRAINT [DF_PartCost_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [ChangedBy]   CHAR (4)        CONSTRAINT [DF_PartCost_ChangedBy] DEFAULT ('') NOT NULL,
    [ChangedDate] DATETIME2 (3)   CONSTRAINT [DF_PartCost_ChangedDate] DEFAULT ('01/01/0001') NOT NULL,
    CONSTRAINT [PartCost_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PartCost_INDEX02]
    ON [dbo].[PartCost]([PartNum] ASC, [MinQuan] ASC);

