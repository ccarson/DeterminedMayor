CREATE TABLE [dbo].[SalesTaxDetail] (
    [ID]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [OrdNum]          NUMERIC (10, 2) CONSTRAINT [DF__SalesTaxD__OrdNu__342D164A] DEFAULT ((0)) NOT NULL,
    [ShipDate]        DATE            NULL,
    [TaxableSubTotal] NUMERIC (10, 2) NULL,
    [State]           VARCHAR (2)     CONSTRAINT [DF__SalesTaxD__State__35213A83] DEFAULT (' ') NOT NULL,
    [TaxID]           VARCHAR (10)    CONSTRAINT [DF__SalesTaxD__TaxID__36155EBC] DEFAULT (' ') NOT NULL,
    [Name]            VARCHAR (40)    NULL,
    [TaxRate]         NUMERIC (6, 4)  NULL,
    [SalesTax]        NUMERIC (8, 2)  NULL,
    [County]          VARCHAR (30)    NULL,
    CONSTRAINT [PK_SalesTaxDetail] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_SalesTaxDetail_OrdNum] FOREIGN KEY ([OrdNum]) REFERENCES [dbo].[SalesTaxHeader] ([OrdNum])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SalesTaxDetail_INDEX02]
    ON [dbo].[SalesTaxDetail]([OrdNum] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SalesTaxDetail_INDEX03]
    ON [dbo].[SalesTaxDetail]([State] ASC, [TaxID] ASC, [OrdNum] ASC, [ID] ASC);

