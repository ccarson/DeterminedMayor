﻿CREATE TABLE [dbo].[APPERLED] (
    [Recnum]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [COMPANY_#]   VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]  VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [VENDOR_#]    VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [INVOICE_#]   VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [VOUCH_FLAG]  VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [LINE_#]      DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [COMP_#]      VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIV_#]       VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DEPT_#]      VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [ACCOUNT_#]   VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [AMOUNT]      DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [PO_#]        DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PO_LINE_#]   DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [COST_CLOSE]  VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [QTY]         DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [DESCRIPTION] VARCHAR (25)    DEFAULT (' ') NOT NULL,
    [ID]          DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APPERM_ID]   DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APCOMPAN_ID] DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [GLXREF_ID]   DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    CONSTRAINT [APPERLED_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [VENDOR_#] ASC, [INVOICE_#] ASC, [VOUCH_FLAG] ASC, [LINE_#] ASC, [ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPERLED_INDEX00]
    ON [dbo].[APPERLED]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPERLED_INDEX02]
    ON [dbo].[APPERLED]([COMP_#] ASC, [DIV_#] ASC, [DEPT_#] ASC, [ACCOUNT_#] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPERLED_INDEX03]
    ON [dbo].[APPERLED]([PO_#] ASC, [PO_LINE_#] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPERLED_INDEX04]
    ON [dbo].[APPERLED]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPERLED_INDEX05]
    ON [dbo].[APPERLED]([APPERM_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPERLED_INDEX06]
    ON [dbo].[APPERLED]([APCOMPAN_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APPERLED_INDEX07]
    ON [dbo].[APPERLED]([GLXREF_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

