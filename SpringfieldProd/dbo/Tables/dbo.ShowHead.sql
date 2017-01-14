CREATE TABLE [dbo].[ShowHead] (
    [RECNUM]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [ShowOrderNum]        DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [LastLineNum]         DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [Initials]            VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [OrdNum]              DECIMAL (10, 2) CONSTRAINT [DF_ShowHead_OrdNum] DEFAULT ((0)) NOT NULL,
    [YardCode]            VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [DateOrdered]         DATETIME2 (3)   CONSTRAINT [DF_ShowHead_DateOrdered] DEFAULT ('0001-01-01 00:00:00') NOT NULL,
    [DateWanted]          DATETIME2 (3)   NULL,
    [BCustID]             VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [BillPO]              VARCHAR (30)    NULL,
    [SCustID]             VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [ShipPO]              VARCHAR (30)    NULL,
    [SubTotal]            DECIMAL (10, 2) NULL,
    [TaxSubTotal]         DECIMAL (10, 2) NULL,
    [Freight]             DECIMAL (10, 2) NULL,
    [Tax]                 DECIMAL (10, 2) NULL,
    [TaxRate]             DECIMAL (4, 2)  NULL,
    [TaxByZipID]          VARCHAR (10)    NULL,
    [OrderTotal]          DECIMAL (10, 2) NULL,
    [Status]              VARCHAR (1)     NULL,
    [Packing_Notes]       NVARCHAR (MAX)  NULL,
    [Invoice_Notes]       NVARCHAR (MAX)  NULL,
    [Freight_Flag]        VARCHAR (1)     NULL,
    [Excise_Flag]         VARCHAR (1)     NULL,
    [OrderedSubTotal]     DECIMAL (10, 2) NULL,
    [OrderedTaxSubTotal]  DECIMAL (10, 2) NULL,
    [OrderedTotal]        DECIMAL (10, 2) NULL,
    [OrderedTax]          DECIMAL (10, 2) NULL,
    [QtyOrdered]          INT             NULL,
    [PostType]            VARCHAR (1)     NULL,
    [ShipDestinationType] VARCHAR (1)     NULL,
    [ShipUPS]             VARCHAR (1)     NULL,
    [SubApparel]          NUMERIC (10, 2) NULL,
    [OrderedSubApparel]   NUMERIC (10, 2) NULL,
    [SubLabor]            NUMERIC (10, 2) NULL,
    [OrderedSubLabor]     NUMERIC (10, 2) NULL,
    [EMail]               VARCHAR (500)   NULL,
    CONSTRAINT [ShowHead_INDEX00] PRIMARY KEY CLUSTERED ([RECNUM] ASC) WITH (FILLFACTOR = 70)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [ShowHead_INDEX01]
    ON [dbo].[ShowHead]([ShowOrderNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ShowHead_INDEX02]
    ON [dbo].[ShowHead]([OrdNum] ASC, [ShowOrderNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ShowHead_INDEX03]
    ON [dbo].[ShowHead]([BCustID] ASC, [ShowOrderNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ShowHead_INDEX04]
    ON [dbo].[ShowHead]([SCustID] ASC, [ShowOrderNum] ASC);

