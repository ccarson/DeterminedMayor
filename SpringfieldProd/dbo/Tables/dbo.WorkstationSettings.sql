CREATE TABLE [dbo].[WorkstationSettings] (
    [WorkstationName]          VARCHAR (15)  DEFAULT (' ') NOT NULL,
    [PLLocationCode]           VARCHAR (1)   NULL,
    [ScalePort]                VARCHAR (21)  NULL,
    [ShippingLocation]         VARCHAR (1)   NULL,
    [AddressCode]              VARCHAR (1)   NULL,
    [ShippingLabelPrinterPort] VARCHAR (255) NULL,
    [BarCodePrinterPort]       VARCHAR (255) NULL,
    [SaveWebServiceFiles]      VARCHAR (1)   NULL,
    [ScaleType]                VARCHAR (1)   NULL,
    [GroundClosingCopies]      TINYINT       NULL,
    [BarCodePrinterLanguage]   VARCHAR (1)   NULL,
    [FobReaderPort]            VARCHAR (30)  NULL,
    [PrintPackingListFirst]    CHAR (1)      DEFAULT ('N') NOT NULL,
    [DocumentPrinterPort]      VARCHAR (255) DEFAULT ('') NOT NULL,
    [ClampackLabelPrinterPort] VARCHAR (255) NULL,
    CONSTRAINT [WorkstationSettings_INDEX01] PRIMARY KEY CLUSTERED ([WorkstationName] ASC) WITH (FILLFACTOR = 70)
);









