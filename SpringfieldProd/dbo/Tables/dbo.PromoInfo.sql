CREATE TABLE [dbo].[PromoInfo] (
    [ID]                  BIGINT          IDENTITY (1, 1) NOT NULL,
    [Salutation]          VARCHAR (4)     NULL,
    [FirstName]           VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [MiddleInitial]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [LastName]            VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [Address1]            VARCHAR (30)    NULL,
    [Address2]            VARCHAR (30)    NULL,
    [City]                VARCHAR (30)    NULL,
    [State]               VARCHAR (2)     NULL,
    [Zip]                 VARCHAR (10)    NULL,
    [Phone]               VARCHAR (20)    NULL,
    [Contact]             VARCHAR (1)     NULL,
    [Email]               VARCHAR (100)   NULL,
    [DateSubmitted]       DATETIME        NULL,
    [SubmissionType]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [Status]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SerialNumber]        VARCHAR (14)    DEFAULT (' ') NOT NULL,
    [Caliber]             VARCHAR (10)    NULL,
    [PurchaseDate]        DATETIME        NULL,
    [StoreName]           VARCHAR (100)   NULL,
    [StoreAddress1]       VARCHAR (30)    NULL,
    [StoreAddress2]       VARCHAR (30)    NULL,
    [StoreCity]           VARCHAR (30)    NULL,
    [StoreState]          VARCHAR (2)     NULL,
    [StoreZip]            VARCHAR (10)    NULL,
    [StorePhone]          VARCHAR (20)    NULL,
    [ImageName]           VARCHAR (30)    NULL,
    [OwnSAProducts]       VARCHAR (1)     NULL,
    [OwnXD]               TINYINT         NULL,
    [OwnXDm]              TINYINT         NULL,
    [Own1911]             TINYINT         NULL,
    [OwnM1A]              TINYINT         NULL,
    [NextSAPurchase]      VARCHAR (15)    NULL,
    [FindOutPromo]        VARCHAR (20)    NULL,
    [FindOutOther]        VARCHAR (50)    NULL,
    [PurchFor1]           VARCHAR (30)    NULL,
    [PurchFor2]           VARCHAR (30)    NULL,
    [PurchFor3]           VARCHAR (30)    NULL,
    [PurchFor4]           VARCHAR (30)    NULL,
    [PurchFor5]           VARCHAR (30)    NULL,
    [PurchFor6]           VARCHAR (30)    NULL,
    [PurchFor7]           VARCHAR (30)    NULL,
    [PurchFor8]           VARCHAR (30)    NULL,
    [PurchFor9]           VARCHAR (30)    NULL,
    [Decision1]           VARCHAR (30)    NULL,
    [Decision2]           VARCHAR (30)    NULL,
    [Decision3]           VARCHAR (30)    NULL,
    [Decision4]           VARCHAR (30)    NULL,
    [Decision5]           VARCHAR (30)    NULL,
    [Decision6]           VARCHAR (30)    NULL,
    [Decision7]           VARCHAR (30)    NULL,
    [Decision8]           VARCHAR (30)    NULL,
    [Decision9]           VARCHAR (30)    NULL,
    [OrdNum]              NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [CustID]              VARCHAR (10)    NULL,
    [UserName]            VARCHAR (20)    NULL,
    [DeclineEmail]        VARCHAR (1)     NULL,
    [DateApproved]        DATETIME        NULL,
    [SysPackage]          VARCHAR (20)    NULL,
    [UserPackage]         VARCHAR (20)    NULL,
    [PromoID]             BIGINT          DEFAULT ((0)) NOT NULL,
    [Notes]               VARCHAR (512)   NULL,
    [SprNum]              VARCHAR (20)    NULL,
    [OwnXDs]              TINYINT         NULL,
    [InternalNotes]       VARCHAR (512)   NULL,
    [ShipDestinationType] VARCHAR (1)     NULL,
    [SentEmail]           VARCHAR (1)     NULL,
    [EnteredBy]           VARCHAR (10)    NULL,
    [OwnSaint]            SMALLINT        DEFAULT ((0)) NULL,
    [Gender]              CHAR (1)        DEFAULT ('') NULL,
    [BillName]            VARCHAR (50)    CONSTRAINT [DF_PromoInfo_BillName] DEFAULT ('') NOT NULL,
    [BillAddress1]        VARCHAR (30)    CONSTRAINT [DF_PromoInfo_BillAddress1] DEFAULT ('') NOT NULL,
    [BillAddress2]        VARCHAR (30)    CONSTRAINT [DF_PromoInfo_BIllAddress2] DEFAULT ('') NOT NULL,
    [BillCity]            VARCHAR (30)    CONSTRAINT [DF_PromoInfo_BillCity] DEFAULT ('') NOT NULL,
    [BillState]           VARCHAR (2)     CONSTRAINT [DF_PromoInfo_BillState] DEFAULT ('') NOT NULL,
    [BillZip]             VARCHAR (10)    CONSTRAINT [DF_PromoInfo_BillZip] DEFAULT ('') NOT NULL,
    [BCustID]             VARCHAR (10)    CONSTRAINT [DF_PromoInfo_BCustID] DEFAULT ('') NOT NULL,
    [SubTotal]            NUMERIC (8, 2)  NULL,
    [Shipping]            NUMERIC (6, 2)  NULL,
    [Tax]                 NUMERIC (6, 2)  NULL,
    [OrderTotal]          NUMERIC (10, 2) NULL,
    [CardNum]             VARCHAR (19)    NULL,
    [CardKind]            VARCHAR (1)     NULL,
    [CCToken]             VARCHAR (25)    NULL,
    [AVSResult]           VARCHAR (1)     NULL,
    [AvaStatus]           VARCHAR (20)    NULL,
    [AvaType]             VARCHAR (20)    NULL,
    [CardExp]             VARCHAR (4)     NULL,
    CONSTRAINT [PromoInfo_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);








GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfo_INDEX02]
    ON [dbo].[PromoInfo]([PromoID] ASC, [SerialNumber] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfo_INDEX06]
    ON [dbo].[PromoInfo]([PromoID] ASC, [OrdNum] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfo_INDEX03]
    ON [dbo].[PromoInfo]([PromoID] ASC, [LastName] ASC, [FirstName] ASC, [MiddleInitial] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfo_INDEX04]
    ON [dbo].[PromoInfo]([PromoID] ASC, [SubmissionType] ASC, [Status] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfo_INDEX05]
    ON [dbo].[PromoInfo]([PromoID] ASC, [Status] ASC, [SubmissionType] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfo_INDEX07]
    ON [dbo].[PromoInfo]([SerialNumber] ASC, [PromoID] ASC);


GO
CREATE STATISTICS [_WA_Sys_00000010_4A7D1573]
    ON [dbo].[PromoInfo]([Status]);


GO
CREATE STATISTICS [_WA_Sys_0000000F_4A7D1573]
    ON [dbo].[PromoInfo]([SubmissionType]);


GO
CREATE STATISTICS [_WA_Sys_00000005_4A7D1573]
    ON [dbo].[PromoInfo]([LastName]);


GO
CREATE STATISTICS [_WA_Sys_00000004_4A7D1573]
    ON [dbo].[PromoInfo]([MiddleInitial]);


GO
CREATE STATISTICS [_WA_Sys_00000003_4A7D1573]
    ON [dbo].[PromoInfo]([FirstName]);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoInfo_INDEX08]
    ON [dbo].[PromoInfo]([OrdNum] ASC, [ID] ASC) WITH (FILLFACTOR = 100);



