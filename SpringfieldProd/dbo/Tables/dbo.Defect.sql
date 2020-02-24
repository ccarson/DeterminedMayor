CREATE TABLE [dbo].[Defect] (
    [ID]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [DefectNumber]   DECIMAL (6)     CONSTRAINT [DF_Defect_DefectNumber] DEFAULT ((0)) NOT NULL,
    [PartNum]        VARCHAR (20)    CONSTRAINT [DF_Defect_PartNum] DEFAULT ('') NOT NULL,
    [Quantity]       DECIMAL (8)     CONSTRAINT [DF_Defect_Quantity] DEFAULT ((0)) NOT NULL,
    [InventoryState] CHAR (1)        CONSTRAINT [DF_Defect_InventoryState] DEFAULT ('F') NOT NULL,
    [SourceType]     CHAR (1)        CONSTRAINT [DF_Defect_SourceType] DEFAULT ('') NOT NULL,
    [SourceNumber]   NUMERIC (12, 2) CONSTRAINT [DF_Defect_SourceNumber] DEFAULT ((0)) NOT NULL,
    [DefectCost]     DECIMAL (10, 4) CONSTRAINT [DF_Defect_DefectCost] DEFAULT ((0)) NOT NULL,
    [FreightCost]    DECIMAL (10, 4) CONSTRAINT [DF_Defect_FrieghtCost] DEFAULT ((0)) NOT NULL,
    [Fault]          CHAR (1)        CONSTRAINT [DF_Defect_Fault] DEFAULT ('S') NOT NULL,
    [DefectStatus]   CHAR (1)        CONSTRAINT [DF_Defect_DefectStatus] DEFAULT ('O') NOT NULL,
    [CreatedBy]      CHAR (4)        CONSTRAINT [DF_Defect_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]    DATETIME2 (3)   CONSTRAINT [DF_Defect_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [ChangedBy]      CHAR (4)        CONSTRAINT [DF_Defect_ChangedBy] DEFAULT ('') NOT NULL,
    [ChangedDate]    DATETIME2 (3)   CONSTRAINT [DF_Defect_ChangedDate] DEFAULT ('01/01/1753') NOT NULL,
    CONSTRAINT [Defect_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Defect_INDEX03]
    ON [dbo].[Defect]([PartNum] ASC, [DefectNumber] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Defect_INDEX02]
    ON [dbo].[Defect]([DefectNumber] ASC);

