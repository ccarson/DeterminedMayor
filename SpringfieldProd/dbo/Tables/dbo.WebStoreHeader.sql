CREATE TABLE [dbo].[WebStoreHeader] (
    [OrderNum]            BIGINT         DEFAULT ((0)) NOT NULL,
    [WebCustID]           BIGINT         NULL,
    [Name]                VARCHAR (50)   DEFAULT (' ') NOT NULL,
    [Address]             VARCHAR (50)   NULL,
    [Address2]            VARCHAR (50)   NULL,
    [City]                VARCHAR (50)   NULL,
    [State]               VARCHAR (2)    NULL,
    [Zip]                 VARCHAR (10)   NULL,
    [Country]             VARCHAR (50)   NULL,
    [Phone]               VARCHAR (20)   NULL,
    [Fax]                 VARCHAR (20)   NULL,
    [EMail]               VARCHAR (100)  NULL,
    [ShipName]            VARCHAR (50)   NULL,
    [ShipAddress]         VARCHAR (50)   NULL,
    [ShipAddress2]        VARCHAR (50)   NULL,
    [ShipCity]            VARCHAR (50)   NULL,
    [ShipState]           VARCHAR (2)    NULL,
    [ShipZip]             VARCHAR (10)   NULL,
    [ShipCountry]         VARCHAR (50)   NULL,
    [SubTotal]            NUMERIC (8, 2) NULL,
    [SalesTax]            NUMERIC (8, 2) NULL,
    [SalesTaxRate]        NUMERIC (8, 4) NULL,
    [ShippingAmt]         NUMERIC (8, 2) NULL,
    [Total]               NUMERIC (8, 2) NULL,
    [CCApprovalCode]      VARCHAR (50)   NULL,
    [OrderDate]           DATETIME       NULL,
    [LName]               VARCHAR (40)   DEFAULT (' ') NOT NULL,
    [AIMOrdNum]           BIGINT         DEFAULT ((0)) NOT NULL,
    [CCToken]             VARCHAR (25)   NULL,
    [CCPartialNum]        VARCHAR (20)   NULL,
    [CCType]              VARCHAR (20)   NULL,
    [OrderCode]           VARCHAR (25)   NULL,
    [Comment]             VARCHAR (1024) NULL,
    [ShipDetails]         VARCHAR (70)   NULL,
    [ShipType]            VARCHAR (1)    NULL,
    [CCExpDate]           VARCHAR (4)    NULL,
    [CCRetRef]            VARCHAR (25)   NULL,
    [DownloadDate]        DATETIME       NULL,
    [DiscountDescription] VARCHAR (100)  NULL,
    [Discount]            NUMERIC (6, 2) NULL,
    [CustType]            VARCHAR (1)    NULL,
    [AIMCustID]           VARCHAR (10)   NULL,
    [ShipToPO]            VARCHAR (40)   NULL,
    [AVSResult]           VARCHAR (1)    NULL,
    [YardCode]            VARCHAR (4)    NULL,
    [AvaStatus]           VARCHAR (20)   NULL,
    [AvaType]             VARCHAR (20)   NULL,
    [ShipEmail]           VARCHAR (100)  NULL,
    [ShipPhone]           VARCHAR (20)   NULL,
    CONSTRAINT [WebStoreHeader_INDEX01] PRIMARY KEY CLUSTERED ([OrderNum] ASC) WITH (FILLFACTOR = 70)
);




GO

CREATE UNIQUE NONCLUSTERED INDEX [WebStoreHeader_INDEX02]
    ON [dbo].[WebStoreHeader]([AIMOrdNum] ASC, [OrderNum] ASC) ;
GO


CREATE UNIQUE NONCLUSTERED INDEX [WebStoreHeader_INDEX03]
    ON [dbo].[WebStoreHeader]([LName] ASC, [Name] ASC, [OrderNum] ASC) ;

