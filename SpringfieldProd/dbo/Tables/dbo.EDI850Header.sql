CREATE TABLE [dbo].[EDI850Header] (
    [ID]                      BIGINT          IDENTITY (1, 1) NOT NULL,
    [TradingPartnerId]        VARCHAR (20)    CONSTRAINT [DF__EDI850Hea__Tradi__3E2C4D27] DEFAULT ('') NULL,
    [PurchaseOrderNumber]     VARCHAR (20)    CONSTRAINT [DF__EDI850Hea__Purch__3F207160] DEFAULT ('') NULL,
    [TsetPurposeCode]         VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__TsetP__5D0FFBA3] DEFAULT ('') NULL,
    [PurchaseOrderTypeCode]   VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Purch__5E041FDC] DEFAULT ('') NULL,
    [POTypeDescription]       VARCHAR (60)    CONSTRAINT [DF__EDI850Hea__POTyp__5EF84415] DEFAULT ('') NULL,
    [PurchaseOrderDate]       VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Purch__5FEC684E] DEFAULT ('') NULL,
    [PurchaseOrderTime]       VARCHAR (8)     CONSTRAINT [DF__EDI850Hea__Purch__60E08C87] DEFAULT ('') NULL,
    [Department]              VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Depar__61D4B0C0] DEFAULT ('') NULL,
    [Vendor]                  VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Vendo__62C8D4F9] DEFAULT ('') NULL,
    [CustomerAccountNumber]   VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Custo__63BCF932] DEFAULT ('') NULL,
    [CustomerOrderNumber]     VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Custo__64B11D6B] DEFAULT ('') NULL,
    [TermsType]               VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Terms__65A541A4] DEFAULT ('') NULL,
    [TermsBasisDateCode]      VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Terms__669965DD] DEFAULT ('') NULL,
    [TermsDiscountPercentage] VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Terms__678D8A16] DEFAULT ('') NULL,
    [TermsDiscountDate]       VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Terms__6881AE4F] DEFAULT ('') NULL,
    [TermsDiscountDueDays]    VARCHAR (4)     CONSTRAINT [DF__EDI850Hea__Terms__6975D288] DEFAULT ('') NULL,
    [TermsNetDueDate]         VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Terms__6A69F6C1] DEFAULT ('') NULL,
    [TermsNetDueDays]         VARCHAR (4)     CONSTRAINT [DF__EDI850Hea__Terms__6B5E1AFA] DEFAULT ('') NULL,
    [TermsDiscountAmount]     NUMERIC (8, 2)  CONSTRAINT [DF__EDI850Hea__Terms__6C523F33] DEFAULT ((0)) NULL,
    [TermsDescription]        VARCHAR (20)    CONSTRAINT [DF__EDI850Hea__Terms__6D46636C] DEFAULT ('') NULL,
    [DateTimeQualifier1]      VARCHAR (4)     CONSTRAINT [DF__EDI850Hea__DateT__6E3A87A5] DEFAULT ('') NULL,
    [Date1]                   VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Date1__6F2EABDE] DEFAULT ('') NULL,
    [Time1]                   VARCHAR (8)     CONSTRAINT [DF__EDI850Hea__Time1__7022D017] DEFAULT ('') NULL,
    [DateTimeQualifier2]      VARCHAR (4)     CONSTRAINT [DF__EDI850Hea__DateT__7116F450] DEFAULT ('') NULL,
    [Date2]                   VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Date2__720B1889] DEFAULT ('') NULL,
    [Time2]                   VARCHAR (8)     CONSTRAINT [DF__EDI850Hea__Time2__72FF3CC2] DEFAULT ('') NULL,
    [ContactTypeCode1]        VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Conta__73F360FB] DEFAULT ('') NULL,
    [ContactName1]            VARCHAR (20)    CONSTRAINT [DF__EDI850Hea__Conta__74E78534] DEFAULT ('') NULL,
    [AddressTypeCode1]        VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Addre__75DBA96D] DEFAULT ('') NULL,
    [LocationCodeQualifier1]  VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Locat__76CFCDA6] DEFAULT ('') NULL,
    [AddressLocationNumber1]  VARCHAR (20)    CONSTRAINT [DF__EDI850Hea__Addre__77C3F1DF] DEFAULT ('') NULL,
    [AddressName1]            VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Addre__78B81618] DEFAULT ('') NULL,
    [AddressAlternateName1]   VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Addre__79AC3A51] DEFAULT ('') NULL,
    [Address11]               VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Addre__7AA05E8A] DEFAULT ('') NULL,
    [Address21]               VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Addre__7B9482C3] DEFAULT ('') NULL,
    [City1]                   VARCHAR (30)    CONSTRAINT [DF__EDI850Hea__City1__7C88A6FC] DEFAULT ('') NULL,
    [State1]                  VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__State__7D7CCB35] DEFAULT ('') NULL,
    [PostalCode1]             VARCHAR (5)     CONSTRAINT [DF__EDI850Hea__Posta__7E70EF6E] DEFAULT ('') NULL,
    [Country1]                VARCHAR (4)     CONSTRAINT [DF__EDI850Hea__Count__7F6513A7] DEFAULT ('') NULL,
    [AddressTypeCode2]        VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Addre__005937E0] DEFAULT ('') NULL,
    [LocationCodeQualifier2]  VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Locat__014D5C19] DEFAULT ('') NULL,
    [AddressLocationNumber2]  VARCHAR (20)    CONSTRAINT [DF__EDI850Hea__Addre__02418052] DEFAULT ('') NULL,
    [AddressName2]            VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Addre__0335A48B] DEFAULT ('') NULL,
    [AddressAlternateName2]   VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Addre__0429C8C4] DEFAULT ('') NULL,
    [Address12]               VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Addre__051DECFD] DEFAULT ('') NULL,
    [Address22]               VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Addre__06121136] DEFAULT ('') NULL,
    [City2]                   VARCHAR (30)    CONSTRAINT [DF__EDI850Hea__City2__0706356F] DEFAULT ('') NULL,
    [State2]                  VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__State__07FA59A8] DEFAULT ('') NULL,
    [PostalCode2]             VARCHAR (5)     CONSTRAINT [DF__EDI850Hea__Posta__08EE7DE1] DEFAULT ('') NULL,
    [Country2]                VARCHAR (4)     CONSTRAINT [DF__EDI850Hea__Count__09E2A21A] DEFAULT ('') NULL,
    [ContactTypeCode2]        VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__Conta__0AD6C653] DEFAULT ('') NULL,
    [ContactName2]            VARCHAR (40)    CONSTRAINT [DF__EDI850Hea__Conta__0BCAEA8C] DEFAULT ('') NULL,
    [FOPPayCode]              VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__FOPPa__0CBF0EC5] DEFAULT ('') NULL,
    [FOBLocationQualifier]    VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__FOBLo__0DB332FE] DEFAULT ('') NULL,
    [FOBLocationDescription]  VARCHAR (10)    CONSTRAINT [DF__EDI850Hea__FOBLo__0EA75737] DEFAULT ('') NULL,
    [CarrierTransMethodCode]  VARCHAR (1)     CONSTRAINT [DF__EDI850Hea__Carri__0F9B7B70] DEFAULT ('') NULL,
    [CarrierAlphaCode]        VARCHAR (4)     CONSTRAINT [DF__EDI850Hea__Carri__108F9FA9] DEFAULT ('') NULL,
    [CarrierRouting]          VARCHAR (8)     CONSTRAINT [DF__EDI850Hea__Carri__1183C3E2] DEFAULT ('') NULL,
    [ServiceLevelCode]        VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Servi__1277E81B] DEFAULT ('') NULL,
    [ReferenceQual]           VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Refer__136C0C54] DEFAULT ('') NULL,
    [ReferenceID]             VARCHAR (12)    CONSTRAINT [DF__EDI850Hea__Refer__1460308D] DEFAULT ('') NULL,
    [Description]             VARCHAR (30)    CONSTRAINT [DF__EDI850Hea__Descr__155454C6] DEFAULT ('') NULL,
    [NoteCode]                VARCHAR (3)     CONSTRAINT [DF__EDI850Hea__NoteC__164878FF] DEFAULT ('') NULL,
    [NoteInformationField]    VARCHAR (500)   CONSTRAINT [DF__EDI850Hea__NoteI__173C9D38] DEFAULT ('') NULL,
    [TaxTypeCode]             VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__TaxTy__1830C171] DEFAULT ('') NULL,
    [TaxAmount]               VARCHAR (4)     CONSTRAINT [DF__EDI850Hea__TaxAm__1924E5AA] DEFAULT ('') NULL,
    [TaxPercent]              VARCHAR (20)    CONSTRAINT [DF__EDI850Hea__TaxPe__1A1909E3] DEFAULT ('') NULL,
    [JurisdictionQual]        VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__Juris__1B0D2E1C] DEFAULT ('') NULL,
    [TaxExemptCode]           VARCHAR (2)     CONSTRAINT [DF__EDI850Hea__TaxEx__1C015255] DEFAULT ('') NULL,
    [TaxID]                   VARCHAR (12)    CONSTRAINT [DF__EDI850Hea__TaxID__1CF5768E] DEFAULT ('') NULL,
    [TotalAmount]             NUMERIC (8, 2)  CONSTRAINT [DF__EDI850Hea__Total__1DE99AC7] DEFAULT ((0)) NULL,
    [TotalLineItemNumber]     BIGINT          CONSTRAINT [DF__EDI850Hea__Total__1EDDBF00] DEFAULT ((0)) NULL,
    [TotalQuantity]           BIGINT          CONSTRAINT [DF__EDI850Hea__Total__1FD1E339] DEFAULT ((0)) NULL,
    [Processed]               DATETIME        CONSTRAINT [DF__EDI850Hea__Proce__20C60772] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [Received]                DATETIME        CONSTRAINT [DF__EDI850Hea__Recei__21BA2BAB] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [Priority]                TINYINT         CONSTRAINT [DF__EDI850Hea__Prior__22AE4FE4] DEFAULT ((0)) NOT NULL,
    [CustInfoShipID]          VARCHAR (10)    NULL,
    [CustInfoBillID]          VARCHAR (10)    NULL,
    [BillAddrSameShip]        VARCHAR (1)     NULL,
    [User_Notes]              VARCHAR (500)   NULL,
    [AIMOrdNum]               NUMERIC (10, 2) NOT NULL,
    [EDIFileName]             VARCHAR (50)    NULL,
    [DepartmentDescription]   VARCHAR (50)    NULL,
    [Acknowledged]            VARCHAR (1)     NULL,
    [Division]                VARCHAR (20)    NULL,
    [RefBB]                   VARCHAR (15)    NULL,
    CONSTRAINT [EDI850Header_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO

CREATE UNIQUE NONCLUSTERED INDEX [EDI850Header_INDEX02]
    ON [dbo].[EDI850Header]([Processed] ASC, [ID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [EDI850Header_INDEX03]
    ON [dbo].[EDI850Header]([Processed] ASC, [Priority] ASC, [Received] ASC, [ID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [EDI850Header_INDEX04]
    ON [dbo].[EDI850Header]([AIMOrdNum] ASC, [ID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [EDI850Header_INDEX05]
    ON [dbo].[EDI850Header]([TradingPartnerId] ASC, [PurchaseOrderNumber] ASC);

GO
CREATE UNIQUE NONCLUSTERED INDEX [EDI850Header_INDEX06]
    ON [dbo].[EDI850Header]([PurchaseOrderNumber] ASC, [TradingPartnerId] ASC) WITH (FILLFACTOR = 100);

