CREATE TABLE [dbo].[POHEADER] (
    [Recnum]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [VENDOR_ID]        VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [PO_#]             DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [UNUSED]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PO_TYPE]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [ORDER_DATE]       DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [DATE_REQUIRED]    DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [ORDER_BY]         VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [ORDER_WITH]       VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [NUMITEMS]         DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [NUMCLOSED]        DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [FOB]              VARCHAR (16)    DEFAULT (' ') NOT NULL,
    [SHIP_VIA]         VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [CONFIRMING_FLAG]  VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SHIPTO_FLAG]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [READY_TOPRINT]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PRINT_FLAG]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [ORDER_UD_FLAG]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CLOSED_FLAG]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EDIT_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [RMA_NUMBER]       VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [WO_#]             DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [REQUEST_BY]       VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [INQUIRY_NAME]     VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [COST_TYPE]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EXTRA_FLAG]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [WO_LINE#]         DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [POTotal]          DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [VendorName]       VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [CreatedBy]        VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [CreatedDate]      DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [ChangedBy]        VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [ChangedDate]      DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [Version]          VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [Notes]            VARCHAR (384)   NULL,
    [ConactPhone]      VARCHAR (15)    CONSTRAINT [DF_POHeader_ContactPhone] DEFAULT ('') NOT NULL,
    [CurrentStatus]    CHAR (1)        CONSTRAINT [DF_POHeader_CurrentStatus] DEFAULT ('O') NOT NULL,
    [PrintedBy]        CHAR (4)        CONSTRAINT [DF_POHeader_PrintedBy] DEFAULT ('') NOT NULL,
    [PrintedDate]      DATETIME2 (7)   CONSTRAINT [DF_POHeader_PrintedDate] DEFAULT ('0001-01-01') NOT NULL,
    [AcknowledgedBy]   CHAR (4)        CONSTRAINT [DF_POHeader_AcknowledgedBy] DEFAULT ('') NOT NULL,
    [AcknowledgedDate] DATETIME2 (7)   CONSTRAINT [DF_POHeader_AcknowledgedDate] DEFAULT ('0001-01-01') NOT NULL,
    [ReviseddBy]       CHAR (4)        CONSTRAINT [DF_POHeader_RevisedBy] DEFAULT ('') NOT NULL,
    [RevisedDate]      DATETIME2 (7)   CONSTRAINT [DF_POHeader_RevisedDate] DEFAULT ('0001-01-01') NOT NULL,
    CONSTRAINT [POHEADER_INDEX01] PRIMARY KEY CLUSTERED ([VENDOR_ID] ASC, [PO_#] ASC) WITH (FILLFACTOR = 100)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [POHEADER_INDEX00]
    ON [dbo].[POHEADER]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POHEADER_INDEX02]
    ON [dbo].[POHEADER]([PO_TYPE] ASC, [VENDOR_ID] ASC, [PO_#] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POHEADER_INDEX03]
    ON [dbo].[POHEADER]([WO_#] ASC, [VENDOR_ID] ASC, [PO_#] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POHEADER_INDEX04]
    ON [dbo].[POHEADER]([PO_#] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POHEADER_INDEX05]
    ON [dbo].[POHEADER]([WO_#] ASC, [WO_LINE#] ASC, [VENDOR_ID] ASC, [PO_#] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POHEADER_INDEX06]
    ON [dbo].[POHEADER]([VENDOR_ID] ASC, [PO_#] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POHEADER_INDEX07]
    ON [dbo].[POHEADER]([WO_#] ASC, [PO_#] ASC) WITH (FILLFACTOR = 70);

