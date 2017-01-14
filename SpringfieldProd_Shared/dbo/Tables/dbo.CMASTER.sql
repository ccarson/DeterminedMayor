CREATE TABLE [dbo].[CMASTER] (
    [Recnum]                BIGINT          IDENTITY (1, 1) NOT NULL,
    [CUSTID]                VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [BNAME]                 VARCHAR (36)    DEFAULT (' ') NOT NULL,
    [BSTREET]               VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [BSTREET2]              VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [BCITY]                 VARCHAR (30)    NOT NULL,
    [BSTATE]                VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [BZIP]                  VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [COUNTRY]               VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [FFLEXPR]               DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [ACCTYPE]               VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CLASS]                 VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CONTACT_NAME_1]        VARCHAR (36)    DEFAULT (' ') NOT NULL,
    [PHONE]                 VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [CONTACT_NAME_2]        VARCHAR (36)    DEFAULT (' ') NOT NULL,
    [PHONE_2]               VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [FAX_NUMBER]            VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [ILLTAX]                VARCHAR (12)    DEFAULT (' ') NOT NULL,
    [YTDSHIP]               DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [YTDPAY]                DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [TELESTAT]              VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [TELEWHO]               VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [FFLNUM]                VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [LPAYOPEN]              DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [LPAYCOD]               DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [STOCKING]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EXCISE_FLAG]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DISCOUNT]              DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [TIME_ZONE]             DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [TERMS]                 VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [GROUP_CODE]            VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [PROF_GUNSMITH]         DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [MATCH_FLAG]            VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DL_NUMBER]             VARCHAR (25)    DEFAULT (' ') NOT NULL,
    [DL_STATE]              VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [CUSTYPE]               VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [NOW]                   DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OTHIRTY]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OSIXTY]                DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [ONINETY]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [O1TWENTY]              DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [FINANCE]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [LASTCALC]              DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [FIRSTPUR]              DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [HICREDIT]              DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [CRLIMIT]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [TOTPAID]               DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PAIDNOW]               DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PAID30]                DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PAID60]                DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PAID90]                DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PAID120]               DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [INTRATE]               DECIMAL (6, 4)  DEFAULT ((0)) NOT NULL,
    [WFINANCE]              DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [CURBAL]                DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [N1]                    VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N2]                    VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N3]                    VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N4]                    VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N5]                    VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [LABEL_FLAG]            VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [YTDBILL]               DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DELETE_FLAG]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [MEDIA_CODE]            VARCHAR (6)     DEFAULT (' ') NOT NULL,
    [ACCRUAL_DISC]          DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [SALES_TAX_DATE]        DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [EXCISE_#]              VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [EXCISE_DATE]           DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [CREDIT_DATE]           DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [STATEID]               VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [EMAIL]                 VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [REP_ID]                VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [SA_REP]                VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [ADDED_REP]             VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [DATE_ADDED]            DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [TOTALAMOUNTDUE]        DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [PAIDCURRENTPER]        DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [PAID30PER]             DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [PAID60PER]             DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [PAID90PER]             DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [PAID120PER]            DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [ONMAILING_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [APPLYSHIPPING]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [WEBSITE]               VARCHAR (80)    DEFAULT (' ') NOT NULL,
    [LAST_NAME]             VARCHAR (25)    DEFAULT (' ') NOT NULL,
    [FIRST_NAME]            VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [Customer_Type]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [TAX_FORM_EXP]          DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [USERINITIALS]          VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [DUE_0_20]              DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DUE_21_30]             DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DUE_31_45]             DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DUE_46_60]             DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DUE_60PLUS]            DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [PriceType]             VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [DefaultPrice]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EMailInvoice]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EMailMerge]            VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EMailSubject]          VARCHAR (80)    DEFAULT (' ') NOT NULL,
    [CreatedBy]             VARCHAR (4)     NULL,
    [CreatedDate]           DATE            NULL,
    [ChangedBy]             VARCHAR (4)     NULL,
    [ChangedDate]           DATE            NULL,
    [Version]               VARCHAR (15)    NULL,
    [BuyGroup]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [BuyGroupNum]           BIGINT          DEFAULT ((0)) NOT NULL,
    [OptInRecallEmails]     VARCHAR (1)     NULL,
    [OptInEmails]           VARCHAR (1)     NULL,
    [OptInRecallEmailsDate] DATETIME        DEFAULT ('1753-01-01') NULL,
    [OptInEmailsDate]       DATETIME        DEFAULT ('1753-01-01') NOT NULL,
    [ExternalCustID]        BIGINT          DEFAULT ((0)) NOT NULL,
    [ShipDestinationType]   VARCHAR (1)     NULL,
    [Hold]                  VARCHAR (1)     NULL,
    [HoldDate]              DATETIME        NULL,
    [HoldReason]            VARCHAR (256)   NULL,
    [PostType]              VARCHAR (2)     NULL,
    [ShipUPS]               VARCHAR (1)     NULL,
    [HoldBy]                VARCHAR (4)     NULL,
    [ShipApprovalRequired]  VARCHAR (1)     NULL,
    [ExternalCustType]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [AssuredDiscount]       NUMERIC (6, 4)  NULL,
    [ADToDiscountedOnly]    VARCHAR (1)     NULL,
    [DealerAgentID]         BIGINT          DEFAULT ((0)) NOT NULL,
    [DealerRegionID]        BIGINT          DEFAULT ((0)) NOT NULL,
    CONSTRAINT [CMASTER_INDEX01] PRIMARY KEY CLUSTERED ([CUSTID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_CMASTER_PriceType] FOREIGN KEY ([PriceType]) REFERENCES [dbo].[PLTypes] ([PriceType])
);





GO
ALTER TABLE [dbo].[CMASTER] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


GO


GO


CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX00]
    ON [dbo].[CMASTER]([Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX02]
    ON [dbo].[CMASTER]([BNAME] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX03]
    ON [dbo].[CMASTER]([BSTATE] ASC, [YTDSHIP] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX04]
    ON [dbo].[CMASTER]([GROUP_CODE] ASC, [CUSTID] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX05]
    ON [dbo].[CMASTER]([BZIP] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX06]
    ON [dbo].[CMASTER]([YTDSHIP] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX07]
    ON [dbo].[CMASTER]([BSTATE] ASC, [BNAME] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX08]
    ON [dbo].[CMASTER]([TELEWHO] ASC, [BNAME] ASC, [CUSTID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX09]
    ON [dbo].[CMASTER]([TELEWHO] ASC, [YTDSHIP] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX10]
    ON [dbo].[CMASTER]([BSTATE] ASC, [BZIP] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX11]
    ON [dbo].[CMASTER]([REP_ID] ASC, [BSTATE] ASC, [CUSTID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX12]
    ON [dbo].[CMASTER]([Customer_Type] ASC, [CUSTID] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX13]
    ON [dbo].[CMASTER]([CUSTYPE] ASC, [BNAME] ASC, [CUSTID] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX15]
    ON [dbo].[CMASTER]([ExternalCustType] ASC, [ExternalCustID] ASC, [CUSTID] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX14]
    ON [dbo].[CMASTER]([PriceType] ASC, [CUSTID] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX16]
    ON [dbo].[CMASTER]([BuyGroup] ASC, [BuyGroupNum] ASC, [CUSTID] ASC) ;
