CREATE TABLE [dbo].[CustWOHeader] (
    [Type]               VARCHAR (1)     NOT NULL,
    [CustWONum]          NUMERIC (12, 2) NOT NULL,
    [BCustID]            VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [SCustID]            VARCHAR (10)    NULL,
    [EnteredDate]        DATE            NULL,
    [ShipVia]            VARCHAR (12)    NULL,
    [OrderedBy]          VARCHAR (12)    NULL,
    [EmpID]              VARCHAR (4)     NULL,
    [WorkDoneBy]         VARCHAR (4)     NULL,
    [CustWOTotal]        NUMERIC (10, 2) NULL,
    [LastPartsNum]       INT             NULL,
    [LastLaborNum]       INT             NULL,
    [LaborTotal]         NUMERIC (10, 2) NULL,
    [LaborNonTax]        NUMERIC (10, 2) NULL,
    [PartsTotal]         NUMERIC (10, 2) NULL,
    [SalesTax]           NUMERIC (8, 2)  NULL,
    [ExtraCharge]        NUMERIC (8, 2)  NULL,
    [Status]             VARCHAR (1)     NULL,
    [Paid]               NUMERIC (10, 2) NULL,
    [BalanceDue]         NUMERIC (10, 2) NULL,
    [Description]        VARCHAR (1024)  NULL,
    [PO]                 VARCHAR (50)    NULL,
    [Shipping]           NUMERIC (8, 2)  NULL,
    [ExtraDesc]          VARCHAR (40)    NULL,
    [AIMOrdNum]          NUMERIC (10, 2) NULL,
    [Serial]             VARCHAR (14)    NULL,
    [ReceivedDate]       DATE            NULL,
    [CompletedDate]      DATE            NULL,
    [YardCode]           VARCHAR (4)     NULL,
    [ProdType]           VARCHAR (1)     NULL,
    [ShipEmail]          VARCHAR (100)   NULL,
    [ShipMethod]         VARCHAR (1)     NULL,
    [LabelURL]           VARCHAR (150)   NULL,
    [URLUser]            VARCHAR (30)    NULL,
    [URLPassword]        VARCHAR (30)    NULL,
    [CreatedBy]          VARCHAR (4)     NULL,
    [CreatedDate]        DATE            NULL,
    [ChangedBy]          VARCHAR (4)     NULL,
    [ChangedDate]        DATE            NULL,
    [FedExTracking]      VARCHAR (50)    NULL,
    [InternalNotes]      VARCHAR (1024)  NULL,
    [SprNum]             VARCHAR (20)    NULL,
    [TechNotes]          VARCHAR (1024)  NULL,
    [RecdWithNotes]      VARCHAR (1024)  NULL,
    [CallbeforeShipping] VARCHAR (1)     NULL,
    [LawEnforcement]     VARCHAR (1)     NULL,
    CONSTRAINT [CustWOHeader_INDEX01] PRIMARY KEY CLUSTERED ([CustWONum] ASC)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [CustWOHeader_INDEX02]
    ON [dbo].[CustWOHeader]([BCustID] ASC, [CustWONum] ASC);

