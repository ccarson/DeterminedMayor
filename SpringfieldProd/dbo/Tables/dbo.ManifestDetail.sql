CREATE TABLE [dbo].[ManifestDetail] (
    [ID]                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [HeaderID]             BIGINT          CONSTRAINT [DF__ManifestD__Heade__3185B3C9] DEFAULT ((0)) NOT NULL,
    [CarrierServiceID]     BIGINT          NULL,
    [OrdNum]               NUMERIC (10, 2) CONSTRAINT [DF__ManifestD__OrdNu__3279D802] DEFAULT ((0)) NOT NULL,
    [Name]                 VARCHAR (36)    NULL,
    [Attention]            VARCHAR (36)    NULL,
    [Street1]              VARCHAR (35)    NULL,
    [Street2]              VARCHAR (35)    NULL,
    [City]                 VARCHAR (20)    NULL,
    [State]                VARCHAR (2)     NULL,
    [ZIP]                  VARCHAR (10)    NULL,
    [InvoiceOutputType]    VARCHAR (1)     CONSTRAINT [DF_ManifestDetail_InvoiceOutputType] DEFAULT (' ') NOT NULL,
    [Status]               VARCHAR (1)     CONSTRAINT [DF__ManifestD__Statu__336DFC3B] DEFAULT (' ') NOT NULL,
    [MasterTrackingID]     VARCHAR (50)    NULL,
    [PackageCount]         SMALLINT        NULL,
    [TotalCost]            NUMERIC (8, 2)  NULL,
    [TotalWeight]          NUMERIC (8, 2)  NULL,
    [InvoiceNum]           INT             NULL,
    [Phone]                VARCHAR (10)    NULL,
    [MasterTrackingIDType] VARCHAR (7)     NULL,
    [EmailBatchNum]        TINYINT         CONSTRAINT [DF_ManifestDetail_EmailBatchNum] DEFAULT ((0)) NOT NULL,
    [BCustID]              VARCHAR (10)    CONSTRAINT [DF_ManifestDetail_BCustID] DEFAULT (' ') NOT NULL,
    [SCustID]              VARCHAR (10)    NULL,
    [ShipDate]             DATETIME        CONSTRAINT [DF_ManifestDetail_ShipDate] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [SACopyPrinted]        VARCHAR (1)     NULL,
    [SignatureRequired]    VARCHAR (1)     NULL,
    [Residential]          VARCHAR (1)     NULL,
    [SaturdayDelivery]     VARCHAR (1)     NULL,
    [Billing]              VARCHAR (1)     NULL,
    [BillingAccountNum]    VARCHAR (9)     NULL,
    [CreatedBy]            VARCHAR (4)     CONSTRAINT [DF_ManifestDetail_CreatedBy] DEFAULT (' ') NOT NULL,
    [CreatedDate]          DATE            CONSTRAINT [DF_ManifestDetail_CreatedDate] DEFAULT ('1753-01-01') NOT NULL,
    [PurchaseOrderNum]     NUMERIC (6)     CONSTRAINT [DF_ManifestDetail_PurchaseOrderNum] DEFAULT ((0)) NOT NULL,
    [VendorID]             CHAR (8)        CONSTRAINT [DF_ManifestDetail_VendorID] DEFAULT ('') NOT NULL,
    CONSTRAINT [ManifestDetail_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_ManifestDetail_HeaderID] FOREIGN KEY ([HeaderID]) REFERENCES [dbo].[ManifestHeader] ([ID])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestDetail_INDEX02]
    ON [dbo].[ManifestDetail]([HeaderID] ASC, [OrdNum] ASC, [Status] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestDetail_INDEX03]
    ON [dbo].[ManifestDetail]([OrdNum] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestDetail_INDEX04]
    ON [dbo].[ManifestDetail]([Status] ASC, [InvoiceOutputType] ASC, [BCustID] ASC, [EmailBatchNum] ASC, [OrdNum] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestDetail_INDEX05]
    ON [dbo].[ManifestDetail]([ShipDate] ASC, [Status] ASC, [BCustID] ASC, [ID] ASC);

