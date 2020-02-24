CREATE TABLE [dbo].[EDI855Detail] (
    [ID]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [HeaderID]             BIGINT         DEFAULT ((0)) NOT NULL,
    [LineSeqNumber]        BIGINT         DEFAULT ((0)) NOT NULL,
    [BuyerPartNumber]      VARCHAR (16)   NULL,
    [VendorPartNumber]     VARCHAR (16)   NULL,
    [EAN]                  VARCHAR (16)   NULL,
    [PartNumber]           VARCHAR (16)   NULL,
    [OrderQty]             BIGINT         NULL,
    [OrderQtyUOM]          VARCHAR (4)    NULL,
    [UnitPrice]            NUMERIC (8, 2) NULL,
    [PurchasePrice]        NUMERIC (8, 2) NULL,
    [ProductDescription]   VARCHAR (100)  NULL,
    [NoteInformationField] VARCHAR (500)  NULL,
    [AcknowledgementType]  VARCHAR (2)    NULL,
    [ItemScheduleDate]     DATETIME2 (7)  NULL,
    CONSTRAINT [PK_EDI855Detail] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [EDI855Detail_INDEX02]
    ON [dbo].[EDI855Detail]([HeaderID] ASC, [LineSeqNumber] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDI855Detail_INDEX03]
    ON [dbo].[EDI855Detail]([LineSeqNumber] ASC, [ID] ASC);


GO



