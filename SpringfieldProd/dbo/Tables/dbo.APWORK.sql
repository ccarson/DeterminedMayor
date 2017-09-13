﻿CREATE TABLE [dbo].[APWORK] (
    [Recnum]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [COMPANY_#]    VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]   VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVID]        VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [DEPARTMENT_#] VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [ACCOUNT_#]    VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [VENDOR_#]     VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [INVOICE_#]    VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [VOUCHER_DATE] DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [VOUCH_FLAG]   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CREDIT_BAL]   DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [DEBIT_BAL]    DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [INVOICE_DATE] DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [ID]           DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [GLXREF_ID]    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APCOMPAN_ID]  DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    CONSTRAINT [APWORK_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [DEPARTMENT_#] ASC, [ACCOUNT_#] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_APWORK_GLXREF_ID] FOREIGN KEY ([GLXREF_ID]) REFERENCES [dbo].[GLXREF] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APWORK_INDEX00]
    ON [dbo].[APWORK]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APWORK_INDEX02]
    ON [dbo].[APWORK]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APWORK_INDEX03]
    ON [dbo].[APWORK]([GLXREF_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APWORK_INDEX04]
    ON [dbo].[APWORK]([APCOMPAN_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);
