﻿CREATE TABLE [dbo].[APCHECK] (
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
    [ID]              DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APCOMPAN_ID]     DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APPERM_ID]       DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    CONSTRAINT [APCHECK_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [VENDOR_#] ASC, [INVOICE_#] ASC, [VOUCH_FLAG] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_APCHECK_APPERM_ID] FOREIGN KEY ([APPERM_ID]) REFERENCES [dbo].[APPerm] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCHECK_INDEX00]
    ON [dbo].[APCHECK]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCHECK_INDEX02]
    ON [dbo].[APCHECK]([COMPANY_#] ASC, [DIVISION_#] ASC, [VENDOR_#] ASC, [CHECK_NO] ASC, [ID] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCHECK_INDEX03]
    ON [dbo].[APCHECK]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCHECK_INDEX04]
    ON [dbo].[APCHECK]([APCOMPAN_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCHECK_INDEX05]
    ON [dbo].[APCHECK]([APPERM_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);
