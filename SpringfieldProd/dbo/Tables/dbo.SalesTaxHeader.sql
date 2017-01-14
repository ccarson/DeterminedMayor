CREATE TABLE [dbo].[SalesTaxHeader] (
    [OrdNum]          NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [InvoiceNum]      INT             NULL,
    [ShipDate]        DATE            NULL,
    [OrderSubtotal]   NUMERIC (10, 2) NULL,
    [Postage]         NUMERIC (10, 2) NULL,
    [TaxableSubtotal] NUMERIC (10, 2) NULL,
    [TaxAmount]       NUMERIC (8, 2)  NULL,
    [State]           VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [StateRate]       NUMERIC (6, 4)  NULL,
    [CountyID]        VARCHAR (10)    NULL,
    [CountyName]      VARCHAR (30)    NULL,
    [CountyRate]      NUMERIC (6, 4)  NULL,
    [CityID]          VARCHAR (10)    NULL,
    [CityName]        VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [CityRate]        NUMERIC (6, 4)  NULL,
    [Other1ID]        VARCHAR (10)    NULL,
    [Other1Rate]      NUMERIC (6, 4)  NULL,
    [Other2ID]        VARCHAR (10)    NULL,
    [Other2Rate]      NUMERIC (6, 4)  NULL,
    [Other3ID]        VARCHAR (10)    NULL,
    [Other3Rate]      NUMERIC (6, 4)  NULL,
    [Other4ID]        VARCHAR (10)    NULL,
    [Other4Rate]      NUMERIC (6, 4)  NULL,
    [Other5ID]        VARCHAR (10)    NULL,
    [Other5Rate]      NUMERIC (6, 4)  NULL,
    [Other6ID]        VARCHAR (10)    NULL,
    [Other6Rate]      NUMERIC (6, 4)  NULL,
    [OtherTotalRate]  NUMERIC (6, 4)  NULL,
    [TotalRate]       NUMERIC (6, 4)  NULL,
    [StartDate]       DATE            NULL,
    [EndDate]         DATE            NULL,
    [Zip]             VARCHAR (10)    NULL,
    CONSTRAINT [SalesTaxHeader_INDEX01] PRIMARY KEY CLUSTERED ([OrdNum] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SalesTaxHeader_INDEX02]
    ON [dbo].[SalesTaxHeader]([State] ASC, [CityName] ASC, [OrdNum] ASC) WITH (FILLFACTOR = 70);

