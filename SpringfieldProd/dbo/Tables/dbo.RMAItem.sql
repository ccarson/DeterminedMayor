CREATE TABLE [dbo].[RMAItem] (
    [ID]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [HeaderID]        BIGINT          CONSTRAINT [DF_RMAItem_HeaderID] DEFAULT ((0)) NOT NULL,
    [PartNum]         VARCHAR (20)    CONSTRAINT [DF_RMAItem_PartNum] DEFAULT ('') NOT NULL,
    [ItemDescription] VARCHAR (35)    CONSTRAINT [DF_RMAItem_ItemDescription] DEFAULT ('') NOT NULL,
    [Quantity]        SMALLINT        CONSTRAINT [DF_RMAItem_Quantity] DEFAULT ((0)) NOT NULL,
    [Serial]          VARCHAR (14)    CONSTRAINT [DF_RMAItem_Serial] DEFAULT ('') NOT NULL,
    [ReceivedBy]      CHAR (4)        CONSTRAINT [DF_RMAItem_ReceivedBy] DEFAULT ('') NOT NULL,
    [ReceivedDate]    DATETIME        CONSTRAINT [DF_RMAItem_ReceivedDate] DEFAULT ('1753-01-01') NOT NULL,
    [ReceivingTicket] INT             CONSTRAINT [DF_RMAItem_ReceivingTicket] DEFAULT ((0)) NOT NULL,
    [ReturnedDate]    DATETIME        CONSTRAINT [DF_RMAItem_ReturnedDate] DEFAULT ('1753-01-01') NOT NULL,
    [OrdNum]          NUMERIC (10, 2) CONSTRAINT [DF_RMAItem_OrdNum] DEFAULT ((0)) NOT NULL,
    [Action]          CHAR (1)        CONSTRAINT [DF_RMAItem_Action] DEFAULT ('') NOT NULL,
    [BillableHours]   NUMERIC (6, 2)  CONSTRAINT [DF_RMAItem_BillableHours] DEFAULT ((0)) NOT NULL,
    [WarrantyHours]   NUMERIC (6, 2)  CONSTRAINT [DF_RMAItem_WarrantyHours] DEFAULT ((0)) NOT NULL,
    [ItemNumber]      SMALLINT        CONSTRAINT [DF_RMAItem_ItemNumber] DEFAULT ((0)) NOT NULL,
    [Product]         VARCHAR (25)    CONSTRAINT [DF_RMAItem_Product] DEFAULT ('') NOT NULL,
    [Source]          CHAR (14)       DEFAULT ('Customer') NOT NULL,
    [Complaint]       VARCHAR (255)   NULL,
    [CustID]          VARCHAR (10)    NULL,
    CONSTRAINT [RMAItem_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RMAItem_RMAHeader] FOREIGN KEY ([HeaderID]) REFERENCES [dbo].[RMAHeader] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [idx_Nonclustered_RMAItem_OrdNum]
    ON [dbo].[RMAItem]([OrdNum] ASC)
    INCLUDE([ID], [HeaderID], [PartNum], [Serial], [Product]) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAItem_INDEX03]
    ON [dbo].[RMAItem]([HeaderID] ASC, [ItemNumber] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAItem_INDEX02]
    ON [dbo].[RMAItem]([HeaderID] ASC, [ID] ASC);

