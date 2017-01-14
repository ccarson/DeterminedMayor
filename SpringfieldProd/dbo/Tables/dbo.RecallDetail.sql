CREATE TABLE [dbo].[RecallDetail] (
    [RecallName]          VARCHAR (20)  CONSTRAINT [DF__RecallDet__Recal__471FEF2D] DEFAULT (' ') NOT NULL,
    [Serial]              VARCHAR (14)  CONSTRAINT [DF__RecallDet__Seria__48141366] DEFAULT (' ') NOT NULL,
    [SerialNoSpaces]      VARCHAR (14)  CONSTRAINT [DF__RecallDet__Seria__4908379F] DEFAULT (' ') NOT NULL,
    [SprNum]              VARCHAR (20)  NULL,
    [FName]               VARCHAR (16)  NULL,
    [LName]               VARCHAR (20)  NULL,
    [MInitial]            VARCHAR (1)   NULL,
    [Address1]            VARCHAR (35)  NULL,
    [Address2]            VARCHAR (35)  NULL,
    [City]                VARCHAR (20)  NULL,
    [State]               VARCHAR (2)   NULL,
    [Zip]                 VARCHAR (10)  NULL,
    [Country]             VARCHAR (30)  NULL,
    [Phone]               VARCHAR (20)  NULL,
    [Email]               VARCHAR (100) NULL,
    [Status]              VARCHAR (1)   CONSTRAINT [DF_RecallDetail_Status] DEFAULT (' ') NOT NULL,
    [StatusDate]          DATETIME2 (3) NULL,
    [Notes]               VARCHAR (512) NULL,
    [CustID]              VARCHAR (10)  CONSTRAINT [DF_RecallDetail_CustID] DEFAULT (' ') NOT NULL,
    [RMA]                 INT           CONSTRAINT [DF_RecallDetail_RMA] DEFAULT ((0)) NOT NULL,
    [ResOrBus]            VARCHAR (1)   NULL,
    [InternalNotes]       VARCHAR (512) NULL,
    [CreatedDate]         DATETIME2 (3) NULL,
    [CreatedBy]           VARCHAR (4)   NULL,
    [EmailSent]           VARCHAR (1)   NULL,
    [OptInRecallEmails]   VARCHAR (1)   NULL,
    [OptInEmails]         VARCHAR (1)   NULL,
    [IPAddress]           VARCHAR (20)  NULL,
    [DealerID]            VARCHAR (10)  NULL,
    [FBRecnum]            BIGINT        NULL,
    [Source]              VARCHAR (1)   NULL,
    [RecallDealerID]      INT           CONSTRAINT [DF__RecallDet__Recal__49283330] DEFAULT ((0)) NOT NULL,
    [Distributor]         VARCHAR (30)  NULL,
    [DateSold]            DATETIME      NULL,
    [ShipDestinationType] VARCHAR (1)   NULL,
    [ChangedDate]         DATETIME      NULL,
    [ChangedBy]           VARCHAR (4)   NULL,
    [Contacted]           VARCHAR (1)   NULL,
    CONSTRAINT [RecallDetail_INDEX01] PRIMARY KEY CLUSTERED ([RecallName] ASC, [SerialNoSpaces] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_RecallDetail_RecallName] FOREIGN KEY ([RecallName]) REFERENCES [dbo].[Recall] ([RecallName])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDetail_INDEX02]
    ON [dbo].[RecallDetail]([RecallName] ASC, [SerialNoSpaces] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDetail_INDEX03]
    ON [dbo].[RecallDetail]([SerialNoSpaces] ASC, [RecallName] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDetail_INDEX04]
    ON [dbo].[RecallDetail]([RecallName] ASC, [Status] ASC, [SerialNoSpaces] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDetail_INDEX05]
    ON [dbo].[RecallDetail]([RecallName] ASC, [CustID] ASC, [SerialNoSpaces] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDetail_INDEX06]
    ON [dbo].[RecallDetail]([RecallName] ASC, [RMA] ASC, [SerialNoSpaces] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDetail_INDEX07]
    ON [dbo].[RecallDetail]([RecallDealerID] ASC, [SerialNoSpaces] ASC, [RecallName] ASC) WITH (FILLFACTOR = 70);

