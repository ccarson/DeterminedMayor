CREATE TABLE [dbo].[FedTransMain] (
    [ID]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [HeaderID]        BIGINT          DEFAULT ((0)) NOT NULL,
    [LineNum]         SMALLINT        DEFAULT ((0)) NOT NULL,
    [TransactionDate] DATE            DEFAULT (getdate()) NOT NULL,
    [TransactionType] VARCHAR (1)     DEFAULT ('') NOT NULL,
    [Name]            VARCHAR (25)    DEFAULT ('') NOT NULL,
    [Street1]         VARCHAR (35)    DEFAULT ('') NOT NULL,
    [Street2]         VARCHAR (35)    DEFAULT ('') NOT NULL,
    [City]            VARCHAR (15)    DEFAULT ('') NOT NULL,
    [State]           VARCHAR (2)     DEFAULT ('') NOT NULL,
    [Country]         VARCHAR (2)     DEFAULT ('') NOT NULL,
    [FFLNumber]       VARCHAR (10)    DEFAULT ('') NOT NULL,
    [ChangeType]      VARCHAR (2)     DEFAULT ('') NOT NULL,
    [Description]     VARCHAR (100)   DEFAULT ('') NOT NULL,
    [RMA]             INT             DEFAULT ((0)) NOT NULL,
    [ReceivingTicket] INT             DEFAULT ((0)) NOT NULL,
    [WorkOrderNumber] INT             DEFAULT ((0)) NOT NULL,
    [OrdNum]          NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [OrderLineNum]    SMALLINT        DEFAULT ((0)) NOT NULL,
    [PreviousValue]   VARCHAR (20)    DEFAULT ('') NOT NULL,
    [NewValue]        VARCHAR (20)    DEFAULT ('') NOT NULL,
    [CorrectionFor]   BIGINT          DEFAULT ((0)) NOT NULL,
    [CorrectedBy]     BIGINT          DEFAULT ((0)) NOT NULL,
    [Form4473]        INT             DEFAULT ((0)) NOT NULL,
    [Location]        VARCHAR (20)    DEFAULT ('') NOT NULL,
    [DefectTagNumber] INT             DEFAULT ((0)) NOT NULL,
    [CreatedBy]       VARCHAR (4)     DEFAULT ('') NOT NULL,
    [CreatedDate]     DATETIME        DEFAULT (getdate()) NOT NULL,
    [Recall]          VARCHAR (20)    DEFAULT ('') NOT NULL,
    [PONumber]        INT             CONSTRAINT [DF_FedTransMain_PONumber] DEFAULT ((0)) NOT NULL,
    [POLine]          INT             CONSTRAINT [DF_FedTransMain_POLine] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [FedTransMain_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [FedTransMain_INDEX04]
    ON [dbo].[FedTransMain]([TransactionType] ASC, [CorrectedBy] ASC, [OrdNum] ASC, [OrderLineNum] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FedTransMain_INDEX03]
    ON [dbo].[FedTransMain]([OrdNum] ASC, [OrderLineNum] ASC, [HeaderID] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FedTransMain_INDEX02]
    ON [dbo].[FedTransMain]([HeaderID] ASC, [LineNum] ASC, [CreatedDate] ASC, [ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FedTransMain_PO_And_Corrected]
    ON [dbo].[FedTransMain]([PONumber] ASC, [POLine] ASC, [CorrectedBy] ASC)
    INCLUDE([ID]);


GO
CREATE NONCLUSTERED INDEX [FedTransMain_INDEX05]
    ON [dbo].[FedTransMain]([WorkOrderNumber] ASC, [CorrectedBy] ASC, [LineNum] ASC);

