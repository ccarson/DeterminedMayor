CREATE TABLE [dbo].[EDIRevisedDetail] (
    [ID]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [HeaderID]             BIGINT         DEFAULT ((0)) NOT NULL,
    [LineSeqNumber]        BIGINT         DEFAULT ((0)) NOT NULL,
    [BuyerPartNumber]      VARCHAR (16)   NULL,
    [VendorPartNumber]     VARCHAR (16)   NULL,
    [EAN]                  VARCHAR (16)   CONSTRAINT [DF_EDIRevisedDetail_EAN] DEFAULT (' ') NOT NULL,
    [PartNumber]           VARCHAR (16)   NULL,
    [OrderQty]             BIGINT         NULL,
    [OrderQtyUOM]          VARCHAR (4)    NULL,
    [UnitPrice]            NUMERIC (8, 2) NULL,
    [PurchasePrice]        NUMERIC (8, 2) NULL,
    [ProductDescription]   VARCHAR (100)  NULL,
    [NoteInformationField] VARCHAR (500)  NULL,
    [LineChangeCode]       VARCHAR (4)    NULL,
    [QtyLeftToReceive]     VARCHAR (10)   NULL,
    CONSTRAINT [EDIRevisedDetail_INDEX01] PRIMARY KEY CLUSTERED ([HeaderID] ASC, [ID] ASC)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [EDIRevisedDetail_INDEX02]
    ON [dbo].[EDIRevisedDetail]([ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDIRevisedDetail_INDEX03]
    ON [dbo].[EDIRevisedDetail]([HeaderID] ASC, [LineSeqNumber] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDIRevisedDetail_INDEX04]
    ON [dbo].[EDIRevisedDetail]([EAN] ASC, [HeaderID] ASC, [ID] ASC);

