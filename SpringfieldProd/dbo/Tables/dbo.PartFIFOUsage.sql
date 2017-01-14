CREATE TABLE [dbo].[PartFIFOUsage] (
    [ID]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [PartFIFOReceivedID] BIGINT          NOT NULL,
    [PartNum]            VARCHAR (20)    NOT NULL,
    [Quantity]           INT             DEFAULT ((0)) NOT NULL,
    [UsageDate]          DATETIME        DEFAULT (getdate()) NOT NULL,
    [UsageType]          CHAR (1)        DEFAULT ('') NOT NULL,
    [UsageNumber]        NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [CreatedBy]          CHAR (4)        DEFAULT ('') NOT NULL,
    [CreatedDate]        DATETIME        DEFAULT (getdate()) NOT NULL,
    [ChangedBy]          CHAR (4)        DEFAULT ('') NOT NULL,
    [ChangedDate]        DATETIME        DEFAULT ('1753-01-01') NOT NULL,
    [Notes]              VARCHAR (100)   DEFAULT ('') NOT NULL,
    CONSTRAINT [PartFIFOUsage_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PartFIFOUsage_PartFIFOReceived] FOREIGN KEY ([PartFIFOReceivedID]) REFERENCES [dbo].[PartFIFOReceived] ([ID])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [PartFIFOUsage_INDEX04]
    ON [dbo].[PartFIFOUsage]([PartNum] ASC, [UsageDate] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PartFIFOUsage_INDEX03]
    ON [dbo].[PartFIFOUsage]([PartNum] ASC, [UsageType] ASC, [UsageNumber] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PartFIFOUsage_INDEX02]
    ON [dbo].[PartFIFOUsage]([PartFIFOReceivedID] ASC, [UsageDate] ASC, [ID] ASC);

