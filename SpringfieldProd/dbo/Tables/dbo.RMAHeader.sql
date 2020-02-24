CREATE TABLE [dbo].[RMAHeader] (
    [ID]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [RMANumber]           INT            CONSTRAINT [DF_RMAHeader_RMANumber] DEFAULT ('0') NOT NULL,
    [CurrentState]        CHAR (1)       CONSTRAINT [DF_RMAHeader_CurrentState] DEFAULT ('') NOT NULL,
    [CustID]              CHAR (10)      CONSTRAINT [DF_RMAHeader_CustID] DEFAULT ('') NOT NULL,
    [CustomerName]        VARCHAR (36)   CONSTRAINT [DF_RMAHeader_CustomerName] DEFAULT ('') NOT NULL,
    [CustomerNote]        VARCHAR (512)  CONSTRAINT [DF_RMAHeader_CustomerNote] DEFAULT ('') NOT NULL,
    [Reason]              VARCHAR (40)   CONSTRAINT [DF_RMAHeader_Reason] DEFAULT ('') NOT NULL,
    [ReturnSameAddress]   CHAR (1)       CONSTRAINT [DF_RMAHeader_ReturnSameAddress] DEFAULT ('Y') NOT NULL,
    [ReturnCustID]        CHAR (10)      CONSTRAINT [DF_RMAHeader_ReturnCustID] DEFAULT ('') NOT NULL,
    [LabelItemType]       CHAR (1)       CONSTRAINT [DF_RMAHeader_LabelItemType] DEFAULT ('') NOT NULL,
    [LabelShipMethod]     CHAR (2)       CONSTRAINT [DF_RMAHeader_LabelShipMethod] DEFAULT ('') NOT NULL,
    [LabelEmail]          VARCHAR (100)  CONSTRAINT [DF_RMAHeader_LabelEmail] DEFAULT ('') NOT NULL,
    [LabelResidential]    CHAR (10)      CONSTRAINT [DF_RMAHeader_LabelResidential] DEFAULT ('') NOT NULL,
    [LabelTrackingNumber] VARCHAR (50)   CONSTRAINT [DF_RMAHeader_LabelTrackingNumber] DEFAULT ('') NOT NULL,
    [LabelURL]            VARCHAR (150)  CONSTRAINT [DF_RMAHeader_LabelURL] DEFAULT ('') NOT NULL,
    [CreatedBy]           CHAR (4)       CONSTRAINT [DF_RMAHeader_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]         DATETIME       CONSTRAINT [DF_RMAHeader_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [ChangedBy]           CHAR (4)       CONSTRAINT [DF_RMAHeader_ChangedBy] DEFAULT ('') NOT NULL,
    [ChangedDate]         DATETIME       CONSTRAINT [DF_RMAHeader_ChangedDate] DEFAULT ('1753-01-01') NOT NULL,
    [CompletedBy]         CHAR (4)       CONSTRAINT [DF_RMAHeader_CompletedBy] DEFAULT ('') NOT NULL,
    [CompletedDate]       DATETIME       CONSTRAINT [DF_RMAHeader_CompletedDate] DEFAULT ('1753-01-01') NOT NULL,
    [BillableHours]       NUMERIC (6, 2) CONSTRAINT [DF_RMAHeader_BillableHours] DEFAULT ((0)) NOT NULL,
    [WarrantyHours]       NUMERIC (6, 2) CONSTRAINT [DF_RMAHeader_WarrantyHours] DEFAULT ((0)) NOT NULL,
    [HubspotID]           NUMERIC (14)   CONSTRAINT [DF_RMAHeader_HubspotID] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [RMAHeader_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAHeader_INDEX04]
    ON [dbo].[RMAHeader]([CustomerName] ASC, [ID] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAHeader_INDEX03]
    ON [dbo].[RMAHeader]([CustID] ASC, [ID] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAHeader_INDEX02]
    ON [dbo].[RMAHeader]([RMANumber] ASC) WITH (FILLFACTOR = 100);

