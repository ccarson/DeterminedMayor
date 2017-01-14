CREATE TABLE [dbo].[PartFIFOReceived] (
    [ID]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [PartNum]        VARCHAR (20)    NOT NULL,
    [ReceivedDate]   DATETIME        DEFAULT (getdate()) NOT NULL,
    [ReceivedSource] CHAR (1)        DEFAULT ('') NOT NULL,
    [ReceivedNumber] NUMERIC (12, 2) DEFAULT ((0)) NOT NULL,
    [QuantityIn]     INT             DEFAULT ((0)) NOT NULL,
    [QuantityOut]    INT             DEFAULT ((0)) NOT NULL,
    [StandardCost]   NUMERIC (12, 6) DEFAULT ((0)) NOT NULL,
    [ActualCost]     NUMERIC (12, 6) DEFAULT ((0)) NOT NULL,
    [CreatedBy]      CHAR (4)        DEFAULT ('') NOT NULL,
    [CreatedDate]    DATETIME        DEFAULT (getdate()) NOT NULL,
    [ChangedBy]      CHAR (4)        DEFAULT ('') NOT NULL,
    [ChangedDate]    DATETIME        DEFAULT ('1753-01-01') NOT NULL,
    [CloseDate]      DATETIME        DEFAULT ('1753-01-01') NOT NULL,
    [Release]        INT             DEFAULT ((0)) NOT NULL,
    [Notes]          VARCHAR (100)   DEFAULT ('') NOT NULL,
    [ReceivedStatus] CHAR (1)        DEFAULT ('N') NOT NULL,
    CONSTRAINT [PartFIFOReceived_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [PartFIFOReceived_INDEX02]
    ON [dbo].[PartFIFOReceived]([PartNum] ASC, [ReceivedDate] ASC, [ID] ASC);

