﻿CREATE TABLE [dbo].[APVENDOR] (
    [Recnum]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [COMPANY_#]       VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]      VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [VENDOR_#]        VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [VENDOR_NAME]     VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [VENDOR_ADDR1]    VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [VENDOR_ADDR2]    VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [VENDOR_CITY]     VARCHAR (17)    DEFAULT (' ') NOT NULL,
    [STATE]           VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [ZIP]             VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [PHONE_NUMBER]    VARCHAR (13)    DEFAULT (' ') NOT NULL,
    [CONTACT]         VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [YTD_PURCHASES]   DECIMAL (12, 2) NOT NULL,
    [YTD_PAYMENTS]    DECIMAL (12, 2) NOT NULL,
    [YTD_BALANCE]     DECIMAL (12, 2) NOT NULL,
    [YTD_TAX]         DECIMAL (12, 2) NOT NULL,
    [YTD_DISCOUNT]    DECIMAL (12, 2) NOT NULL,
    [YTD_FREIGHT]     DECIMAL (12, 2) NOT NULL,
    [YTD_CREDITS]     DECIMAL (12, 2) NOT NULL,
    [DATE_LAST_PAID]  DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [AMT_LAST_PAID]   DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [LAST_CHECK]      DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [APPLIED_CREDIT]  DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [FLAG_1099]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [FEDID]           VARCHAR (11)    DEFAULT (' ') NOT NULL,
    [MANUAL_CHECKNUM] DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [TERMS_TYPE]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [TERMS_DAYS]      DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [TERMS_PERCENT]   DECIMAL (8, 4)  DEFAULT ((0)) NOT NULL,
    [VOUCHERS_PAID]   DECIMAL (12, 2) NOT NULL,
    [CREDITS_TAKEN]   DECIMAL (12, 2) NOT NULL,
    [DUE_DAYS]        DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [PAY_TYPE_FLAG]   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [ID]              DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APCOMPAN_ID]     DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [INACTIVE_FLAG]   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EMail]           VARCHAR (100)   DEFAULT (' ') NOT NULL,
    [FaxNumber]       VARCHAR (12)    DEFAULT (' ') NOT NULL,
    [POVendorID]      VARCHAR (8)     NULL,
    [CHECK_TYPE]      VARCHAR (1)     NULL,
    [CONTACT2]        VARCHAR (20)    NULL,
    [PHONE_NUMBER2]   VARCHAR (13)    NULL,
    [EMAIL2]          VARCHAR (100)   NULL,
    [CONTACT3]        VARCHAR (20)    NULL,
    [PHONE_NUMBER3]   VARCHAR (13)    NULL,
    [EMAIL3]          VARCHAR (100)   NULL,
    [NOTES]           VARCHAR (1024)  NULL,
    CONSTRAINT [APVENDOR_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [VENDOR_#] ASC) WITH (FILLFACTOR = 70)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [APVENDOR_INDEX00]
    ON [dbo].[APVENDOR]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APVENDOR_INDEX02]
    ON [dbo].[APVENDOR]([VENDOR_#] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APVENDOR_INDEX03]
    ON [dbo].[APVENDOR]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APVENDOR_INDEX04]
    ON [dbo].[APVENDOR]([APCOMPAN_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APVENDOR_INDEX05]
    ON [dbo].[APVENDOR]([VENDOR_NAME] ASC, [ID] ASC) WITH (FILLFACTOR = 70);
