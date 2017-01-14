CREATE TABLE [dbo].[FedTransImport] (
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
    CONSTRAINT [FedTransImport_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FedTransImport_INDEX02]
    ON [dbo].[FedTransImport]([HeaderID] ASC, [LineNum] ASC, [CreatedDate] ASC, [ID] ASC);

