﻿CREATE TABLE [dbo].[APPAID] (
    [Recnum]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [COMPANY_#]       VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]      VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [VENDOR_#]        VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [INVOICE_#]       VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [VOUCH_FLAG]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CHECK_DATE]      DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [CHECK_NO]        DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [INVOICE_DATE]    DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [AMOUNT_DUE]      DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [DISCOUNT_AMOUNT] DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [NET_AMOUNT]      DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [VOUCHER_DATE]    DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [MANUAL_FLAG]     VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [VENDOR_NAME]     VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [ID]              DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APPERM_ID]       DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APCOMPAN_ID]     DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    CONSTRAINT [APPAID_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [VENDOR_#] ASC, [CHECK_NO] ASC, [INVOICE_#] ASC, [ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPAID_INDEX00]
    ON [dbo].[APPAID]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPAID_INDEX02]
    ON [dbo].[APPAID]([CHECK_DATE] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPAID_INDEX03]
    ON [dbo].[APPAID]([CHECK_NO] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPAID_INDEX04]
    ON [dbo].[APPAID]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPAID_INDEX05]
    ON [dbo].[APPAID]([APPERM_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPAID_INDEX06]
    ON [dbo].[APPAID]([APCOMPAN_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

