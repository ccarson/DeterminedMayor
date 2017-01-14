CREATE TABLE [dbo].[RecallDealer] (
    [RECNUM]                BIGINT          IDENTITY (1, 1) NOT NULL,
    [CUSTID]                BIGINT          CONSTRAINT [DF__RecallDea__CUSTI__0EC68771] DEFAULT ((0)) NOT NULL,
    [BNAME]                 VARCHAR (36)    CONSTRAINT [DF__RecallDea__BNAME__0FBAABAA] DEFAULT (' ') NOT NULL,
    [BSTREET]               VARCHAR (35)    NULL,
    [BSTREET2]              VARCHAR (35)    NULL,
    [BCITY]                 VARCHAR (20)    NULL,
    [BSTATE]                VARCHAR (2)     CONSTRAINT [DF__RecallDea__BSTAT__10AECFE3] DEFAULT (' ') NOT NULL,
    [BZIP]                  VARCHAR (10)    CONSTRAINT [DF__RecallDeal__BZIP__11A2F41C] DEFAULT (' ') NOT NULL,
    [COUNTRY]               VARCHAR (15)    NULL,
    [FFLEXPR]               DATE            NULL,
    [ACCTYPE]               VARCHAR (1)     NULL,
    [CLASS]                 VARCHAR (1)     CONSTRAINT [DF__RecallDea__CLASS__12971855] DEFAULT (' ') NOT NULL,
    [CONTACT_NAME_1]        VARCHAR (36)    NULL,
    [PHONE]                 VARCHAR (10)    NULL,
    [CONTACT_NAME_2]        VARCHAR (36)    NULL,
    [PHONE_2]               VARCHAR (10)    NULL,
    [FAX_NUMBER]            VARCHAR (10)    NULL,
    [ILLTAX]                VARCHAR (12)    NULL,
    [YTDSHIP]               NUMERIC (12, 2) CONSTRAINT [DF__RecallDea__YTDSH__138B3C8E] DEFAULT ((0)) NOT NULL,
    [YTDPAY]                NUMERIC (12, 2) NULL,
    [TELESTAT]              VARCHAR (2)     NULL,
    [TELEWHO]               VARCHAR (4)     CONSTRAINT [DF__RecallDea__TELEW__147F60C7] DEFAULT (' ') NOT NULL,
    [FFLNUM]                VARCHAR (10)    NULL,
    [LPAYOPEN]              DATE            NULL,
    [LPAYCOD]               DATE            NULL,
    [STOCKING]              VARCHAR (1)     CONSTRAINT [DF__RecallDea__STOCK__15738500] DEFAULT (' ') NOT NULL,
    [EXCISE_FLAG]           VARCHAR (1)     NULL,
    [DISCOUNT]              NUMERIC (4, 2)  NULL,
    [TIME_ZONE]             TINYINT         NULL,
    [TERMS]                 VARCHAR (15)    NULL,
    [GROUP_CODE]            VARCHAR (10)    CONSTRAINT [DF__RecallDea__GROUP__1667A939] DEFAULT (' ') NOT NULL,
    [PROF_GUNSMITH]         DATE            NULL,
    [MATCH_FLAG]            VARCHAR (1)     NULL,
    [DL_NUMBER]             VARCHAR (25)    NULL,
    [DL_STATE]              VARCHAR (2)     NULL,
    [CUSTYPE]               VARCHAR (1)     CONSTRAINT [DF__RecallDea__CUSTY__175BCD72] DEFAULT (' ') NOT NULL,
    [NOW]                   NUMERIC (10, 2) NULL,
    [OTHIRTY]               NUMERIC (10, 2) NULL,
    [OSIXTY]                NUMERIC (10, 2) NULL,
    [ONINETY]               NUMERIC (10, 2) NULL,
    [O1TWENTY]              NUMERIC (10, 2) NULL,
    [FINANCE]               NUMERIC (10, 2) NULL,
    [LASTCALC]              DATE            NULL,
    [FIRSTPUR]              DATE            NULL,
    [HICREDIT]              NUMERIC (10, 2) NULL,
    [CRLIMIT]               NUMERIC (10, 2) NULL,
    [TOTPAID]               INT             NULL,
    [PAIDNOW]               INT             NULL,
    [PAID30]                INT             NULL,
    [PAID60]                INT             NULL,
    [PAID90]                INT             NULL,
    [PAID120]               INT             NULL,
    [INTRATE]               NUMERIC (6, 4)  NULL,
    [WFINANCE]              NUMERIC (10, 2) NULL,
    [CURBAL]                NUMERIC (10, 2) NULL,
    [N1]                    VARCHAR (35)    NULL,
    [N2]                    VARCHAR (35)    NULL,
    [N3]                    VARCHAR (35)    NULL,
    [N4]                    VARCHAR (35)    NULL,
    [N5]                    VARCHAR (35)    NULL,
    [LABEL_FLAG]            VARCHAR (1)     NULL,
    [YTDBILL]               NUMERIC (12, 2) NULL,
    [DELETE_FLAG]           VARCHAR (1)     NULL,
    [MEDIA_CODE]            VARCHAR (6)     NULL,
    [ACCRUAL_DISC]          NUMERIC (6, 2)  NULL,
    [SALES_TAX_DATE]        DATE            CONSTRAINT [DF__RecallDea__SALES__184FF1AB] DEFAULT ('0001-01-01') NOT NULL,
    [EXCISE_#]              VARCHAR (20)    NULL,
    [EXCISE_DATE]           DATE            NULL,
    [CREDIT_DATE]           DATE            NULL,
    [STATEID]               VARCHAR (4)     CONSTRAINT [DF__RecallDea__STATE__194415E4] DEFAULT (' ') NOT NULL,
    [EMAIL]                 VARCHAR (35)    NULL,
    [REP_ID]                VARCHAR (15)    CONSTRAINT [DF__RecallDea__REP_I__1A383A1D] DEFAULT (' ') NOT NULL,
    [SA_REP]                VARCHAR (15)    CONSTRAINT [DF__RecallDea__SA_RE__1B2C5E56] DEFAULT (' ') NOT NULL,
    [ADDED_REP]             VARCHAR (15)    NULL,
    [DATE_ADDED]            DATE            NULL,
    [TOTALAMOUNTDUE]        NUMERIC (10, 2) NULL,
    [PAIDCURRENTPER]        NUMERIC (6, 2)  NULL,
    [PAID30PER]             NUMERIC (6, 2)  NULL,
    [PAID60PER]             NUMERIC (6, 2)  NULL,
    [PAID90PER]             NUMERIC (6, 2)  NULL,
    [PAID120PER]            NUMERIC (6, 2)  NULL,
    [ONMAILING_FLAG]        VARCHAR (1)     NULL,
    [APPLYSHIPPING]         VARCHAR (1)     NULL,
    [WEBSITE]               VARCHAR (80)    NULL,
    [LAST_NAME]             VARCHAR (25)    NULL,
    [FIRST_NAME]            VARCHAR (15)    NULL,
    [Customer_Type]         VARCHAR (1)     CONSTRAINT [DF__RecallDea__Custo__1C20828F] DEFAULT (' ') NOT NULL,
    [TAX_FORM_EXP]          DATE            NULL,
    [USERINITIALS]          VARCHAR (4)     NULL,
    [DUE_0_20]              NUMERIC (12, 2) NULL,
    [DUE_21_30]             NUMERIC (12, 2) NULL,
    [DUE_31_45]             NUMERIC (12, 2) NULL,
    [DUE_46_60]             NUMERIC (12, 2) NULL,
    [DUE_60PLUS]            NUMERIC (12, 2) NULL,
    [PriceType]             VARCHAR (20)    CONSTRAINT [DF__RecallDea__Price__1D14A6C8] DEFAULT (' ') NOT NULL,
    [DefaultPrice]          VARCHAR (1)     NULL,
    [EMailInvoice]          VARCHAR (1)     NULL,
    [EMailMerge]            VARCHAR (1)     NULL,
    [EMailSubject]          VARCHAR (80)    NULL,
    [CreatedBy]             VARCHAR (4)     NULL,
    [CreatedDate]           DATE            NULL,
    [ChangedBy]             VARCHAR (4)     NULL,
    [ChangedDate]           DATE            NULL,
    [Version]               VARCHAR (15)    NULL,
    [BuyGroup]              VARCHAR (1)     NULL,
    [BuyGroupNum]           BIGINT          NULL,
    [OptInRecallEmails]     VARCHAR (1)     NULL,
    [OptInEmails]           VARCHAR (1)     NULL,
    [OptInRecallEmailsDate] DATE            NULL,
    [OptInEmailsDate]       DATE            NULL,
    [WebCustID]             BIGINT          CONSTRAINT [DF__RecallDea__WebCu__1E08CB01] DEFAULT ((0)) NOT NULL,
    [Status]                VARCHAR (1)     NULL,
    [StatusDate]            DATETIME        NULL,
    [StatusChangedBy]       VARCHAR (4)     NULL,
    CONSTRAINT [RecallDealer_INDEX01] PRIMARY KEY CLUSTERED ([CUSTID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX00]
    ON [dbo].[RecallDealer]([RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX02]
    ON [dbo].[RecallDealer]([BNAME] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX03]
    ON [dbo].[RecallDealer]([BSTATE] ASC, [YTDSHIP] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX04]
    ON [dbo].[RecallDealer]([GROUP_CODE] ASC, [CUSTID] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX05]
    ON [dbo].[RecallDealer]([BZIP] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX06]
    ON [dbo].[RecallDealer]([YTDSHIP] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX07]
    ON [dbo].[RecallDealer]([BSTATE] ASC, [BNAME] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX08]
    ON [dbo].[RecallDealer]([TELEWHO] ASC, [BNAME] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX09]
    ON [dbo].[RecallDealer]([TELEWHO] ASC, [YTDSHIP] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX10]
    ON [dbo].[RecallDealer]([BSTATE] ASC, [BZIP] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX11]
    ON [dbo].[RecallDealer]([REP_ID] ASC, [SA_REP] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX12]
    ON [dbo].[RecallDealer]([Customer_Type] ASC, [CUSTID] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX13]
    ON [dbo].[RecallDealer]([CUSTYPE] ASC, [BNAME] ASC, [CUSTID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX14]
    ON [dbo].[RecallDealer]([PriceType] ASC, [CUSTID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallDealer_INDEX15]
    ON [dbo].[RecallDealer]([WebCustID] ASC, [CUSTID] ASC) WITH (FILLFACTOR = 70);

