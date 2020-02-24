CREATE TABLE [dbo].[CUSTINFO] (
    [Recnum]                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [BCUSTID]                  VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [SCUSTID]                  VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [DATE]                     DATETIME        NOT NULL,
    [SHIPDATE]                 DATETIME        NOT NULL,
    [ORDNUM]                   DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [COM]                      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SNAME]                    VARCHAR (36)    DEFAULT (' ') NOT NULL,
    [SUB]                      DECIMAL (10, 2) NOT NULL,
    [DISC]                     DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [POST]                     DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [DEP]                      DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [COD]                      DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [TAX]                      DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [RECEIVED]                 DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [CARDKIND]                 VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CARDNUM]                  VARCHAR (19)    DEFAULT (' ') NOT NULL,
    [N1]                       VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N2]                       VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N3]                       VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N4]                       VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N5]                       VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N6]                       VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N7]                       VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [STATUS]                   VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [ACCTYPE]                  VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EXPIRE]                   VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [EXCISE_FLAG]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CHECK_TYPE]               VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EXCISE_DATE]              DATETIME        NOT NULL,
    [PAID_DATE]                DATETIME        NOT NULL,
    [LAST_CHANGE]              DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [ORIGINAL]                 DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [DATE_WANTED]              DATETIME        NOT NULL,
    [CANCEL_DATE]              DATETIME        NOT NULL,
    [OVER60_FLAG]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [OTOTAL]                   DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [BACKORDER]                VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CUST_PO#]                 VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [TAXRATE]                  DECIMAL (6, 4)  NOT NULL,
    [TRADE_AMOUNT]             DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [TRADE_TAX_FLAG]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [COMPANY_#]                VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [ACCR_DISC]                DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [WHLE_DISC]                DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [STATEID]                  VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [TELEWHO]                  VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [FREIGHT_FLAG]             VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [COD_FLAG]                 VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CID]                      VARCHAR (5)     DEFAULT (' ') NOT NULL,
    [StoreSale_Flag]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [YardCode]                 VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Packing_Notes]            VARCHAR (MAX)   NULL,
    [Balance]                  DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [RefundTotal]              DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [Invoice_Notes]            VARCHAR (MAX)   NULL,
    [Programming_Ver]          DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [Sub_Taxable]              DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OrderedBy]                VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [Date_Due]                 DATETIME        DEFAULT ('1753-01-01') NOT NULL,
    [O_Sub]                    DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [O_Disc]                   DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [O_Post]                   DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [O_Tax]                    DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [O_SubTaxable]             DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [O_Total]                  DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [SUBTOT]                   DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [USERINITIALS]             VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [ShippedBy]                VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [TaxStateRate]             DECIMAL (6, 4)  NOT NULL,
    [TaxCountyRate]            DECIMAL (6, 4)  NOT NULL,
    [TaxCityRate]              DECIMAL (6, 4)  NOT NULL,
    [TaxSpecialRate]           DECIMAL (6, 4)  NOT NULL,
    [TaxByZipID]               DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [InvoiceNum]               DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [ShipToPO]                 VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [Form4473]                 DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [CalcTax]                  VARCHAR (1)     NULL,
    [CreatedBy]                VARCHAR (4)     NULL,
    [CreatedDate]              DATETIME        NULL,
    [ChangedBy]                VARCHAR (4)     NULL,
    [ChangedDate]              DATETIME        NULL,
    [Version]                  VARCHAR (15)    NULL,
    [ForceTax]                 VARCHAR (1)     NULL,
    [NoPLPrint]                VARCHAR (1)     NULL,
    [ReleaseDate]              DATETIME        NULL,
    [SAddress]                 VARCHAR (35)    NULL,
    [SAddress2]                VARCHAR (35)    NULL,
    [SCity]                    VARCHAR (30)    NULL,
    [SState]                   VARCHAR (2)     NULL,
    [SZip]                     VARCHAR (10)    NULL,
    [SCountry]                 VARCHAR (2)     NULL,
    [ExternalOrderType]        VARCHAR (1)     NULL,
    [ExternalOrdNum]           BIGINT          NULL,
    [CCToken]                  VARCHAR (25)    DEFAULT (' ') NOT NULL,
    [CCApprovalCode]           VARCHAR (25)    NULL,
    [NoTaxChange]              VARCHAR (1)     NULL,
    [CCRetRef]                 VARCHAR (25)    NULL,
    [Sub_Labor]                NUMERIC (10, 2) NULL,
    [Sub_LaborRepair]          NUMERIC (10, 2) NULL,
    [Sub_Apparel]              NUMERIC (10, 2) NULL,
    [CouponDiscount]           NUMERIC (6, 2)  NULL,
    [ReadyToShip]              VARCHAR (4)     NULL,
    [PostType]                 VARCHAR (2)     NULL,
    [ShipDestinationType]      VARCHAR (1)     NULL,
    [ShipUPS]                  VARCHAR (1)     NULL,
    [IAS_Sub]                  NUMERIC (10, 2) NULL,
    [IAS_Disc]                 NUMERIC (10, 2) NULL,
    [IAS_Post]                 NUMERIC (10, 2) NULL,
    [IAS_Tax]                  NUMERIC (10, 2) NULL,
    [IAS_OTotal]               NUMERIC (10, 2) NULL,
    [IAS_Sub_Taxable]          NUMERIC (10, 2) NULL,
    [IAS_Sub_Labor]            NUMERIC (10, 2) NULL,
    [IAS_Sub_LaborRepair]      NUMERIC (10, 2) NULL,
    [IAS_Sub_Apparel]          NUMERIC (10, 2) NULL,
    [NumberOfCartons]          SMALLINT        NULL,
    [Packed]                   VARCHAR (4)     DEFAULT ('N') NOT NULL,
    [ShipLocation]             VARCHAR (1)     DEFAULT ('') NULL,
    [CustApproval]             VARCHAR (1)     DEFAULT ('') NULL,
    [MgrApproval]              VARCHAR (1)     DEFAULT ('') NULL,
    [ReadyToShipDate]          DATETIME        DEFAULT ('1753-01-01') NOT NULL,
    [CancelAfter]              DATETIME        DEFAULT ('1753-01-01') NULL,
    [AuthorizedAmount]         NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [AVSResult]                VARCHAR (1)     DEFAULT ('') NULL,
    [CCTranStatus]             VARCHAR (1)     DEFAULT ('') NULL,
    [CCLatestTransID]          VARCHAR (25)    NULL,
    [AdultSig]                 VARCHAR (1)     NULL,
    [CustomerSelectedPostType] VARCHAR (1)     NULL,
    [FreightTax]               NUMERIC (6, 4)  NULL,
    [NFAStamp]                 CHAR (1)        CONSTRAINT [DF_CustInfo_NFAStamp] DEFAULT ('N') NOT NULL,
    [AvaStatus]                VARCHAR (20)    NULL,
    [AvaType]                  VARCHAR (20)    NULL,
    [NotForProfit]             CHAR (1)        DEFAULT ('') NOT NULL,
	
    CONSTRAINT [CUSTINFO_INDEX01] PRIMARY KEY CLUSTERED ([ORDNUM] ASC) WITH (FILLFACTOR = 70)
);





