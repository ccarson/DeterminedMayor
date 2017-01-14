CREATE TABLE [dbo].[EDI850Detail] (
    [ID]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [HeaderID]             BIGINT         DEFAULT ((0)) NOT NULL,
    [LineSeqNumber]        BIGINT         DEFAULT ((0)) NOT NULL,
    [BuyerPartNumber]      VARCHAR (16)   DEFAULT ('') NULL,
    [VendorPartNumber]     VARCHAR (16)   CONSTRAINT [DF__EDI850Det__Vendo__368B2B5F] DEFAULT ('') NULL,
    [EAN]                  VARCHAR (16)   CONSTRAINT [DF__EDI850Detai__EAN__377F4F98] DEFAULT ('') NULL,
    [PartNumber]           VARCHAR (16)   DEFAULT ('') NULL,
    [OrderQty]             BIGINT         DEFAULT ((0)) NULL,
    [OrderQtyUOM]          VARCHAR (4)    DEFAULT ('') NULL,
    [UnitPrice]            NUMERIC (8, 2) DEFAULT ((0)) NULL,
    [PurchasePrice]        NUMERIC (8, 2) NULL,
    [ProductDescription]   VARCHAR (100)  DEFAULT ('') NULL,
    [NoteInformationField] VARCHAR (500)  DEFAULT ('') NULL,
    CONSTRAINT [PK_EDI850Detail] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_EDI850Detail_HeaderID] FOREIGN KEY ([HeaderID]) REFERENCES [dbo].[EDI850Header] ([ID])
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [EDI850Detail_INDEX02]
    ON [dbo].[EDI850Detail]([ID] ASC);
GO


CREATE UNIQUE NONCLUSTERED INDEX [EDI850Detail_INDEX03]
    ON [dbo].[EDI850Detail]([HeaderID] ASC, [LineSeqNumber] ASC);
GO


CREATE UNIQUE NONCLUSTERED INDEX [EDI850Detail_INDEX01]
    ON [dbo].[EDI850Detail]([HeaderID] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDI850Detail_INDEX05]
    ON [dbo].[EDI850Detail]([VendorPartNumber] ASC, [HeaderID] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDI850Detail_INDEX04]
    ON [dbo].[EDI850Detail]([EAN] ASC, [HeaderID] ASC, [ID] ASC);

