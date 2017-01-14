CREATE TABLE [dbo].[EDIRevisedHeader] (
    [ID]                      BIGINT          IDENTITY (1, 1) NOT NULL,
    [TradingPartnerId]        VARCHAR (20)    NOT NULL,
    [PurchaseOrderNumber]     VARCHAR (20)    NOT NULL,
    [TsetPurposeCode]         VARCHAR (2)     NULL,
    [PurchaseOrderTypeCode]   VARCHAR (2)     NULL,
    [POTypeDescription]       VARCHAR (60)    NULL,
    [PurchaseOrderDate]       VARCHAR (10)    NULL,
    [PurchaseOrderTime]       VARCHAR (8)     NULL,
    [Department]              VARCHAR (10)    NULL,
    [Vendor]                  VARCHAR (10)    NULL,
    [CustomerAccountNumber]   VARCHAR (10)    NULL,
    [CustomerOrderNumber]     VARCHAR (10)    NULL,
    [TermsType]               VARCHAR (2)     NULL,
    [TermsBasisDateCode]      VARCHAR (2)     NULL,
    [TermsDiscountPercentage] VARCHAR (2)     NULL,
    [TermsDiscountDate]       VARCHAR (10)    NULL,
    [TermsDiscountDueDays]    VARCHAR (4)     NULL,
    [TermsNetDueDate]         VARCHAR (10)    NULL,
    [TermsNetDueDays]         VARCHAR (4)     NULL,
    [TermsDiscountAmount]     NUMERIC (8, 2)  NULL,
    [TermsDescription]        VARCHAR (20)    NULL,
    [DateTimeQualifier1]      VARCHAR (4)     NULL,
    [Date1]                   VARCHAR (10)    NULL,
    [Time1]                   VARCHAR (8)     NULL,
    [DateTimeQualifier2]      VARCHAR (4)     NULL,
    [Date2]                   VARCHAR (10)    NULL,
    [Time2]                   VARCHAR (8)     NULL,
    [ContactTypeCode1]        VARCHAR (2)     NULL,
    [ContactName1]            VARCHAR (20)    NULL,
    [AddressTypeCode1]        VARCHAR (2)     NULL,
    [LocationCodeQualifier1]  VARCHAR (2)     NULL,
    [AddressLocationNumber1]  VARCHAR (20)    NULL,
    [AddressName1]            VARCHAR (40)    NULL,
    [AddressAlternateName1]   VARCHAR (40)    NULL,
    [Address11]               VARCHAR (40)    NULL,
    [Address21]               VARCHAR (40)    NULL,
    [City1]                   VARCHAR (30)    NULL,
    [State1]                  VARCHAR (2)     NULL,
    [PostalCode1]             VARCHAR (5)     NULL,
    [Country1]                VARCHAR (4)     NULL,
    [AddressTypeCode2]        VARCHAR (2)     NULL,
    [LocationCodeQualifier2]  VARCHAR (2)     NULL,
    [AddressLocationNumber2]  VARCHAR (20)    NULL,
    [AddressName2]            VARCHAR (40)    NULL,
    [AddressAlternateName2]   VARCHAR (40)    NULL,
    [Address12]               VARCHAR (40)    NULL,
    [Address22]               VARCHAR (40)    NULL,
    [City2]                   VARCHAR (30)    NULL,
    [State2]                  VARCHAR (2)     NULL,
    [PostalCode2]             VARCHAR (5)     NULL,
    [Country2]                VARCHAR (4)     NULL,
    [ContactTypeCode2]        VARCHAR (10)    NULL,
    [ContactName2]            VARCHAR (40)    NULL,
    [FOPPayCode]              VARCHAR (2)     NULL,
    [FOBLocationQualifier]    VARCHAR (2)     NULL,
    [FOBLocationDescription]  VARCHAR (10)    NULL,
    [CarrierTransMethodCode]  VARCHAR (1)     NULL,
    [CarrierAlphaCode]        VARCHAR (4)     NULL,
    [CarrierRouting]          VARCHAR (8)     NULL,
    [ServiceLevelCode]        VARCHAR (2)     NULL,
    [ReferenceQual]           VARCHAR (2)     NULL,
    [ReferenceID]             VARCHAR (12)    NULL,
    [Description]             VARCHAR (30)    NULL,
    [NoteCode]                VARCHAR (3)     NULL,
    [NoteInformationField]    VARCHAR (500)   NULL,
    [TaxTypeCode]             VARCHAR (2)     NULL,
    [TaxAmount]               VARCHAR (4)     NULL,
    [TaxPercent]              VARCHAR (20)    NULL,
    [JurisdictionQual]        VARCHAR (2)     NULL,
    [TaxExemptCode]           VARCHAR (2)     NULL,
    [TaxID]                   VARCHAR (12)    NULL,
    [TotalAmount]             NUMERIC (8, 2)  NULL,
    [TotalLineItemNumber]     BIGINT          NULL,
    [TotalQuantity]           BIGINT          NULL,
    [Processed]               DATE            CONSTRAINT [DF__EDIRevise__Proce__4C056B32] DEFAULT ('0001-01-01') NOT NULL,
    [Received]                DATE            CONSTRAINT [DF__EDIRevise__Recei__4CF98F6B] DEFAULT ('0001-01-01') NOT NULL,
    [Priority]                SMALLINT        CONSTRAINT [DF__EDIRevise__Prior__4DEDB3A4] DEFAULT ((0)) NOT NULL,
    [CustInfoShipID]          VARCHAR (10)    NULL,
    [CustInfoBillID]          VARCHAR (10)    NULL,
    [BillAddrSameShip]        VARCHAR (1)     NULL,
    [User_Notes]              VARCHAR (500)   NULL,
    [AIMOrdNum]               NUMERIC (10, 2) CONSTRAINT [DF__EDIRevise__AIMOr__4EE1D7DD] DEFAULT ((0)) NOT NULL,
    [EDIFileName]             VARCHAR (50)    CONSTRAINT [DF__EDIRevise__EDIFi__4FD5FC16] DEFAULT (' ') NOT NULL,
    [DepartmentDescription]   VARCHAR (50)    NULL,
    [ChangeOrderSeqNumber]    VARCHAR (10)    NULL,
    [POChangeDate]            DATE            NULL,
    CONSTRAINT [EDIRevisedHeader_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [EDIRevisedHeader_INDEX02]
    ON [dbo].[EDIRevisedHeader]([Processed] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDIRevisedHeader_INDEX03]
    ON [dbo].[EDIRevisedHeader]([Processed] ASC, [Priority] ASC, [Received] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDIRevisedHeader_INDEX04]
    ON [dbo].[EDIRevisedHeader]([AIMOrdNum] ASC, [Received] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDIRevisedHeader_INDEX05]
    ON [dbo].[EDIRevisedHeader]([TradingPartnerId] ASC, [PurchaseOrderNumber] ASC, [ID] ASC);