GO
ALTER TABLE [dbo].[CUSTINFO] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


GO


GO

CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX00]
    ON [dbo].[CUSTINFO]([Recnum] ASC)  ;

GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX02]
    ON [dbo].[CUSTINFO]([BCUSTID] ASC, [Recnum] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX03]
    ON [dbo].[CUSTINFO]([SNAME] ASC, [Recnum] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX04]
    ON [dbo].[CUSTINFO]([SCUSTID] ASC, [ORDNUM] ASC, [Recnum] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX08]
    ON [dbo].[CUSTINFO]([COMPANY_#] ASC, [SCUSTID] ASC, [ORDNUM] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX09]
    ON [dbo].[CUSTINFO]([ORIGINAL] ASC, [ORDNUM] ASC, [Recnum] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX10]
    ON [dbo].[CUSTINFO]([CUST_PO#] ASC, [BCUSTID] ASC, [ORDNUM] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX13]
    ON [dbo].[CUSTINFO]([STATUS] ASC, [ORDNUM] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX14]
    ON [dbo].[CUSTINFO]([InvoiceNum] ASC, [ORDNUM] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX15]
    ON [dbo].[CUSTINFO]([CCToken] ASC, [ORDNUM] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX05]
    ON [dbo].[CUSTINFO]([SCUSTID] ASC, [SHIPDATE] ASC, [ORDNUM] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX06]
    ON [dbo].[CUSTINFO]([DATE] ASC, [SCUSTID] ASC, [ORDNUM] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX07]
    ON [dbo].[CUSTINFO]([SHIPDATE] ASC, [SCUSTID] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX11]
    ON [dbo].[CUSTINFO]([BCUSTID] ASC, [DATE] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX12]
    ON [dbo].[CUSTINFO]([SHIPDATE] ASC, [BCUSTID] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX16]
    ON [dbo].[CUSTINFO]([ReadyToShipDate] ASC, [ORDNUM] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX17]
    ON [dbo].[CUSTINFO]([BCUSTID] ASC, [InvoiceNum] ASC, [ORDNUM] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX18]
    ON [dbo].[CUSTINFO]([Packed] ASC, [ShipLocation] ASC, [STATUS] ASC, [ORDNUM] ASC);


GO
CREATE NONCLUSTERED INDEX [CUSTINFO_INDEX19]
    ON [dbo].[CUSTINFO]([SHIPDATE] ASC, [ReadyToShipDate] ASC, [DATE_WANTED] ASC, [STATUS] ASC)
    INCLUDE([YardCode], [POST], [Packed])
	
;
GO

--Create the CustInfo change trigger for Insert or Update
CREATE TRIGGER trigCustInfoAudit ON CUSTINFO
AFTER UPDATE, DELETE
AS
BEGIN
  --Add the row with the old data to History
  INSERT INTO OrderHeaderHistory (Recnum
, [BCUSTID]
, [SCUSTID]
, [DATE]
, [SHIPDATE]
, [ORDNUM]
, [COM]
, [SNAME]
, [SUB]
, [DISC]
, [POST]
, [DEP]
, [COD]
, [TAX]
, [RECEIVED]
, [CARDKIND]
, [CARDNUM]
, [N1]
, [N2]
, [N3]
, [N4]
, [N5]
, [N6]
, [N7]
, [STATUS]
, [ACCTYPE]
, [EXPIRE]
, [EXCISE_FLAG]
, [CHECK_TYPE]
, [EXCISE_DATE]
, [PAID_DATE]
, [LAST_CHANGE]
, [ORIGINAL]
, [DATE_WANTED]
, [CANCEL_DATE]
, [OVER60_FLAG]
, [OTOTAL]
, [BACKORDER]
, [CUST_PO#]
, [TAXRATE]
, [TRADE_AMOUNT]
, [TRADE_TAX_FLAG]
, [COMPANY_#]
, [ACCR_DISC]
, [WHLE_DISC]
, [STATEID]
, [TELEWHO]
, [FREIGHT_FLAG]
, [COD_FLAG]
, [CID]
, [StoreSale_Flag]
, [YardCode]
, [Packing_Notes]
, [Balance]
, [RefundTotal]
, [Invoice_Notes]
, [Programming_Ver]
, [Sub_Taxable]
, [OrderedBy]
, [Date_Due]
, [O_Sub]
, [O_Disc]
, [O_Post]
, [O_Tax]
, [O_SubTaxable]
, [O_Total]
, [SUBTOT]
, [USERINITIALS]
, [ShippedBy]
, [TaxStateRate]
, [TaxCountyRate]
, [TaxCityRate]
, [TaxSpecialRate]
, [TaxByZipID]
, [InvoiceNum]
, [ShipToPO]
, [Form4473]
, [CalcTax]
, [CreatedBy]
, [CreatedDate]
, [ChangedBy]
, [ChangedDate]
, [Version]
, [ForceTax]
, [NoPLPrint]
, [ReleaseDate]
, [SAddress]
, [SAddress2]
, [SCity]
, [SState]
, [SZip]
, [SCountry]
, [ExternalOrderType]
, [ExternalOrdNum]
, [CCToken]
, [CCApprovalCode]
, [NoTaxChange]
, [CCRetRef]
, [Sub_Labor]
, [Sub_LaborRepair]
, [Sub_Apparel]
, [CouponDiscount]
, [ReadyToShip]
, [PostType]
, [ShipDestinationType]
, [ShipUPS]
, [IAS_Sub]
, [IAS_Disc]
, [IAS_Post]
, [IAS_Tax]
, [IAS_OTotal]
, [IAS_Sub_Taxable]
, [IAS_Sub_Labor]
, [IAS_Sub_LaborRepair]
, [IAS_Sub_Apparel]
, [NumberOfCartons]
, [Packed]
, [ShipLocation]
, [CustApproval]
, [MgrApproval]
, [ReadyToShipDate]
, [CancelAfter]
, [AuthorizedAmount]
, [AVSResult]
, [CCTranStatus]
, [CCLatestTransID]
, [AdultSig]
, [CustomerSelectedPostType]
, [FreightTax]
, [NFAStamp]
, ChangeUser)
SELECT d.Recnum
, d.[BCUSTID]
, d.[SCUSTID]
, d.[DATE]
, d.[SHIPDATE]
, d.[ORDNUM]
, d.[COM]
, d.[SNAME]
, d.[SUB]
, d.[DISC]
, d.[POST]
, d.[DEP]
, d.[COD]
, d.[TAX]
, d.[RECEIVED]
, d.[CARDKIND]
, d.[CARDNUM]
, d.[N1]
, d.[N2]
, d.[N3]
, d.[N4]
, d.[N5]
, d.[N6]
, d.[N7]
, d.[STATUS]
, d.[ACCTYPE]
, d.[EXPIRE]
, d.[EXCISE_FLAG]
, d.[CHECK_TYPE]
, d.[EXCISE_DATE]
, d.[PAID_DATE]
, d.[LAST_CHANGE]
, d.[ORIGINAL]
, d.[DATE_WANTED]
, d.[CANCEL_DATE]
, d.[OVER60_FLAG]
, d.[OTOTAL]
, d.[BACKORDER]
, d.[CUST_PO#]
, d.[TAXRATE]
, d.[TRADE_AMOUNT]
, d.[TRADE_TAX_FLAG]
, d.[COMPANY_#]
, d.[ACCR_DISC]
, d.[WHLE_DISC]
, d.[STATEID]
, d.[TELEWHO]
, d.[FREIGHT_FLAG]
, d.[COD_FLAG]
, d.[CID]
, d.[StoreSale_Flag]
, d.[YardCode]
, d.[Packing_Notes]
, d.[Balance]
, d.[RefundTotal]
, d.[Invoice_Notes]
, d.[Programming_Ver]
, d.[Sub_Taxable]
, d.[OrderedBy]
, d.[Date_Due]
, d.[O_Sub]
, d.[O_Disc]
, d.[O_Post]
, d.[O_Tax]
, d.[O_SubTaxable]
, d.[O_Total]
, d.[SUBTOT]
, d.[USERINITIALS]
, d.[ShippedBy]
, d.[TaxStateRate]
, d.[TaxCountyRate]
, d.[TaxCityRate]
, d.[TaxSpecialRate]
, d.[TaxByZipID]
, d.[InvoiceNum]
, d.[ShipToPO]
, d.[Form4473]
, d.[CalcTax]
, d.[CreatedBy]
, d.[CreatedDate]
, d.[ChangedBy]
, d.[ChangedDate]
, d.[Version]
, d.[ForceTax]
, d.[NoPLPrint]
, d.[ReleaseDate]
, d.[SAddress]
, d.[SAddress2]
, d.[SCity]
, d.[SState]
, d.[SZip]
, d.[SCountry]
, d.[ExternalOrderType]
, d.[ExternalOrdNum]
, d.[CCToken]
, d.[CCApprovalCode]
, d.[NoTaxChange]
, d.[CCRetRef]
, d.[Sub_Labor]
, d.[Sub_LaborRepair]
, d.[Sub_Apparel]
, d.[CouponDiscount]
, d.[ReadyToShip]
, d.[PostType]
, d.[ShipDestinationType]
, d.[ShipUPS]
, d.[IAS_Sub]
, d.[IAS_Disc]
, d.[IAS_Post]
, d.[IAS_Tax]
, d.[IAS_OTotal]
, d.[IAS_Sub_Taxable]
, d.[IAS_Sub_Labor]
, d.[IAS_Sub_LaborRepair]
, d.[IAS_Sub_Apparel]
, d.[NumberOfCartons]
, d.[Packed]
, d.[ShipLocation]
, d.[CustApproval]
, d.[MgrApproval]
, d.[ReadyToShipDate]
, d.[CancelAfter]
, d.[AuthorizedAmount]
, d.[AVSResult]
, d.[CCTranStatus]
, d.[CCLatestTransID]
, d.[AdultSig]
, d.[CustomerSelectedPostType]
, d.[FreightTax]
, d.[NFAStamp]
, SYSTEM_USER
FROM deleted d;

  --IF COLUMNS_UPDATED() IS NOT NULL
  --BEGIN
  --  UPDATE CUSTINFO 
  --  SET StartTime = getdate()
  --  FROM inserted
  --  WHERE CUSTINFO.Recnum = inserted.recnum
  --END;
END
GO
